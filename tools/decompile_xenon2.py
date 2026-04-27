from __future__ import annotations

import argparse
import json
import re
import struct
from collections import deque
from dataclasses import dataclass
from pathlib import Path

from capstone import Cs, CS_ARCH_X86, CS_GRP_CALL, CS_GRP_JUMP, CS_GRP_RET, CS_MODE_16
from capstone.x86 import X86_OP_IMM


@dataclass
class MzHeader:
    cblp: int
    cp: int
    crlc: int
    cparhdr: int
    minalloc: int
    maxalloc: int
    ss: int
    sp: int
    csum: int
    ip: int
    cs: int
    lfarlc: int
    ovno: int

    @property
    def header_size_bytes(self) -> int:
        return self.cparhdr * 16

    def executable_size_bytes(self) -> int:
        if self.cblp == 0:
            return self.cp * 512
        return (self.cp - 1) * 512 + self.cblp

    @property
    def entry_offset(self) -> int:
        return self.cs * 16 + self.ip

    @property
    def stack_offset(self) -> int:
        return self.ss * 16 + self.sp


def parse_mz_header(data: bytes) -> MzHeader:
    if len(data) < 28:
        raise ValueError("File too small for MZ header")

    values = struct.unpack_from("<14H", data, 0)
    e_magic = values[0]
    if e_magic != 0x5A4D:
        raise ValueError("Not an MZ executable")

    return MzHeader(
        cblp=values[1],
        cp=values[2],
        crlc=values[3],
        cparhdr=values[4],
        minalloc=values[5],
        maxalloc=values[6],
        ss=values[7],
        sp=values[8],
        csum=values[9],
        ip=values[10],
        cs=values[11],
        lfarlc=values[12],
        ovno=values[13],
    )


def extract_ascii_strings(blob: bytes, min_len: int = 4) -> list[tuple[int, str]]:
    pattern = re.compile(rb"[\x20-\x7E]{" + str(min_len).encode("ascii") + rb",}")
    return [(match.start(), match.group().decode("ascii", errors="ignore")) for match in pattern.finditer(blob)]


def single_path_disasm(module: bytes, start: int, max_instructions: int = 1200) -> list[str]:
    md = Cs(CS_ARCH_X86, CS_MODE_16)
    lines: list[str] = []

    offset = start
    for _ in range(max_instructions):
        if offset >= len(module):
            break

        chunk = module[offset:]
        insns = list(md.disasm(chunk, offset, count=1))
        if not insns:
            break

        insn = insns[0]
        bytes_hex = insn.bytes.hex(" ")
        lines.append(f"{insn.address:05X}: {bytes_hex:<24} {insn.mnemonic} {insn.op_str}".rstrip())
        offset = insn.address + insn.size

        if insn.mnemonic.startswith("ret"):
            break

    return lines


def recursive_disasm(module: bytes, entry_offset: int) -> tuple[list[str], set[int]]:
    md = Cs(CS_ARCH_X86, CS_MODE_16)
    md.detail = True

    queue: deque[int] = deque([entry_offset])
    visited_blocks: set[int] = set()
    visited_instructions: set[int] = set()
    discovered_functions: set[int] = {entry_offset}
    output_lines: list[str] = []

    while queue:
        block_start = queue.popleft()
        if block_start in visited_blocks or not (0 <= block_start < len(module)):
            continue

        visited_blocks.add(block_start)
        output_lines.append(f"\n; basic_block_{block_start:05X}")
        cursor = block_start

        for _ in range(1024):
            if cursor >= len(module) or cursor in visited_instructions:
                break

            insns = list(md.disasm(module[cursor:], cursor, count=1))
            if not insns:
                break

            insn = insns[0]
            visited_instructions.add(insn.address)
            bytes_hex = insn.bytes.hex(" ")
            output_lines.append(f"{insn.address:05X}: {bytes_hex:<24} {insn.mnemonic} {insn.op_str}".rstrip())

            is_ret = CS_GRP_RET in insn.groups or insn.mnemonic.startswith("ret")
            is_jump = CS_GRP_JUMP in insn.groups
            is_call = CS_GRP_CALL in insn.groups

            targets: list[int] = []
            if is_jump or is_call:
                for operand in insn.operands:
                    if operand.type == X86_OP_IMM:
                        target = int(operand.imm)
                        if 0 <= target < len(module):
                            targets.append(target)

            for target in targets:
                queue.append(target)
                if is_call:
                    discovered_functions.add(target)

            next_cursor = insn.address + insn.size

            if is_call and next_cursor < len(module):
                queue.append(next_cursor)

            if is_jump:
                if insn.mnemonic != "jmp" and next_cursor < len(module):
                    queue.append(next_cursor)
                break

            if is_ret:
                break

            cursor = next_cursor

    return output_lines, discovered_functions


def emit_pseudocode(module: bytes, functions: set[int], out_file: Path) -> None:
    md = Cs(CS_ARCH_X86, CS_MODE_16)

    with out_file.open("w", encoding="utf-8", newline="\n") as handle:
        handle.write("/*\n")
        handle.write(" * Auto-generated pseudo-C view from 16-bit DOS disassembly.\n")
        handle.write(" * This is a reverse-engineering aid, not compilable C.\n")
        handle.write(" */\n\n")

        for fn in sorted(functions):
            handle.write(f"void sub_{fn:05X}(void) {{\n")
            cursor = fn
            for _ in range(32):
                if cursor >= len(module):
                    break
                insns = list(md.disasm(module[cursor:], cursor, count=1))
                if not insns:
                    break
                insn = insns[0]
                handle.write(f"    /* {insn.address:05X}: {insn.mnemonic} {insn.op_str} */\n")
                cursor = insn.address + insn.size
                if insn.mnemonic.startswith("ret"):
                    break
            handle.write("}\n\n")


def write_text(path: Path, lines: list[str]) -> None:
    path.write_text("\n".join(lines) + "\n", encoding="utf-8", newline="\n")


def run(exe_path: Path, output_dir: Path) -> None:
    data = exe_path.read_bytes()
    header = parse_mz_header(data)

    exe_size = min(header.executable_size_bytes(), len(data))
    module_start = header.header_size_bytes
    module = data[module_start:exe_size]

    output_dir.mkdir(parents=True, exist_ok=True)

    metadata = {
        "input_file": str(exe_path),
        "file_size_bytes": len(data),
        "mz_header": {
            "e_cblp": header.cblp,
            "e_cp": header.cp,
            "e_crlc": header.crlc,
            "e_cparhdr": header.cparhdr,
            "e_minalloc": header.minalloc,
            "e_maxalloc": header.maxalloc,
            "e_ss": header.ss,
            "e_sp": header.sp,
            "e_csum": header.csum,
            "e_ip": header.ip,
            "e_cs": header.cs,
            "e_lfarlc": header.lfarlc,
            "e_ovno": header.ovno,
        },
        "computed": {
            "header_size_bytes": header.header_size_bytes,
            "executable_size_bytes": exe_size,
            "load_module_size_bytes": len(module),
            "entry_offset_in_module": header.entry_offset,
            "stack_offset_in_module": header.stack_offset,
        },
    }

    (output_dir / "mz_header.json").write_text(json.dumps(metadata, indent=2), encoding="utf-8", newline="\n")

    strings = extract_ascii_strings(module)
    write_text(
        output_dir / "strings.txt",
        [f"{offset:05X}: {text}" for offset, text in strings],
    )

    entry_lines = single_path_disasm(module, header.entry_offset)
    write_text(output_dir / "entry_disasm.asm", entry_lines)

    recursive_lines, functions = recursive_disasm(module, header.entry_offset)
    write_text(output_dir / "recursive_disasm.asm", recursive_lines)

    write_text(
        output_dir / "discovered_functions.txt",
        [f"sub_{fn:05X}" for fn in sorted(functions)],
    )

    emit_pseudocode(module, functions, output_dir / "decompiled_pseudocode.c")

    summary_lines = [
        "# Xenon2 EXE Decompilation Summary",
        "",
        f"- Input EXE: {exe_path}",
        f"- Output directory: {output_dir}",
        f"- Module bytes analyzed: {len(module)}",
        f"- Entry offset (module): 0x{header.entry_offset:05X}",
        f"- Candidate function starts discovered: {len(functions)}",
        f"- ASCII strings extracted: {len(strings)}",
        "",
        "## Generated Artifacts",
        "- mz_header.json",
        "- strings.txt",
        "- entry_disasm.asm",
        "- recursive_disasm.asm",
        "- discovered_functions.txt",
        "- decompiled_pseudocode.c",
    ]
    write_text(output_dir / "README.md", summary_lines)


def main() -> None:
    parser = argparse.ArgumentParser(description="Decompile/disassemble Xenon2 DOS EXE to analysis artifacts")
    parser.add_argument("--exe", required=True, help="Path to XENON2.EXE")
    parser.add_argument("--out", required=True, help="Output folder for artifacts")
    args = parser.parse_args()

    run(Path(args.exe).resolve(), Path(args.out).resolve())


if __name__ == "__main__":
    main()
