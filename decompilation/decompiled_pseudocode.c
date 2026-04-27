/*
 * Auto-generated pseudo-C view from 16-bit DOS disassembly.
 * This is a reverse-engineering aid, not compilable C.
 */

void sub_00000(void) {
    /* 00000: mov ax, ds */
    /* 00002: mov es, ax */
    /* 00004: mov cx, 8 */
    /* 00007: mov di, 0x8e58 */
    /* 0000A: mov al, 0xff */
    /* 0000C: rep stosb byte ptr es:[di], al */
    /* 0000E: mov ax, 0x1a00 */
    /* 00011: int 0x10 */
    /* 00013: cmp al, 0x1a */
    /* 00015: jne 0x32 */
    /* 00017: cmp bl, bh */
    /* 00019: jae 0x1d */
    /* 0001B: mov bl, bh */
    /* 0001D: cmp bl, 0xb */
    /* 00020: jb 0x2c */
    /* 00022: cmp bl, 0xc */
    /* 00025: ja 0x2c */
    /* 00027: mov byte ptr [0x8e5a], 0 */
    /* 0002C: mov byte ptr [0x8e58], 0 */
    /* 00031: ret  */
}

void sub_00067(void) {
    /* 00067: mov bl, 0x10 */
    /* 00069: mov ah, 0x12 */
    /* 0006B: int 0x10 */
    /* 0006D: cmp bl, 0x10 */
    /* 00070: je 0x83 */
    /* 00072: mov ah, 0x12 */
    /* 00074: mov bl, 0x10 */
    /* 00076: int 0x10 */
    /* 00078: cmp bl, 3 */
    /* 0007B: jae 0x82 */
    /* 0007D: mov byte ptr [0x8e5e], 0 */
    /* 00082: ret  */
}

void sub_00089(void) {
    /* 00089: mov dx, 0x3d4 */
    /* 0008C: call 0x101 */
    /* 0008F: jae 0x96 */
    /* 00091: mov byte ptr [0x8e5b], 0 */
    /* 00096: ret  */
}

void sub_00097(void) {
    /* 00097: mov bx, 0xb800 */
    /* 0009A: mov es, bx */
    /* 0009C: xor di, di */
    /* 0009E: push word ptr es:[0] */
    /* 000A3: mov word ptr es:[0], 0x414a */
    /* 000AA: int 0x12 */
    /* 000AC: add ax, 0x3f */
    /* 000AF: and ax, 0xffc0 */
    /* 000B2: sub ax, 0x40 */
    /* 000B5: mov cl, 6 */
    /* 000B7: shl ax, cl */
    /* 000B9: mov es, ax */
    /* 000BB: mov dx, ax */
    /* 000BD: mov ax, 0x414a */
    /* 000C0: mov cx, 0x8000 */
    /* 000C3: repne scasw ax, word ptr es:[di] */
    /* 000C5: je 0xd6 */
    /* 000C7: mov es, bx */
    /* 000C9: xor di, di */
    /* 000CB: pop word ptr es:[0] */
    /* 000D0: mov byte ptr [0x8e58], 0 */
    /* 000D5: ret  */
}

void sub_00101(void) {
    /* 00101: mov al, 0xf */
    /* 00103: out dx, al */
    /* 00104: out dx, al */
    /* 00105: inc dx */
    /* 00106: in al, dx */
    /* 00107: mov ah, al */
    /* 00109: mov al, 0x66 */
    /* 0010B: out dx, al */
    /* 0010C: mov cx, 0x100 */
    /* 0010F: loop 0x10f */
    /* 00111: in al, dx */
    /* 00112: xchg ah, al */
    /* 00114: out dx, al */
    /* 00115: cmp ah, 0x66 */
    /* 00118: je 0x11b */
    /* 0011A: stc  */
    /* 0011B: ret  */
}

void sub_0011C(void) {
    /* 0011C: mov ax, 0x3d00 */
    /* 0011F: int 0x21 */
    /* 00121: jae 0x126 */
    /* 00123: jmp 0x5e04 */
    /* 00126: push ds */
    /* 00127: mov bx, 0x1565 */
    /* 0012A: mov ds, bx */
    /* 0012C: mov word ptr [0x236c], di */
    /* 00130: mov word ptr [0x236e], es */
    /* 00134: mov es, bx */
    /* 00136: mov word ptr [0x2370], ax */
    /* 00139: mov ah, 0x3f */
    /* 0013B: mov bx, word ptr [0x2370] */
    /* 0013F: mov cx, 0x200 */
    /* 00142: mov dx, 0x216c */
    /* 00145: int 0x21 */
    /* 00147: jae 0x14c */
    /* 00149: jmp 0x5e04 */
    /* 0014C: mov ax, word ptr [0x2177] */
    /* 0014F: mov word ptr [0], ax */
    /* 00152: mov ax, word ptr [0x2179] */
    /* 00155: mov word ptr [2], ax */
    /* 00158: mov al, byte ptr [0x216c] */
    /* 0015B: xor ah, ah */
    /* 0015D: add ax, 0x216e */
    /* 00160: mov word ptr [0x216a], ax */
    /* 00163: call 0x19a */
    /* 00166: mov ah, 0x3e */
    /* 00168: mov bx, word ptr [0x2370] */
    /* 0016C: int 0x21 */
    /* 0016E: pop ax */
    /* 0016F: mov ds, ax */
}

void sub_00174(void) {
    /* 00174: push di */
    /* 00175: push bx */
    /* 00176: push cx */
    /* 00177: push dx */
    /* 00178: xor ax, ax */
    /* 0017A: mov di, 0x216c */
    /* 0017D: mov cx, 0x100 */
    /* 00180: rep stosw word ptr es:[di], ax */
    /* 00182: mov bx, word ptr [0x2370] */
    /* 00186: mov cx, 0x200 */
    /* 00189: mov dx, 0x216c */
    /* 0018C: mov ah, 0x3f */
    /* 0018E: int 0x21 */
    /* 00190: jae 0x195 */
    /* 00192: jmp 0x5e04 */
    /* 00195: pop dx */
    /* 00196: pop cx */
    /* 00197: pop bx */
    /* 00198: pop di */
    /* 00199: ret  */
}

void sub_0019A(void) {
    /* 0019A: push si */
    /* 0019B: push di */
    /* 0019C: push bp */
    /* 0019D: mov ax, word ptr [0] */
    /* 001A0: or ax, word ptr [2] */
    /* 001A4: jne 0x1a9 */
    /* 001A6: jmp 0x22c */
    /* 001A9: call 0x230 */
    /* 001AC: call 0x2a8 */
    /* 001AF: mov di, 0xfc4 */
    /* 001B2: push di */
    /* 001B3: call 0x2d4 */
    /* 001B6: mov di, ax */
    /* 001B8: cmp ax, 0x100 */
    /* 001BB: jge 0x1e0 */
    /* 001BD: pop di */
    /* 001BE: push es */
    /* 001BF: push di */
    /* 001C0: les di, ptr [0x236c] */
    /* 001C4: stosb byte ptr es:[di], al */
    /* 001C5: mov word ptr [0x236c], di */
    /* 001C9: pop di */
    /* 001CA: pop es */
    /* 001CB: mov byte ptr [di + 0x112f], al */
    /* 001CF: inc di */
    /* 001D0: and di, 0xfff */
    /* 001D4: sub word ptr [0], 1 */
    /* 001D9: sbb word ptr [2], 0 */
    /* 001DE: jmp 0x21d */
    /* 001E0: call 0x34c */
    /* 001E3: mov cx, di */
    /* 001E5: pop di */
}

void sub_00230(void) {
    /* 00230: push si */
    /* 00231: push di */
    /* 00232: mov ax, ds */
    /* 00234: mov es, ax */
    /* 00236: cld  */
    /* 00237: mov ax, 1 */
    /* 0023A: mov cx, 0x13a */
    /* 0023D: mov di, 4 */
    /* 00240: rep stosw word ptr es:[di], ax */
    /* 00242: mov ax, 0x4e6 */
    /* 00245: mov dx, 0 */
    /* 00248: mov cx, 0x13a */
    /* 0024B: mov di, 0xc46 */
    /* 0024E: mov bx, 0x9d2 */
    /* 00251: stosw word ptr es:[di], ax */
    /* 00252: add ax, 2 */
    /* 00255: mov word ptr [bx], dx */
    /* 00257: add bx, 2 */
    /* 0025A: add dx, 2 */
    /* 0025D: loop 0x251 */
    /* 0025F: mov si, 0 */
    /* 00262: mov di, 2 */
    /* 00265: mov bx, 0x274 */
    /* 00268: mov cx, 0x139 */
    /* 0026B: mov ax, word ptr [si + 4] */
    /* 0026F: add ax, word ptr [di + 4] */
    /* 00273: mov word ptr [bx + 4], ax */
    /* 00277: mov word ptr [bx + 0xc46], si */
    /* 0027B: mov word ptr [si + 0x4ec], bx */
    /* 0027F: mov word ptr [di + 0x4ec], bx */
    /* 00283: add si, 4 */
    /* 00286: add di, 4 */
}

void sub_002A8(void) {
    /* 002A8: cld  */
    /* 002A9: mov di, ds */
    /* 002AB: mov es, di */
    /* 002AD: mov di, 0x112f */
    /* 002B0: mov al, 0 */
    /* 002B2: mov bx, 0xd */
    /* 002B5: mov cx, bx */
    /* 002B7: rep stosb byte ptr es:[di], al */
    /* 002B9: inc al */
    /* 002BB: jne 0x2b5 */
    /* 002BD: stosb byte ptr es:[di], al */
    /* 002BE: inc al */
    /* 002C0: jne 0x2bd */
    /* 002C2: dec al */
    /* 002C4: stosb byte ptr es:[di], al */
    /* 002C5: jne 0x2c2 */
    /* 002C7: mov cx, 0x80 */
    /* 002CA: rep stosb byte ptr es:[di], al */
    /* 002CC: mov cx, 0x80 */
    /* 002CF: mov al, 0x20 */
    /* 002D1: rep stosb byte ptr es:[di], al */
    /* 002D3: ret  */
}

void sub_002D4(void) {
    /* 002D4: mov si, word ptr [0x112a] */
    /* 002D8: mov dx, word ptr [0x112c] */
    /* 002DC: mov cl, byte ptr [0x112e] */
    /* 002E0: and cx, 0xff */
    /* 002E4: jmp 0x2f4 */
    /* 002E6: shr si, 1 */
    /* 002E8: shl dx, 1 */
    /* 002EA: adc si, 0 */
    /* 002ED: shl si, 1 */
    /* 002EF: mov si, word ptr [si + 0xc46] */
    /* 002F3: dec cx */
    /* 002F4: je 0x312 */
    /* 002F6: cmp si, 0x4e6 */
    /* 002FA: jb 0x2e6 */
    /* 002FC: mov word ptr [0x112c], dx */
    /* 00300: mov byte ptr [0x112e], cl */
    /* 00304: sub si, 0x4e6 */
    /* 00308: mov dx, si */
    /* 0030A: call 0x373 */
    /* 0030D: mov ax, dx */
    /* 0030F: shr ax, 1 */
    /* 00311: ret  */
}

void sub_0034C(void) {
    /* 0034C: call 0x3dd */
    /* 0034F: mov si, ax */
    /* 00351: mov dl, byte ptr [si + 0x2372] */
    /* 00355: mov dh, 0 */
    /* 00357: mov cl, 6 */
    /* 00359: shl dx, cl */
    /* 0035B: push dx */
    /* 0035C: mov cl, byte ptr [si + 0x2472] */
    /* 00360: mov ch, 0 */
    /* 00362: sub cx, 2 */
    /* 00365: call 0x3fd */
    /* 00368: or ax, si */
    /* 0036A: rol ax, cl */
    /* 0036C: and ax, 0x3f */
    /* 0036F: pop dx */
    /* 00370: add ax, dx */
    /* 00372: ret  */
}

void sub_00373(void) {
    /* 00373: cmp word ptr [0x4e8], 0x8000 */
    /* 00379: jb 0x37e */
    /* 0037B: call 0x423 */
    /* 0037E: mov si, word ptr [si + 0x9d2] */
    /* 00382: mov ax, word ptr [si + 4] */
    /* 00386: inc ax */
    /* 00387: mov word ptr [si + 4], ax */
    /* 0038B: lea di, [si + 2] */
    /* 0038E: cmp ax, word ptr [di + 4] */
    /* 00392: ja 0x396 */
    /* 00394: jmp 0x3d2 */
    /* 00396: inc di */
    /* 00397: inc di */
    /* 00398: cmp ax, word ptr [di + 4] */
    /* 0039C: ja 0x396 */
    /* 0039E: dec di */
    /* 0039F: dec di */
    /* 003A0: xchg word ptr [di + 4], ax */
    /* 003A4: mov word ptr [si + 4], ax */
    /* 003A8: mov bx, word ptr [si + 0xc46] */
    /* 003AC: mov word ptr [bx + 0x4ec], di */
    /* 003B0: cmp bx, 0x4e6 */
    /* 003B4: jae 0x3ba */
    /* 003B6: mov word ptr [bx + 0x4ee], di */
    /* 003BA: xchg word ptr [di + 0xc46], bx */
    /* 003BE: mov word ptr [bx + 0x4ec], si */
    /* 003C2: cmp bx, 0x4e6 */
    /* 003C6: jae 0x3cc */
    /* 003C8: mov word ptr [bx + 0x4ee], si */
    /* 003CC: mov word ptr [si + 0xc46], bx */
    /* 003D0: mov si, di */
    /* 003D2: mov si, word ptr [si + 0x4ec] */
}

void sub_003DD(void) {
    /* 003DD: mov dx, word ptr [0x112c] */
    /* 003E1: cmp byte ptr [0x112e], 8 */
    /* 003E6: jg 0x3eb */
    /* 003E8: call 0x4c9 */
    /* 003EB: xchg dh, dl */
    /* 003ED: mov ax, dx */
    /* 003EF: xor dl, dl */
    /* 003F1: mov word ptr [0x112c], dx */
    /* 003F5: sub byte ptr [0x112e], 8 */
    /* 003FA: xor ah, ah */
    /* 003FC: ret  */
}

void sub_003FD(void) {
    /* 003FD: push cx */
    /* 003FE: mov dx, word ptr [0x112c] */
    /* 00402: cmp byte ptr [0x112e], 8 */
    /* 00407: jg 0x40c */
    /* 00409: call 0x4c9 */
    /* 0040C: pop cx */
    /* 0040D: mov ax, dx */
    /* 0040F: shl dx, cl */
    /* 00411: mov word ptr [0x112c], dx */
    /* 00415: sub byte ptr [0x112e], cl */
    /* 00419: mov dx, 0xffff */
    /* 0041C: shr dx, cl */
    /* 0041E: not dx */
    /* 00420: and ax, dx */
    /* 00422: ret  */
}

void sub_00423(void) {
    /* 00423: push si */
    /* 00424: mov ax, ds */
    /* 00426: mov es, ax */
    /* 00428: xor si, si */
    /* 0042A: mov di, si */
    /* 0042C: cmp word ptr [si + 0xc46], 0x4e6 */
    /* 00432: jb 0x449 */
    /* 00434: mov ax, word ptr [si + 4] */
    /* 00438: inc ax */
    /* 00439: shr ax, 1 */
    /* 0043B: mov word ptr [di + 4], ax */
    /* 0043F: mov ax, word ptr [si + 0xc46] */
    /* 00443: mov word ptr [di + 0xc46], ax */
    /* 00447: inc di */
    /* 00448: inc di */
    /* 00449: inc si */
    /* 0044A: inc si */
    /* 0044B: cmp si, 0x4e6 */
    /* 0044F: jb 0x42c */
    /* 00451: xor si, si */
    /* 00453: mov di, 0x274 */
    /* 00456: mov bx, si */
    /* 00458: inc bx */
    /* 00459: inc bx */
    /* 0045A: mov ax, word ptr [si + 4] */
    /* 0045E: add ax, word ptr [bx + 4] */
    /* 00462: mov word ptr [di + 4], ax */
    /* 00466: mov bx, di */
    /* 00468: dec bx */
    /* 00469: dec bx */
    /* 0046A: cmp ax, word ptr [bx + 4] */
    /* 0046E: jb 0x468 */
}

void sub_004C9(void) {
    /* 004C9: push si */
    /* 004CA: mov si, word ptr [0x216a] */
    /* 004CE: cmp si, 0x236c */
    /* 004D2: jl 0x4da */
    /* 004D4: call 0x174 */
    /* 004D7: mov si, 0x216c */
    /* 004DA: lodsb al, byte ptr [si] */
    /* 004DB: xor ah, ah */
    /* 004DD: mov word ptr [0x216a], si */
    /* 004E1: pop si */
    /* 004E2: mov cl, 8 */
    /* 004E4: sub cl, byte ptr [0x112e] */
    /* 004E8: shl ax, cl */
    /* 004EA: or dx, ax */
    /* 004EC: add byte ptr [0x112e], 8 */
    /* 004F1: ret  */
}

void sub_004F2(void) {
    /* 004F2: mov ax, 0x1853 */
    /* 004F5: mov ds, ax */
    /* 004F7: mov es, ax */
    /* 004F9: cld  */
    /* 004FA: mov word ptr [0x8e6a], sp */
    /* 004FE: call 0x5a3 */
    /* 00501: mov word ptr [0x8e6c], 0 */
    /* 00507: call 0x7ed */
    /* 0050A: mov word ptr [0x8e88], 0 */
    /* 00510: mov word ptr [0x8e8a], 0 */
    /* 00516: push es */
    /* 00517: xor ax, ax */
    /* 00519: mov es, ax */
    /* 0051B: cli  */
    /* 0051C: mov word ptr es:[0x200], 0 */
    /* 00523: mov word ptr es:[0x202], 0x14b9 */
    /* 0052A: sti  */
    /* 0052B: pop es */
    /* 0052C: mov ah, 0x22 */
    /* 0052E: mov al, 0x16 */
    /* 00530: int 0x80 */
    /* 00532: call 0x5e8a */
    /* 00535: mov word ptr [0x3048], 0 */
    /* 0053B: cmp word ptr [0x3048], 0x28 */
    /* 00540: jl 0x53b */
    /* 00542: call 0x5e5e */
    /* 00545: call 0x5c8b */
    /* 00548: mov ax, ds */
    /* 0054A: mov es, ax */
    /* 0054C: call 0x3c75 */
    /* 0054F: cmp word ptr [0x3044], 4 */
    /* 00554: jne 0x585 */
}

void sub_005A3(void) {
    /* 005A3: mov byte ptr [0x8f57], 0 */
    /* 005A8: call 0 */
    /* 005AB: mov ax, ds */
    /* 005AD: mov es, ax */
    /* 005AF: mov ax, 4 */
    /* 005B2: cmp byte ptr [0x8e59], 0 */
    /* 005B7: jne 0x5da */
    /* 005B9: mov ax, 3 */
    /* 005BC: cmp byte ptr [0x8e5a], 0 */
    /* 005C1: jne 0x5da */
    /* 005C3: mov ax, 2 */
    /* 005C6: cmp byte ptr [0x8e58], 0 */
    /* 005CB: jne 0x5da */
    /* 005CD: mov ax, 0 */
    /* 005D0: cmp byte ptr [0x8e5d], 0 */
    /* 005D5: jne 0x5da */
    /* 005D7: mov ax, 1 */
    /* 005DA: mov word ptr [0x3044], ax */
    /* 005DD: mov ah, 0xf */
    /* 005DF: int 0x10 */
    /* 005E1: mov byte ptr [0x2ef3], bh */
    /* 005E5: mov byte ptr [0x2ef4], al */
    /* 005E8: mov byte ptr [0x2ef5], ah */
    /* 005EC: mov ah, 1 */
    /* 005EE: mov ch, 0x20 */
    /* 005F0: mov cl, 0x20 */
    /* 005F2: int 0x10 */
    /* 005F4: mov ax, 0x600 */
    /* 005F7: xor bh, bh */
    /* 005F9: xor cx, cx */
    /* 005FB: mov dl, byte ptr [0x2ef5] */
    /* 005FF: dec dl */
}

void sub_0066E(void) {
    /* 0066E: mov ax, 0x600 */
    /* 00671: xor bh, bh */
    /* 00673: xor cx, cx */
    /* 00675: mov dl, byte ptr [0x2ef5] */
    /* 00679: dec dl */
    /* 0067B: mov dh, 0x18 */
    /* 0067D: int 0x10 */
    /* 0067F: mov si, 0x2f9a */
    /* 00682: mov cx, 6 */
    /* 00685: push cx */
    /* 00686: xor dl, dl */
    /* 00688: lodsb al, byte ptr [si] */
    /* 00689: mov dh, al */
    /* 0068B: mov bh, byte ptr [0x2ef3] */
    /* 0068F: mov ah, 2 */
    /* 00691: int 0x10 */
    /* 00693: mov ax, 0x920 */
    /* 00696: mov bh, byte ptr [0x2ef3] */
    /* 0069A: mov bl, 7 */
    /* 0069C: mov cx, 1 */
    /* 0069F: int 0x10 */
    /* 006A1: lodsb al, byte ptr [si] */
    /* 006A2: test al, al */
    /* 006A4: je 0x6b2 */
    /* 006A6: mov ah, 0xe */
    /* 006A8: mov bh, byte ptr [0x2ef3] */
    /* 006AC: mov bl, 7 */
    /* 006AE: int 0x10 */
    /* 006B0: jmp 0x693 */
    /* 006B2: xor ah, ah */
    /* 006B4: int 0x16 */
    /* 006B6: mov byte ptr [si], ah */
}

void sub_006FE(void) {
    /* 006FE: mov si, 0x2efd */
    /* 00701: xor cx, cx */
    /* 00703: mov bl, 7 */
    /* 00705: cmp cx, word ptr [0x3044] */
    /* 00709: jne 0x716 */
    /* 0070B: mov bl, 0x1f */
    /* 0070D: cmp byte ptr [0x2ef4], 7 */
    /* 00712: jne 0x716 */
    /* 00714: mov bl, 0xf0 */
    /* 00716: mov byte ptr [0x2ef7], bl */
    /* 0071A: lodsb al, byte ptr [si] */
    /* 0071B: test al, al */
    /* 0071D: je 0x760 */
    /* 0071F: sub al, byte ptr [0x2ef5] */
    /* 00723: neg al */
    /* 00725: shr al, 1 */
    /* 00727: mov byte ptr [0x2ef2], al */
    /* 0072A: lodsb al, byte ptr [si] */
    /* 0072B: mov byte ptr [0x2ef6], al */
    /* 0072E: push cx */
    /* 0072F: lodsb al, byte ptr [si] */
    /* 00730: test al, al */
    /* 00732: je 0x75c */
    /* 00734: mov ah, 2 */
    /* 00736: mov bh, byte ptr [0x2ef3] */
    /* 0073A: mov dh, byte ptr [0x2ef6] */
    /* 0073E: mov dl, byte ptr [0x2ef2] */
    /* 00742: int 0x10 */
    /* 00744: inc byte ptr [0x2ef2] */
    /* 00748: mov al, byte ptr [si - 1] */
    /* 0074B: mov ah, 9 */
    /* 0074D: mov bl, byte ptr [0x2ef7] */
}

void sub_00762(void) {
    /* 00762: mov word ptr [si], 0 */
    /* 00766: mov word ptr [si + 0xa], si */
    /* 00769: mov word ptr [si + 8], si */
    /* 0076C: mov word ptr [si + 2], 0x761 */
    /* 00771: mov word ptr [si + 4], 0x761 */
    /* 00776: mov word ptr [si + 6], 0x761 */
    /* 0077B: ret  */
}

void sub_0077C(void) {
    /* 0077C: push bx */
    /* 0077D: mov bx, word ptr [di + 0xa] */
    /* 00780: mov word ptr [di + 0xa], si */
    /* 00783: mov word ptr [si + 0xa], bx */
    /* 00786: mov word ptr [si + 8], di */
    /* 00789: mov word ptr [bx + 8], si */
    /* 0078C: pop bx */
    /* 0078D: ret  */
}

void sub_0078E(void) {
    /* 0078E: push bx */
    /* 0078F: mov bx, word ptr [di + 8] */
    /* 00792: mov word ptr [di + 8], si */
    /* 00795: mov word ptr [si + 8], bx */
    /* 00798: mov word ptr [si + 0xa], di */
    /* 0079B: mov word ptr [bx + 0xa], si */
    /* 0079E: pop bx */
    /* 0079F: ret  */
}

void sub_007A0(void) {
    /* 007A0: push di */
    /* 007A1: push bx */
    /* 007A2: mov di, word ptr [si + 8] */
    /* 007A5: mov bx, word ptr [si + 0xa] */
    /* 007A8: mov word ptr [di + 0xa], bx */
    /* 007AB: mov word ptr [bx + 8], di */
    /* 007AE: mov bx, word ptr [0x8e7c] */
    /* 007B2: mov word ptr [si + 8], bx */
    /* 007B5: mov word ptr [0x8e7c], si */
    /* 007B9: mov word ptr [si], 0 */
    /* 007BD: pop bx */
    /* 007BE: pop di */
    /* 007BF: ret  */
}

void sub_007C0(void) {
    /* 007C0: mov word ptr [si], 4 */
    /* 007C4: mov word ptr [si + 2], 0xf2b */
    /* 007C9: mov word ptr [si + 4], 0x761 */
    /* 007CE: mov word ptr [si + 6], 0x761 */
    /* 007D3: mov byte ptr [si + 0x26], 0 */
    /* 007D7: mov byte ptr [si + 0x4a], 0 */
    /* 007DB: ret  */
}

void sub_007DC(void) {
    /* 007DC: push di */
    /* 007DD: push bx */
    /* 007DE: mov di, word ptr [si + 8] */
    /* 007E1: mov bx, word ptr [si + 0xa] */
    /* 007E4: mov word ptr [di + 0xa], bx */
    /* 007E7: mov word ptr [bx + 8], di */
    /* 007EA: pop bx */
    /* 007EB: pop di */
    /* 007EC: ret  */
}

void sub_007ED(void) {
    /* 007ED: mov bp, word ptr [0x3044] */
    /* 007F1: shl bp, 1 */
    /* 007F3: shl bp, 1 */
    /* 007F5: lcall cs:[bp + 0x7fb] */
    /* 007FA: ret  */
}

void sub_0080F(void) {
    /* 0080F: mov bp, word ptr [0x3044] */
    /* 00813: shl bp, 1 */
    /* 00815: shl bp, 1 */
    /* 00817: lcall cs:[bp + 0x81d] */
    /* 0081C: ret  */
}

void sub_00831(void) {
    /* 00831: mov bp, word ptr [0x3044] */
    /* 00835: shl bp, 1 */
    /* 00837: shl bp, 1 */
    /* 00839: lcall cs:[bp + 0x83f] */
    /* 0083E: ret  */
}

void sub_00875(void) {
    /* 00875: mov bp, word ptr [0x3044] */
    /* 00879: shl bp, 1 */
    /* 0087B: shl bp, 1 */
    /* 0087D: lcall cs:[bp + 0x883] */
    /* 00882: ret  */
}

void sub_00985(void) {
    /* 00985: mov bp, word ptr [0x3044] */
    /* 00989: shl bp, 1 */
    /* 0098B: shl bp, 1 */
    /* 0098D: lcall cs:[bp + 0x993] */
    /* 00992: ret  */
}

void sub_009A7(void) {
    /* 009A7: mov bp, word ptr [0x3044] */
    /* 009AB: shl bp, 1 */
    /* 009AD: shl bp, 1 */
    /* 009AF: lcall cs:[bp + 0x9b5] */
    /* 009B4: ret  */
}

void sub_009EB(void) {
    /* 009EB: mov bp, word ptr [0x3044] */
    /* 009EF: shl bp, 1 */
    /* 009F1: shl bp, 1 */
    /* 009F3: lcall cs:[bp + 0x9f9] */
    /* 009F8: ret  */
}

void sub_00A0D(void) {
    /* 00A0D: mov bp, word ptr [0x3044] */
    /* 00A11: shl bp, 1 */
    /* 00A13: shl bp, 1 */
    /* 00A15: lcall cs:[bp + 0xa1b] */
    /* 00A1A: ret  */
}

void sub_00A2F(void) {
    /* 00A2F: mov bp, word ptr [0x3044] */
    /* 00A33: shl bp, 1 */
    /* 00A35: shl bp, 1 */
    /* 00A37: lcall cs:[bp + 0xa3d] */
    /* 00A3C: ret  */
}

void sub_00A51(void) {
    /* 00A51: mov bp, word ptr [0x3044] */
    /* 00A55: shl bp, 1 */
    /* 00A57: shl bp, 1 */
    /* 00A59: lcall cs:[bp + 0xa5f] */
    /* 00A5E: ret  */
}

void sub_00A73(void) {
    /* 00A73: mov bp, word ptr [0x3044] */
    /* 00A77: shl bp, 1 */
    /* 00A79: shl bp, 1 */
    /* 00A7B: lcall cs:[bp + 0xa81] */
    /* 00A80: ret  */
}

void sub_00A95(void) {
    /* 00A95: mov bp, word ptr [0x3044] */
    /* 00A99: shl bp, 1 */
    /* 00A9B: shl bp, 1 */
    /* 00A9D: lcall cs:[bp + 0xaa3] */
    /* 00AA2: ret  */
}

void sub_00AFB(void) {
    /* 00AFB: mov bp, word ptr [0x3044] */
    /* 00AFF: shl bp, 1 */
    /* 00B01: shl bp, 1 */
    /* 00B03: lcall cs:[bp + 0xb09] */
    /* 00B08: ret  */
}

void sub_00B3F(void) {
    /* 00B3F: mov bp, word ptr [0x3044] */
    /* 00B43: shl bp, 1 */
    /* 00B45: shl bp, 1 */
    /* 00B47: lcall cs:[bp + 0xb4d] */
    /* 00B4C: ret  */
}

void sub_00B83(void) {
    /* 00B83: mov bp, word ptr [0x3044] */
    /* 00B87: shl bp, 1 */
    /* 00B89: shl bp, 1 */
    /* 00B8B: lcall cs:[bp + 0xb91] */
    /* 00B90: ret  */
}

void sub_00BA5(void) {
    /* 00BA5: mov bp, word ptr [0x3044] */
    /* 00BA9: shl bp, 1 */
    /* 00BAB: shl bp, 1 */
    /* 00BAD: lcall cs:[bp + 0xbb3] */
    /* 00BB2: ret  */
}

void sub_00BC7(void) {
    /* 00BC7: mov bp, word ptr [0x3044] */
    /* 00BCB: shl bp, 1 */
    /* 00BCD: shl bp, 1 */
    /* 00BCF: lcall cs:[bp + 0xbd5] */
    /* 00BD4: ret  */
}

void sub_00BE9(void) {
    /* 00BE9: mov bp, word ptr [0x3044] */
    /* 00BED: shl bp, 1 */
    /* 00BEF: shl bp, 1 */
    /* 00BF1: lcall cs:[bp + 0xbf7] */
    /* 00BF6: ret  */
}

void sub_00C0B(void) {
    /* 00C0B: mov bp, word ptr [0x3044] */
    /* 00C0F: shl bp, 1 */
    /* 00C11: shl bp, 1 */
    /* 00C13: lcall cs:[bp + 0xc19] */
    /* 00C18: ret  */
}

void sub_00C2D(void) {
    /* 00C2D: mov bp, word ptr [0x3044] */
    /* 00C31: shl bp, 1 */
    /* 00C33: shl bp, 1 */
    /* 00C35: lcall cs:[bp + 0xc3b] */
    /* 00C3A: ret  */
}

void sub_00C4F(void) {
    /* 00C4F: mov bp, word ptr [0x3044] */
    /* 00C53: shl bp, 1 */
    /* 00C55: shl bp, 1 */
    /* 00C57: lcall cs:[bp + 0xc5d] */
    /* 00C5C: ret  */
}

void sub_00C71(void) {
    /* 00C71: mov bp, word ptr [0x3044] */
    /* 00C75: shl bp, 1 */
    /* 00C77: shl bp, 1 */
    /* 00C79: lcall cs:[bp + 0xc7f] */
    /* 00C7E: ret  */
}

void sub_00C93(void) {
    /* 00C93: mov bp, word ptr [0x3044] */
    /* 00C97: shl bp, 1 */
    /* 00C99: shl bp, 1 */
    /* 00C9B: lcall cs:[bp + 0xca1] */
    /* 00CA0: ret  */
}

void sub_00CB5(void) {
    /* 00CB5: mov bp, word ptr [0x3044] */
    /* 00CB9: shl bp, 1 */
    /* 00CBB: shl bp, 1 */
    /* 00CBD: lcall cs:[bp + 0xcc3] */
    /* 00CC2: ret  */
}

void sub_00CD7(void) {
    /* 00CD7: mov bp, word ptr [0x3044] */
    /* 00CDB: shl bp, 1 */
    /* 00CDD: shl bp, 1 */
    /* 00CDF: lcall cs:[bp + 0xce5] */
    /* 00CE4: ret  */
}

void sub_00CF9(void) {
    /* 00CF9: mov bp, word ptr [0x3044] */
    /* 00CFD: shl bp, 1 */
    /* 00CFF: shl bp, 1 */
    /* 00D01: lcall cs:[bp + 0xd07] */
    /* 00D06: ret  */
}

void sub_00D1B(void) {
    /* 00D1B: mov bp, word ptr [0x3044] */
    /* 00D1F: shl bp, 1 */
    /* 00D21: shl bp, 1 */
    /* 00D23: lcall cs:[bp + 0xd29] */
    /* 00D28: ret  */
}

void sub_00D5F(void) {
    /* 00D5F: mov bp, word ptr [0x3044] */
    /* 00D63: shl bp, 1 */
    /* 00D65: shl bp, 1 */
    /* 00D67: lcall cs:[bp + 0xd6d] */
    /* 00D6C: ret  */
}

void sub_00D81(void) {
    /* 00D81: mov bp, word ptr [0x3044] */
    /* 00D85: shl bp, 1 */
    /* 00D87: shl bp, 1 */
    /* 00D89: lcall cs:[bp + 0xd8f] */
    /* 00D8E: ret  */
}

void sub_00DA3(void) {
    /* 00DA3: mov bp, word ptr [0x3044] */
    /* 00DA7: shl bp, 1 */
    /* 00DA9: shl bp, 1 */
    /* 00DAB: lcall cs:[bp + 0xdb1] */
    /* 00DB0: ret  */
}

void sub_00DC5(void) {
    /* 00DC5: mov bp, word ptr [0x3044] */
    /* 00DC9: shl bp, 1 */
    /* 00DCB: shl bp, 1 */
    /* 00DCD: lcall cs:[bp + 0xdd3] */
    /* 00DD2: ret  */
}

void sub_00DE7(void) {
    /* 00DE7: mov bp, word ptr [0x3044] */
    /* 00DEB: shl bp, 1 */
    /* 00DED: shl bp, 1 */
    /* 00DEF: lcall cs:[bp + 0xdf5] */
    /* 00DF4: ret  */
}

void sub_00E09(void) {
    /* 00E09: mov bp, word ptr [0x3044] */
    /* 00E0D: shl bp, 1 */
    /* 00E0F: shl bp, 1 */
    /* 00E11: lcall cs:[bp + 0xe17] */
    /* 00E16: ret  */
}

void sub_00E2B(void) {
    /* 00E2B: mov bp, word ptr [0x3044] */
    /* 00E2F: shl bp, 1 */
    /* 00E31: shl bp, 1 */
    /* 00E33: lcall cs:[bp + 0xe39] */
    /* 00E38: ret  */
}

void sub_00E4D(void) {
    /* 00E4D: mov bp, word ptr [0x3044] */
    /* 00E51: shl bp, 1 */
    /* 00E53: shl bp, 1 */
    /* 00E55: lcall cs:[bp + 0xe5b] */
    /* 00E5A: ret  */
}

void sub_00E6F(void) {
    /* 00E6F: mov bp, word ptr [0x3044] */
    /* 00E73: shl bp, 1 */
    /* 00E75: shl bp, 1 */
    /* 00E77: lcall cs:[bp + 0xe7d] */
    /* 00E7C: ret  */
}

void sub_00E91(void) {
    /* 00E91: mov bp, word ptr [0x3044] */
    /* 00E95: shl bp, 1 */
    /* 00E97: shl bp, 1 */
    /* 00E99: lcall cs:[bp + 0xe9f] */
    /* 00E9E: ret  */
}

void sub_00F5A(void) {
    /* 00F5A: mov word ptr [0x8e74], bx */
    /* 00F5E: mov bx, word ptr [0x991c] */
    /* 00F62: shl bx, 1 */
    /* 00F64: push word ptr cs:[bx + 0xf6c] */
    /* 00F69: mov bx, word ptr [0x8e74] */
    /* 00F6D: ret  */
}

void sub_00F78(void) {
    /* 00F78: mov word ptr [0x8e74], bx */
    /* 00F7C: mov bx, word ptr [0x991c] */
    /* 00F80: shl bx, 1 */
    /* 00F82: push word ptr cs:[bx + 0xf8a] */
    /* 00F87: mov bx, word ptr [0x8e74] */
    /* 00F8B: ret  */
}

void sub_00FB4(void) {
    /* 00FB4: mov word ptr [0x8e74], bx */
    /* 00FB8: mov bx, word ptr [0x991c] */
    /* 00FBC: shl bx, 1 */
    /* 00FBE: push word ptr cs:[bx + 0xfc6] */
    /* 00FC3: mov bx, word ptr [0x8e74] */
    /* 00FC7: ret  */
}

void sub_00FD2(void) {
    /* 00FD2: mov word ptr [0x8e74], bx */
    /* 00FD6: mov bx, word ptr [0x991c] */
    /* 00FDA: shl bx, 1 */
    /* 00FDC: push word ptr cs:[bx + 0xfe4] */
    /* 00FE1: mov bx, word ptr [0x8e74] */
    /* 00FE5: ret  */
}

void sub_00FF0(void) {
    /* 00FF0: mov word ptr [0x8e74], bx */
    /* 00FF4: mov bx, word ptr [0x991c] */
    /* 00FF8: shl bx, 1 */
    /* 00FFA: push word ptr cs:[bx + 0x1002] */
    /* 00FFF: mov bx, word ptr [0x8e74] */
    /* 01003: ret  */
}

void sub_0100E(void) {
    /* 0100E: mov bp, 0x9138 */
    /* 01011: mov cx, 4 */
    /* 01014: cmp word ptr ds:[bp], 0 */
    /* 01019: je 0x1021 */
    /* 0101B: add bp, 4 */
    /* 0101E: loop 0x1014 */
    /* 01020: dec cx */
    /* 01021: ret  */
}

void sub_01022(void) {
    /* 01022: cmp word ptr [0x8e7c], 0 */
    /* 01027: je 0x1041 */
    /* 01029: mov si, word ptr [0x8e7c] */
    /* 0102D: push word ptr [si + 8] */
    /* 01030: pop word ptr [0x8e7c] */
    /* 01034: mov byte ptr [si + 0x26], 0 */
    /* 01038: mov byte ptr [si + 0x4a], 0 */
    /* 0103C: mov byte ptr [si + 0x4b], 0 */
    /* 01040: ret  */
}

void sub_01689(void) {
    /* 01689: mov di, word ptr [si + 0xa] */
    /* 0168C: cmp byte ptr [si + 0x26], 0 */
    /* 01690: je 0x16a8 */
    /* 01692: mov di, word ptr [si + 0x44] */
    /* 01695: mov di, word ptr [di + 0xa] */
    /* 01698: cmp word ptr [di], 0 */
    /* 0169B: je 0x16a8 */
    /* 0169D: cmp byte ptr [di + 0x26], 0 */
    /* 016A1: je 0x16a8 */
    /* 016A3: cmp si, word ptr [di + 0x44] */
    /* 016A6: je 0x1695 */
    /* 016A8: ret  */
}

void sub_016A9(void) {
    /* 016A9: call 0xe6f */
    /* 016AC: xor word ptr [0x8e7a], 1 */
    /* 016B1: call 0xe6f */
    /* 016B4: xor word ptr [0x8e7a], 1 */
    /* 016B9: ret  */
}

void sub_016BA(void) {
    /* 016BA: mov si, 0x8fb2 */
    /* 016BD: call 0x762 */
    /* 016C0: mov si, 0x8ffe */
    /* 016C3: call 0x762 */
    /* 016C6: mov si, 0x904a */
    /* 016C9: call 0x762 */
    /* 016CC: mov si, 0x9096 */
    /* 016CF: call 0x762 */
    /* 016D2: mov si, 0x90e2 */
    /* 016D5: call 0x762 */
    /* 016D8: mov si, 0x9f00 */
    /* 016DB: mov di, 0x8fb2 */
    /* 016DE: call 0x77c */
    /* 016E1: mov word ptr [si], 8 */
    /* 016E5: mov word ptr [si + 2], 0x4311 */
    /* 016EA: mov word ptr [si + 4], 0x853 */
    /* 016EF: mov word ptr [si + 0xc], 0x77a */
    /* 016F4: mov word ptr [si + 0xe], 0 */
    /* 016F9: mov word ptr [si + 0x12], 0xa0 */
    /* 016FE: mov word ptr [si + 0x16], 0xb0 */
    /* 01703: mov bx, 0x3292 */
    /* 01706: mov cx, 4 */
    /* 01709: call 0x1022 */
    /* 0170C: mov di, 0x8fb2 */
    /* 0170F: call 0x78e */
    /* 01712: mov word ptr [si], 0xc4 */
    /* 01716: mov word ptr [si + 2], 0x4759 */
    /* 0171B: mov word ptr [si + 4], 0x761 */
    /* 01720: mov di, word ptr [bx] */
    /* 01722: add bx, 2 */
    /* 01725: mov ax, word ptr cs:[di] */
    /* 01728: mov word ptr [si + 0xc], ax */
}

void sub_01827(void) {
    /* 01827: mov byte ptr [0x8f5c], 0 */
    /* 0182C: mov byte ptr [0x8f5d], 0xff */
    /* 01831: mov word ptr [0x991e], 8 */
    /* 01837: mov word ptr [0x991a], 1 */
    /* 0183D: mov word ptr [0x8e7a], 0 */
    /* 01843: mov byte ptr [0x8f5e], 0 */
    /* 01848: cmp word ptr [0x8e70], 2 */
    /* 0184D: jne 0x1854 */
    /* 0184F: mov byte ptr [0x8f5e], 0xff */
    /* 01854: mov byte ptr [0x8f5f], 0 */
    /* 01859: mov byte ptr [0x8f60], 0 */
    /* 0185E: call 0x9a7 */
    /* 01861: call 0xa73 */
    /* 01864: mov byte ptr [0x8f61], 0 */
    /* 01869: mov si, 0x9f4c */
    /* 0186C: mov cx, 0x9e */
    /* 0186F: mov word ptr [0x8e7c], si */
    /* 01873: mov word ptr [si], 0 */
    /* 01877: lea di, [si + 0x4c] */
    /* 0187A: mov word ptr [si + 8], di */
    /* 0187D: mov si, di */
    /* 0187F: loop 0x1873 */
    /* 01881: mov word ptr [si], 0 */
    /* 01885: mov word ptr [si + 8], 0 */
    /* 0188A: mov di, 0x9c80 */
    /* 0188D: mov ax, 0xffff */
    /* 01890: mov cx, 0x140 */
    /* 01893: rep stosw word ptr es:[di], ax */
    /* 01895: call 0x16a9 */
    /* 01898: call 0x16ba */
    /* 0189B: cmp byte ptr [0x8f5e], 0 */
    /* 018A0: je 0x18ad */
}

void sub_018F5(void) {
    /* 018F5: mov ah, 1 */
    /* 018F7: int 0x80 */
    /* 018F9: cmp word ptr [0x9162], 0 */
    /* 018FE: je 0x1903 */
    /* 01900: call 0x472d */
    /* 01903: mov ax, word ptr [0x91a6] */
    /* 01906: sub ax, word ptr [0x9190] */
    /* 0190A: mov word ptr [0xfcfe], ax */
    /* 0190D: mov si, word ptr [0x90ec] */
    /* 01911: call 0x371a */
    /* 01914: mov si, word ptr [0x90a0] */
    /* 01918: call 0x371a */
    /* 0191B: mov si, word ptr [0x9054] */
    /* 0191F: call 0x371a */
    /* 01922: mov si, word ptr [0x9008] */
    /* 01926: cmp word ptr [si], 0 */
    /* 01929: je 0x1930 */
    /* 0192B: call 0x37a9 */
    /* 0192E: jmp 0x1922 */
    /* 01930: mov di, 0x9c80 */
    /* 01933: mov ax, 0xffff */
    /* 01936: mov cx, 0x140 */
    /* 01939: rep stosw word ptr es:[di], ax */
    /* 0193B: ret  */
}

void sub_0193C(void) {
    /* 0193C: mov si, 0x916a */
    /* 0193F: mov cx, 7 */
    /* 01942: lodsw ax, word ptr [si] */
    /* 01943: mov bx, ax */
    /* 01945: lodsw ax, word ptr [si] */
    /* 01946: test bx, bx */
    /* 01948: je 0x1958 */
    /* 0194A: push si */
    /* 0194B: push cx */
    /* 0194C: push ax */
    /* 0194D: mov ax, bx */
    /* 0194F: call 0x29d7 */
    /* 01952: pop ax */
    /* 01953: mov word ptr [di + 0x34], ax */
    /* 01956: pop cx */
    /* 01957: pop si */
    /* 01958: loop 0x1942 */
    /* 0195A: ret  */
}

void sub_0195B(void) {
    /* 0195B: mov si, 0x9f00 */
    /* 0195E: mov byte ptr [0x9224], 0 */
    /* 01963: mov ax, word ptr [0x91a2] */
    /* 01966: mov word ptr [si + 0x12], ax */
    /* 01969: mov word ptr [si + 0x16], 0xb0 */
    /* 0196E: mov ax, word ptr [0x91a6] */
    /* 01971: mov word ptr [0x9190], ax */
    /* 01974: mov word ptr [0x91aa], ax */
    /* 01977: inc ax */
    /* 01978: mov word ptr [0x9192], ax */
    /* 0197B: add ax, 0xbf */
    /* 0197E: mov word ptr [0x9194], ax */
    /* 01981: mov ax, word ptr [0x91a6] */
    /* 01984: and ax, 0xf */
    /* 01987: mov word ptr [0x9196], ax */
    /* 0198A: mov ax, word ptr [0x91a6] */
    /* 0198D: shr ax, 1 */
    /* 0198F: shr ax, 1 */
    /* 01991: shr ax, 1 */
    /* 01993: shr ax, 1 */
    /* 01995: mov dx, 0x28 */
    /* 01998: mul dx */
    /* 0199A: mov word ptr [0x918e], ax */
    /* 0199D: call 0x193c */
    /* 019A0: mov ax, word ptr [0x9166] */
    /* 019A3: mov word ptr [0x915a], ax */
    /* 019A6: mov ax, word ptr [0x9168] */
    /* 019A9: mov word ptr [0x915c], ax */
    /* 019AC: mov di, 0x8e8c */
    /* 019AF: mov cx, 0x10 */
    /* 019B2: xor ax, ax */
    /* 019B4: rep stosw word ptr es:[di], ax */
}

void sub_01A19(void) {
    /* 01A19: mov si, 0xce80 */
    /* 01A1C: mov di, 0x8fb2 */
    /* 01A1F: mov cx, 0x146 */
    /* 01A22: lodsw ax, word ptr [si] */
    /* 01A23: mov bx, word ptr [di] */
    /* 01A25: mov word ptr [si - 2], bx */
    /* 01A28: stosw word ptr es:[di], ax */
    /* 01A29: loop 0x1a22 */
    /* 01A2B: mov si, 0x9f00 */
    /* 01A2E: mov di, 0x8f62 */
    /* 01A31: mov cx, 0x4c */
    /* 01A34: lodsb al, byte ptr [si] */
    /* 01A35: mov ah, byte ptr [di] */
    /* 01A37: mov byte ptr [si - 1], ah */
    /* 01A3A: stosb byte ptr es:[di], al */
    /* 01A3B: loop 0x1a34 */
    /* 01A3D: mov si, 0 */
    /* 01A40: mov di, 0 */
    /* 01A43: mov cx, 0x1770 */
    /* 01A46: mov ax, 0x1565 */
    /* 01A49: mov es, ax */
    /* 01A4B: lodsw ax, word ptr [si] */
    /* 01A4C: mov bx, word ptr es:[di] */
    /* 01A4F: mov word ptr [si - 2], bx */
    /* 01A52: stosw word ptr es:[di], ax */
    /* 01A53: loop 0x1a4b */
    /* 01A55: mov ax, ds */
    /* 01A57: mov es, ax */
    /* 01A59: xor word ptr [0x8e7a], 1 */
    /* 01A5E: call 0xf5a */
    /* 01A61: ret  */
}

void sub_01A62(void) {
    /* 01A62: call 0x18f5 */
    /* 01A65: mov bx, word ptr [0x8e7a] */
    /* 01A69: cmp byte ptr [bx - 0x70a3], 0 */
    /* 01A6E: je 0x1a8e */
    /* 01A70: xor bx, 1 */
    /* 01A73: cmp byte ptr [bx - 0x70a3], 0 */
    /* 01A78: je 0x1a84 */
    /* 01A7A: cmp byte ptr [bx - 0x70a1], 0 */
    /* 01A7F: jne 0x1a84 */
    /* 01A81: call 0x1a19 */
    /* 01A84: call 0x195b */
    /* 01A87: mov word ptr [0x991e], 8 */
    /* 01A8D: ret  */
}

void sub_01A65(void) {
    /* 01A65: mov bx, word ptr [0x8e7a] */
    /* 01A69: cmp byte ptr [bx - 0x70a3], 0 */
    /* 01A6E: je 0x1a8e */
    /* 01A70: xor bx, 1 */
    /* 01A73: cmp byte ptr [bx - 0x70a3], 0 */
    /* 01A78: je 0x1a84 */
    /* 01A7A: cmp byte ptr [bx - 0x70a1], 0 */
    /* 01A7F: jne 0x1a84 */
    /* 01A81: call 0x1a19 */
    /* 01A84: call 0x195b */
    /* 01A87: mov word ptr [0x991e], 8 */
    /* 01A8D: ret  */
}

void sub_01AAF(void) {
    /* 01AAF: mov word ptr [0x918e], 0x2d00 */
    /* 01AB5: mov word ptr [0x9196], 0 */
    /* 01ABB: mov word ptr [0x9190], 0x1200 */
    /* 01AC1: mov word ptr [0x9192], 0x7fee */
    /* 01AC7: mov word ptr [0x9194], 0x7fee */
    /* 01ACD: mov word ptr [0x91ae], 0x10 */
    /* 01AD3: mov ax, word ptr [0x9f12] */
    /* 01AD6: mov word ptr [0x91a2], ax */
    /* 01AD9: mov ax, word ptr [0x9f16] */
    /* 01ADC: mov word ptr [0x91a4], ax */
    /* 01ADF: mov ax, word ptr [0x9190] */
    /* 01AE2: mov word ptr [0x91a6], ax */
    /* 01AE5: mov ax, word ptr [0x915a] */
    /* 01AE8: mov word ptr [0x9166], ax */
    /* 01AEB: mov ax, word ptr [0x915c] */
    /* 01AEE: mov word ptr [0x9168], ax */
    /* 01AF1: mov word ptr [0x9198], 1 */
    /* 01AF7: mov word ptr [0x919a], 0 */
    /* 01AFD: mov word ptr [0x919e], 0 */
    /* 01B03: call 0xf78 */
    /* 01B06: mov word ptr [0x91a0], 0 */
    /* 01B0C: mov word ptr [0x8e7e], 0 */
    /* 01B12: mov word ptr [0x919c], 0 */
    /* 01B18: mov word ptr [0x915a], 0 */
    /* 01B1E: mov word ptr [0x915c], 0 */
    /* 01B24: mov word ptr [0x9166], 0 */
    /* 01B2A: mov word ptr [0x9168], 0 */
    /* 01B30: mov word ptr [0x9164], 0 */
    /* 01B36: mov word ptr [0x91ac], 1 */
    /* 01B3C: mov word ptr [0x91b2], 0 */
    /* 01B42: ret  */
}

void sub_01B43(void) {
    /* 01B43: mov si, 0 */
    /* 01B46: mov di, 0 */
    /* 01B49: mov cx, 0x1770 */
    /* 01B4C: mov ax, 0x1565 */
    /* 01B4F: mov es, ax */
    /* 01B51: rep movsw word ptr es:[di], word ptr [si] */
    /* 01B53: mov ax, ds */
    /* 01B55: mov es, ax */
    /* 01B57: mov word ptr [0x8f32], 0 */
    /* 01B5D: mov word ptr [0x8e86], 0 */
    /* 01B63: mov di, 0x8e8c */
    /* 01B66: mov cx, 0x10 */
    /* 01B69: xor ax, ax */
    /* 01B6B: rep stosw word ptr es:[di], ax */
    /* 01B6D: mov byte ptr [0x8fb0], 0 */
    /* 01B72: mov byte ptr [0x8f59], 0 */
    /* 01B77: mov byte ptr [0x8f5b], 0 */
    /* 01B7C: call 0x1aaf */
    /* 01B7F: cmp word ptr [0x8e70], 2 */
    /* 01B84: jne 0x1b8f */
    /* 01B86: call 0x1a19 */
    /* 01B89: call 0x1aaf */
    /* 01B8C: call 0x1a19 */
    /* 01B8F: ret  */
}

void sub_029D7(void) {
    /* 029D7: cmp ax, 0x44 */
    /* 029DA: jne 0x29df */
    /* 029DC: jmp 0x308c */
    /* 029DF: cmp ax, 0x98 */
    /* 029E2: jne 0x29e7 */
    /* 029E4: jmp 0x2ca6 */
    /* 029E7: cmp ax, 0x34 */
    /* 029EA: jne 0x29ef */
    /* 029EC: jmp 0x3246 */
    /* 029EF: cmp ax, 0x2c */
    /* 029F2: jne 0x29f7 */
    /* 029F4: jmp 0x2e84 */
    /* 029F7: cmp ax, 0x20 */
    /* 029FA: jne 0x29ff */
    /* 029FC: jmp 0x31b6 */
    /* 029FF: cmp ax, 0x4c */
    /* 02A02: jne 0x2a07 */
    /* 02A04: jmp 0x2f08 */
    /* 02A07: cmp ax, 0x3c */
    /* 02A0A: jne 0x2a0f */
    /* 02A0C: jmp 0x3004 */
    /* 02A0F: cmp ax, 0x38 */
    /* 02A12: jne 0x2a17 */
    /* 02A14: jmp 0x2f7c */
    /* 02A17: cmp ax, 0xc0 */
    /* 02A1A: jne 0x2a1f */
    /* 02A1C: jmp 0x2c32 */
    /* 02A1F: cmp ax, 0x90 */
    /* 02A22: jne 0x2a27 */
    /* 02A24: jmp 0x3126 */
    /* 02A27: cmp ax, 0x48 */
    /* 02A2A: jne 0x2a2f */
}

void sub_02B22(void) {
    /* 02B22: mov ax, word ptr [0x9008] */
    /* 02B25: mov word ptr [0x91b4], ax */
    /* 02B28: mov ax, word ptr [0x9006] */
    /* 02B2B: mov word ptr [0x91b6], ax */
    /* 02B2E: mov di, 0x9134 */
    /* 02B31: mov bx, 0x91b8 */
    /* 02B34: mov cx, 0xe */
    /* 02B37: mov ax, word ptr [di] */
    /* 02B39: mov word ptr [bx], ax */
    /* 02B3B: add bx, 2 */
    /* 02B3E: mov word ptr [di], 0 */
    /* 02B42: add di, 2 */
    /* 02B45: loop 0x2b37 */
    /* 02B47: mov si, 0x8ffe */
    /* 02B4A: call 0x762 */
    /* 02B4D: call 0x2bcc */
    /* 02B50: call 0x3246 */
    /* 02B53: call 0x3246 */
    /* 02B56: call 0x31b6 */
    /* 02B59: mov word ptr [di + 0x34], 2 */
    /* 02B5E: call 0x31b6 */
    /* 02B61: mov word ptr [di + 0x34], 2 */
    /* 02B66: call 0x2e84 */
    /* 02B69: mov word ptr [di + 0x34], 2 */
    /* 02B6E: call 0x2ca6 */
    /* 02B71: mov word ptr [di + 0x34], 2 */
    /* 02B76: call 0x2c32 */
    /* 02B79: mov word ptr [di + 0x34], 2 */
    /* 02B7E: ret  */
}

void sub_02BCC(void) {
    /* 02BCC: cmp word ptr [0x9134], 0 */
    /* 02BD1: je 0x2bdc */
    /* 02BD3: push si */
    /* 02BD4: mov si, word ptr [0x9136] */
    /* 02BD8: call 0x7c0 */
    /* 02BDB: pop si */
    /* 02BDC: mov word ptr [0x9134], 0x94 */
    /* 02BE2: push si */
    /* 02BE3: call 0x1022 */
    /* 02BE6: mov di, 0x8ffe */
    /* 02BE9: call 0x77c */
    /* 02BEC: mov word ptr [0x9136], si */
    /* 02BF0: mov word ptr [si], 0x94 */
    /* 02BF4: mov word ptr [si + 2], 0x37df */
    /* 02BF9: mov word ptr [si + 6], 0x9134 */
    /* 02BFE: mov word ptr [si + 4], 0x761 */
    /* 02C03: mov word ptr [si + 0x34], 0 */
    /* 02C08: mov word ptr [si + 0x24], 2 */
    /* 02C0D: mov word ptr [si + 0x36], 1 */
    /* 02C12: mov word ptr [si + 0x48], 0xffff */
    /* 02C17: mov di, si */
    /* 02C19: pop si */
    /* 02C1A: mov word ptr [0x9130], 8 */
    /* 02C20: ret  */
}

void sub_02C32(void) {
    /* 02C32: cmp word ptr [0x9134], 0xc0 */
    /* 02C38: je 0x2c21 */
    /* 02C3A: cmp word ptr [0x9134], 0 */
    /* 02C3F: je 0x2c4a */
    /* 02C41: push si */
    /* 02C42: mov si, word ptr [0x9136] */
    /* 02C46: call 0x7c0 */
    /* 02C49: pop si */
    /* 02C4A: mov word ptr [0x9134], 0xc0 */
    /* 02C50: push si */
    /* 02C51: call 0x1022 */
    /* 02C54: mov di, 0x8ffe */
    /* 02C57: call 0x77c */
    /* 02C5A: mov word ptr [0x9136], si */
    /* 02C5E: mov word ptr [si], 0xc0 */
    /* 02C62: mov word ptr [si + 2], 0x20f7 */
    /* 02C67: mov word ptr [si + 4], 0x853 */
    /* 02C6C: mov word ptr [si + 6], 0x9134 */
    /* 02C71: mov word ptr [si + 0xc], 0xa658 */
    /* 02C76: mov word ptr [si + 0xe], 0 */
    /* 02C7B: mov ax, word ptr [0x9f12] */
    /* 02C7E: mov word ptr [si + 0x12], ax */
    /* 02C81: mov ax, word ptr [0x9f16] */
    /* 02C84: mov word ptr [si + 0x16], ax */
    /* 02C87: mov word ptr [si + 0x34], 0 */
    /* 02C8C: mov word ptr [si + 0x24], 2 */
    /* 02C91: mov word ptr [si + 0x36], 0xe */
    /* 02C96: mov word ptr [si + 0x48], 0xffff */
    /* 02C9B: mov di, si */
    /* 02C9D: pop si */
    /* 02C9E: mov word ptr [0x9130], 8 */
    /* 02CA4: ret  */
}

void sub_02CA6(void) {
    /* 02CA6: cmp word ptr [0x914c], 0x98 */
    /* 02CAC: je 0x2d19 */
    /* 02CAE: cmp word ptr [0x914c], 0 */
    /* 02CB3: je 0x2cbe */
    /* 02CB5: push si */
    /* 02CB6: mov si, word ptr [0x914e] */
    /* 02CBA: call 0x7c0 */
    /* 02CBD: pop si */
    /* 02CBE: cmp word ptr [0x9148], 0x44 */
    /* 02CC3: jne 0x2cd4 */
    /* 02CC5: push si */
    /* 02CC6: mov si, word ptr [0x914a] */
    /* 02CCA: call 0x7c0 */
    /* 02CCD: pop si */
    /* 02CCE: mov word ptr [0x9148], 0 */
    /* 02CD4: push si */
    /* 02CD5: call 0x1022 */
    /* 02CD8: mov di, 0x8ffe */
    /* 02CDB: call 0x77c */
    /* 02CDE: mov word ptr [0x914c], 0x98 */
    /* 02CE4: mov word ptr [0x914e], si */
    /* 02CE8: mov word ptr [si], 0x98 */
    /* 02CEC: mov word ptr [si + 2], 0x3801 */
    /* 02CF1: mov word ptr [si + 4], 0x761 */
    /* 02CF6: mov word ptr [si + 6], 0x914c */
    /* 02CFB: mov word ptr [si + 0x34], 0 */
    /* 02D00: mov word ptr [si + 0x24], 2 */
    /* 02D05: mov word ptr [si + 0x36], 0xa */
    /* 02D0A: mov word ptr [si + 0x48], 0xffff */
    /* 02D0F: mov di, si */
    /* 02D11: pop si */
    /* 02D12: mov word ptr [0x9130], 8 */
}

void sub_02E73(void) {
    /* 02E73: cmp word ptr [0x9148], 0 */
    /* 02E78: je 0x2e83 */
    /* 02E7A: push si */
    /* 02E7B: mov si, word ptr [0x914a] */
    /* 02E7F: call 0x7c0 */
    /* 02E82: pop si */
    /* 02E83: ret  */
}

void sub_02E84(void) {
    /* 02E84: cmp word ptr [0x9148], 0x2c */
    /* 02E89: je 0x2ef8 */
    /* 02E8B: call 0x2e73 */
    /* 02E8E: push si */
    /* 02E8F: call 0x1022 */
    /* 02E92: mov di, 0x8ffe */
    /* 02E95: call 0x77c */
    /* 02E98: mov di, si */
    /* 02E9A: pop si */
    /* 02E9B: mov word ptr [0x9148], 0x2c */
    /* 02EA1: mov word ptr [0x914a], di */
    /* 02EA5: mov word ptr [di], 0x2c */
    /* 02EA9: mov word ptr [di + 2], 0x221a */
    /* 02EAE: mov word ptr [di + 4], 0x853 */
    /* 02EB3: mov word ptr [di + 6], 0x9148 */
    /* 02EB8: mov bp, 0x115a */
    /* 02EBB: mov ax, word ptr cs:[bp] */
    /* 02EBF: mov word ptr [di + 0xc], ax */
    /* 02EC2: mov ax, word ptr cs:[bp + 2] */
    /* 02EC6: mov word ptr [di + 0xe], ax */
    /* 02EC9: add bp, 4 */
    /* 02ECC: mov word ptr [di + 0x10], bp */
    /* 02ECF: mov ax, word ptr [0x9f12] */
    /* 02ED2: mov word ptr [di + 0x12], ax */
    /* 02ED5: mov ax, word ptr [0x9f16] */
    /* 02ED8: add ax, 0x19 */
    /* 02EDB: mov word ptr [di + 0x16], ax */
    /* 02EDE: mov word ptr [di + 0x1a], 0 */
    /* 02EE3: mov word ptr [di + 0x34], 0 */
    /* 02EE8: mov word ptr [di + 0x24], 2 */
    /* 02EED: mov word ptr [di + 0x36], 0x13 */
    /* 02EF2: mov word ptr [di + 0x48], 0xffff */
}

void sub_03117(void) {
    /* 03117: call 0x100e */
    /* 0311A: jne 0x3122 */
    /* 0311C: mov ax, 0xffff */
    /* 0311F: test ax, ax */
    /* 03121: ret  */
}

void sub_031B6(void) {
    /* 031B6: mov ax, 0x20 */
    /* 031B9: call 0x3117 */
    /* 031BC: jne 0x31c1 */
    /* 031BE: jmp 0x3243 */
    /* 031C1: push si */
    /* 031C2: call 0x1022 */
    /* 031C5: mov di, 0x8ffe */
    /* 031C8: call 0x77c */
    /* 031CB: mov di, si */
    /* 031CD: pop si */
    /* 031CE: mov word ptr ds:[bp], 0x20 */
    /* 031D4: mov word ptr ds:[bp + 2], di */
    /* 031D8: mov word ptr [di], 0x20 */
    /* 031DC: mov word ptr [di + 2], 0x237e */
    /* 031E1: mov word ptr [di + 4], 0x853 */
    /* 031E6: mov word ptr [di + 6], bp */
    /* 031E9: dec cx */
    /* 031EA: shl cx, 1 */
    /* 031EC: shl cx, 1 */
    /* 031EE: mov bp, 0x30a8 */
    /* 031F1: add bp, cx */
    /* 031F3: mov ax, word ptr ds:[bp] */
    /* 031F7: mov word ptr [di + 0x30], ax */
    /* 031FA: mov ax, word ptr ds:[bp + 2] */
    /* 031FE: mov word ptr [di + 0x32], ax */
    /* 03201: mov bp, 0x118e */
    /* 03204: mov ax, word ptr cs:[bp] */
    /* 03208: mov word ptr [di + 0xc], ax */
    /* 0320B: mov ax, word ptr cs:[bp + 2] */
    /* 0320F: mov word ptr [di + 0xe], ax */
    /* 03212: add bp, 4 */
    /* 03215: mov word ptr [di + 0x10], bp */
}

void sub_03246(void) {
    /* 03246: mov ax, 0x34 */
    /* 03249: call 0x3117 */
    /* 0324C: jne 0x3251 */
    /* 0324E: jmp 0x3319 */
    /* 03251: push si */
    /* 03252: call 0x1022 */
    /* 03255: mov di, 0x8ffe */
    /* 03258: call 0x77c */
    /* 0325B: mov di, si */
    /* 0325D: pop si */
    /* 0325E: mov word ptr ds:[bp], 0x34 */
    /* 03264: mov word ptr ds:[bp + 2], di */
    /* 03268: mov word ptr [di], 0x34 */
    /* 0326C: mov word ptr [di + 2], 0x246d */
    /* 03271: mov word ptr [di + 4], 0x853 */
    /* 03276: mov word ptr [di + 6], bp */
    /* 03279: dec cx */
    /* 0327A: shl cx, 1 */
    /* 0327C: shl cx, 1 */
    /* 0327E: mov bp, 0x30a8 */
    /* 03281: add bp, cx */
    /* 03283: mov ax, word ptr ds:[bp] */
    /* 03287: mov word ptr [di + 0x30], ax */
    /* 0328A: mov ax, word ptr ds:[bp + 2] */
    /* 0328E: mov word ptr [di + 0x32], ax */
    /* 03291: mov bp, 0x12da */
    /* 03294: mov ax, word ptr cs:[bp] */
    /* 03298: mov word ptr [di + 0xc], ax */
    /* 0329B: mov ax, word ptr cs:[bp + 2] */
    /* 0329F: mov word ptr [di + 0xe], ax */
    /* 032A2: add bp, 4 */
    /* 032A5: mov word ptr [di + 0x10], bp */
}

void sub_03319(void) {
    /* 03319: cmp word ptr [0x9134], 0 */
    /* 0331E: jne 0x3325 */
    /* 03320: push di */
    /* 03321: call 0x2bcc */
    /* 03324: pop di */
    /* 03325: ret  */
}

void sub_035EB(void) {
    /* 035EB: cmp word ptr [0x9162], 0 */
    /* 035F0: jne 0x3614 */
    /* 035F2: mov di, 0x9134 */
    /* 035F5: mov si, 0x916a */
    /* 035F8: mov cx, 7 */
    /* 035FB: mov ax, word ptr [di] */
    /* 035FD: mov word ptr [si], ax */
    /* 035FF: test ax, ax */
    /* 03601: je 0x3609 */
    /* 03603: mov bx, word ptr [di + 2] */
    /* 03606: mov ax, word ptr [bx + 0x34] */
    /* 03609: mov word ptr [si + 2], ax */
    /* 0360C: add si, 4 */
    /* 0360F: add di, 4 */
    /* 03612: loop 0x35fb */
    /* 03614: ret  */
}

void sub_035F2(void) {
    /* 035F2: mov di, 0x9134 */
    /* 035F5: mov si, 0x916a */
    /* 035F8: mov cx, 7 */
    /* 035FB: mov ax, word ptr [di] */
    /* 035FD: mov word ptr [si], ax */
    /* 035FF: test ax, ax */
    /* 03601: je 0x3609 */
    /* 03603: mov bx, word ptr [di + 2] */
    /* 03606: mov ax, word ptr [bx + 0x34] */
    /* 03609: mov word ptr [si + 2], ax */
    /* 0360C: add si, 4 */
    /* 0360F: add di, 4 */
    /* 03612: loop 0x35fb */
    /* 03614: ret  */
}

void sub_03615(void) {
    /* 03615: mov si, 0xd274 */
    /* 03618: mov bx, word ptr [0x9192] */
    /* 0361C: mov cx, word ptr [0x9190] */
    /* 03620: mov ax, word ptr [si] */
    /* 03622: test ax, ax */
    /* 03624: js 0x3643 */
    /* 03626: cmp bx, ax */
    /* 03628: jle 0x363e */
    /* 0362A: cmp cx, ax */
    /* 0362C: jg 0x363e */
    /* 0362E: mov bx, word ptr [si + 2] */
    /* 03631: push si */
    /* 03632: call 0xfb4 */
    /* 03635: pop si */
    /* 03636: mov bx, word ptr [0x9192] */
    /* 0363A: mov cx, word ptr [0x9190] */
    /* 0363E: add si, 0xe */
    /* 03641: jmp 0x3620 */
    /* 03643: cmp cx, bx */
    /* 03645: jge 0x3681 */
    /* 03647: mov word ptr [0x9192], cx */
    /* 0364B: mov si, 0xda9e */
    /* 0364E: mov bx, word ptr [0x9194] */
    /* 03652: mov cx, word ptr [0x9190] */
    /* 03656: mov ax, word ptr [si] */
    /* 03658: test ax, ax */
    /* 0365A: js 0x3679 */
    /* 0365C: cmp bx, ax */
    /* 0365E: jle 0x3674 */
    /* 03660: cmp cx, ax */
    /* 03662: jg 0x3674 */
    /* 03664: mov bx, word ptr [si + 2] */
}

void sub_03682(void) {
    /* 03682: mov si, word ptr [0x8fbc] */
    /* 03686: call 0x36fc */
    /* 03689: mov si, word ptr [0x9054] */
    /* 0368D: call 0x36fc */
    /* 03690: mov si, word ptr [0x9008] */
    /* 03694: mov al, byte ptr [0x8f5b] */
    /* 03697: mov byte ptr [0x8fae], al */
    /* 0369A: mov byte ptr [0x8f5b], 0 */
    /* 0369F: call 0x36fc */
    /* 036A2: mov si, word ptr [0x90a0] */
    /* 036A6: call 0x36fc */
    /* 036A9: mov si, word ptr [0x90ec] */
    /* 036AD: call 0x36fc */
    /* 036B0: mov si, word ptr [0x8fbc] */
    /* 036B4: call 0x370b */
    /* 036B7: mov si, word ptr [0x9008] */
    /* 036BB: call 0x370b */
    /* 036BE: mov si, word ptr [0x9054] */
    /* 036C2: call 0x370b */
    /* 036C5: mov si, word ptr [0x90a0] */
    /* 036C9: call 0x370b */
    /* 036CC: mov si, word ptr [0x90ec] */
    /* 036D0: call 0x370b */
    /* 036D3: mov si, 0x8e8c */
    /* 036D6: mov cx, 8 */
    /* 036D9: mov ax, word ptr [si] */
    /* 036DB: test ax, ax */
    /* 036DD: je 0x36f6 */
    /* 036DF: mov di, word ptr [0x9054] */
    /* 036E3: cmp word ptr [di], 0 */
    /* 036E6: je 0x36f2 */
    /* 036E8: cmp ax, word ptr [di + 0x36] */
}

void sub_036FC(void) {
    /* 036FC: cmp word ptr [si], 0 */
    /* 036FF: je 0x370a */
    /* 03701: push word ptr [si + 0xa] */
    /* 03704: call word ptr [si + 2] */
    /* 03707: pop si */
    /* 03708: jmp 0x36fc */
    /* 0370A: ret  */
}

void sub_0370B(void) {
    /* 0370B: cmp word ptr [si], 0 */
    /* 0370E: je 0x3719 */
    /* 03710: push word ptr [si + 0xa] */
    /* 03713: call word ptr [si + 4] */
    /* 03716: pop si */
    /* 03717: jmp 0x370b */
    /* 03719: ret  */
}

void sub_0371A(void) {
    /* 0371A: cmp word ptr [si], 0 */
    /* 0371D: je 0x373c */
    /* 0371F: push word ptr [si + 0xa] */
    /* 03722: cmp byte ptr [si + 0x4a], 0 */
    /* 03726: jne 0x372d */
    /* 03728: call 0x7a0 */
    /* 0372B: jmp 0x3739 */
    /* 0372D: cmp byte ptr [si + 0x4b], 0 */
    /* 03731: jne 0x3739 */
    /* 03733: mov ax, word ptr [0xfcfe] */
    /* 03736: sub word ptr [si + 0x16], ax */
    /* 03739: pop si */
    /* 0373A: jmp 0x371a */
    /* 0373C: ret  */
}

void sub_0373D(void) {
    /* 0373D: mov si, word ptr [0x9054] */
    /* 03741: xor cx, cx */
    /* 03743: mov ax, word ptr [si] */
    /* 03745: test ax, ax */
    /* 03747: je 0x375b */
    /* 03749: cmp ax, 0x50 */
    /* 0374C: je 0x3754 */
    /* 0374E: cmp ax, 0x54 */
    /* 03751: je 0x3754 */
    /* 03753: inc cx */
    /* 03754: call 0x1689 */
    /* 03757: mov si, di */
    /* 03759: jmp 0x3743 */
    /* 0375B: mov word ptr [0x8f32], cx */
    /* 0375F: ret  */
}

void sub_03760(void) {
    /* 03760: cmp word ptr [si], 0 */
    /* 03763: je 0x376e */
    /* 03765: push word ptr [si + 0xa] */
    /* 03768: call 0x7a0 */
    /* 0376B: pop si */
    /* 0376C: jmp 0x3760 */
    /* 0376E: ret  */
}

void sub_0376F(void) {
    /* 0376F: mov di, word ptr [0x90a0] */
    /* 03773: cmp word ptr [di], 0 */
    /* 03776: je 0x3787 */
    /* 03778: cmp word ptr [di], 0x40 */
    /* 0377B: jne 0x3782 */
    /* 0377D: cmp si, word ptr [di + 0x1c] */
    /* 03780: je 0x3787 */
    /* 03782: mov di, word ptr [di + 0xa] */
    /* 03785: jmp 0x3773 */
    /* 03787: ret  */
}

void sub_03788(void) {
    /* 03788: push di */
    /* 03789: cmp word ptr [si], 0x34 */
    /* 0378C: jne 0x379d */
    /* 0378E: call 0x376f */
    /* 03791: cmp word ptr [di], 0 */
    /* 03794: je 0x379d */
    /* 03796: push si */
    /* 03797: mov si, di */
    /* 03799: call 0x7c0 */
    /* 0379C: pop si */
    /* 0379D: mov di, word ptr [si + 6] */
    /* 037A0: mov word ptr [di], 0 */
    /* 037A4: call 0x7c0 */
    /* 037A7: pop si */
    /* 037A8: ret  */
}

void sub_037A9(void) {
    /* 037A9: push di */
    /* 037AA: cmp word ptr [si], 0x34 */
    /* 037AD: jne 0x37be */
    /* 037AF: call 0x376f */
    /* 037B2: cmp word ptr [di], 0 */
    /* 037B5: je 0x37be */
    /* 037B7: push si */
    /* 037B8: mov si, di */
    /* 037BA: call 0x7a0 */
    /* 037BD: pop si */
    /* 037BE: mov di, word ptr [si + 6] */
    /* 037C1: mov word ptr [di], 0 */
    /* 037C5: call 0x7a0 */
    /* 037C8: pop di */
    /* 037C9: ret  */
}

void sub_03C75(void) {
    /* 03C75: call 0x6058 */
    /* 03C78: mov byte ptr [0x8f54], 0 */
    /* 03C7D: mov word ptr [0x8e6e], 1 */
    /* 03C83: mov byte ptr [0x8f55], 0 */
    /* 03C88: mov byte ptr [0x8f56], 0 */
    /* 03C8D: mov word ptr ss:[0x10], 0xbf */
    /* 03C94: call 0x426a */
    /* 03C97: mov word ptr [0x8e70], 1 */
    /* 03C9D: mov sp, word ptr [0x8e6a] */
    /* 03CA1: call 0xd5f */
    /* 03CA4: mov byte ptr [0x8f58], 0 */
    /* 03CA9: mov byte ptr [0x8f59], 0 */
    /* 03CAE: mov byte ptr [0x8f5b], 0 */
    /* 03CB3: mov word ptr [0x8e88], 0 */
    /* 03CB9: mov word ptr [0x8e8a], 0 */
    /* 03CBF: call 0x5863 */
    /* 03CC2: call 0x5b21 */
    /* 03CC5: call 0xd5f */
    /* 03CC8: mov word ptr [0x991c], 1 */
    /* 03CCE: mov byte ptr [0x3550], 0x31 */
    /* 03CD3: call 0x5cc5 */
    /* 03CD6: call 0x1827 */
    /* 03CD9: call 0x1b43 */
    /* 03CDC: mov byte ptr [0x3727], 0x31 */
    /* 03CE1: cmp byte ptr [0x8f5d], 0 */
    /* 03CE6: jne 0x3ced */
    /* 03CE8: mov byte ptr [0x3727], 0x32 */
    /* 03CED: mov si, 0x3715 */
    /* 03CF0: mov byte ptr [0x374e], 0xff */
    /* 03CF5: call 0x5926 */
    /* 03CF8: mov byte ptr [0x374e], 0 */
    /* 03CFD: call 0xd5f */
}

void sub_04191(void) {
    /* 04191: push dx */
    /* 04192: mov ax, 0x6255 */
    /* 04195: mul word ptr [0x304a] */
    /* 04199: add ax, 0x3619 */
    /* 0419C: mov word ptr [0x304a], ax */
    /* 0419F: pop dx */
    /* 041A0: ret  */
}

void sub_041A1(void) {
    /* 041A1: push dx */
    /* 041A2: push cx */
    /* 041A3: push ax */
    /* 041A4: call 0x4191 */
    /* 041A7: xor dx, dx */
    /* 041A9: pop cx */
    /* 041AA: div cx */
    /* 041AC: mov ax, dx */
    /* 041AE: pop cx */
    /* 041AF: pop dx */
    /* 041B0: ret  */
}

void sub_0426A(void) {
    /* 0426A: mov si, 0x9a40 */
    /* 0426D: mov cx, 0x30 */
    /* 04270: mov ax, 0xc0 */
    /* 04273: call 0x41a1 */
    /* 04276: mov word ptr [si], ax */
    /* 04278: mov ax, 0x28 */
    /* 0427B: cmp word ptr [0x3044], 0 */
    /* 04280: je 0x429d */
    /* 04282: cmp word ptr [0x3044], 3 */
    /* 04287: je 0x429d */
    /* 04289: mov ax, 0x50 */
    /* 0428C: cmp word ptr [0x3044], 2 */
    /* 04291: je 0x429d */
    /* 04293: cmp word ptr [0x3044], 4 */
    /* 04298: je 0x429d */
    /* 0429A: mov ax, 0xa0 */
    /* 0429D: call 0x41a1 */
    /* 042A0: mov word ptr [si + 2], ax */
    /* 042A3: mov word ptr [si + 4], 0 */
    /* 042A8: add si, 6 */
    /* 042AB: loop 0x4270 */
    /* 042AD: ret  */
}

void sub_0465C(void) {
    /* 0465C: inc dx */
    /* 0465D: push ax */
    /* 0465E: push dx */
    /* 0465F: mov ax, 0xa */
    /* 04662: mul cx */
    /* 04664: pop cx */
    /* 04665: div cx */
    /* 04667: mov si, ax */
    /* 04669: shl si, 1 */
    /* 0466B: mov si, word ptr [si + 0x3262] */
    /* 0466F: pop cx */
    /* 04670: mov dx, bx */
    /* 04672: jmp 0x875 */
    /* 04675: cmp word ptr [0x8e80], 0 */
    /* 0467A: jne 0x4690 */
    /* 0467C: cmp byte ptr [0x9224], 0 */
    /* 04681: jne 0x4690 */
    /* 04683: cmp word ptr [0x991e], 0 */
    /* 04688: je 0x469b */
    /* 0468A: dec word ptr [0x991e] */
    /* 0468E: jmp 0x469b */
    /* 04690: cmp word ptr [0x991e], 0x10 */
    /* 04695: je 0x469b */
    /* 04697: inc word ptr [0x991e] */
    /* 0469B: cmp word ptr [0x9150], 0 */
    /* 046A0: je 0x46b6 */
    /* 046A2: dec word ptr [0x9150] */
    /* 046A6: mov dx, 0xdd */
    /* 046A9: mov cx, word ptr [0x9150] */
    /* 046AD: mov ax, 0x126 */
    /* 046B0: mov bx, 8 */
    /* 046B3: call 0x465c */
}

void sub_04675(void) {
    /* 04675: cmp word ptr [0x8e80], 0 */
    /* 0467A: jne 0x4690 */
    /* 0467C: cmp byte ptr [0x9224], 0 */
    /* 04681: jne 0x4690 */
    /* 04683: cmp word ptr [0x991e], 0 */
    /* 04688: je 0x469b */
    /* 0468A: dec word ptr [0x991e] */
    /* 0468E: jmp 0x469b */
    /* 04690: cmp word ptr [0x991e], 0x10 */
    /* 04695: je 0x469b */
    /* 04697: inc word ptr [0x991e] */
    /* 0469B: cmp word ptr [0x9150], 0 */
    /* 046A0: je 0x46b6 */
    /* 046A2: dec word ptr [0x9150] */
    /* 046A6: mov dx, 0xdd */
    /* 046A9: mov cx, word ptr [0x9150] */
    /* 046AD: mov ax, 0x126 */
    /* 046B0: mov bx, 8 */
    /* 046B3: call 0x465c */
    /* 046B6: cmp word ptr [0x8e84], 0 */
    /* 046BB: je 0x46e4 */
    /* 046BD: dec word ptr [0x8e84] */
    /* 046C1: mov dx, 0x88 */
    /* 046C4: mov cx, word ptr [0x8e84] */
    /* 046C8: mov ax, 0x98 */
    /* 046CB: mov bx, 8 */
    /* 046CE: call 0x465c */
    /* 046D1: cmp word ptr [0x8e84], 0 */
    /* 046D6: jne 0x46e4 */
    /* 046D8: mov word ptr [0x8e82], 0xffff */
    /* 046DE: mov word ptr [0x8e88], 0x18 */
    /* 046E4: cmp word ptr [0x9162], 0 */
}

void sub_0472D(void) {
    /* 0472D: push si */
    /* 0472E: mov si, word ptr [0x9008] */
    /* 04732: cmp word ptr [si], 0 */
    /* 04735: je 0x4740 */
    /* 04737: push word ptr [si + 0xa] */
    /* 0473A: call 0x37a9 */
    /* 0473D: pop si */
    /* 0473E: jmp 0x4732 */
    /* 04740: mov ax, word ptr [0x91b4] */
    /* 04743: mov word ptr [0x9008], ax */
    /* 04746: mov ax, word ptr [0x91b6] */
    /* 04749: mov word ptr [0x9006], ax */
    /* 0474C: mov si, 0x91b8 */
    /* 0474F: mov di, 0x9134 */
    /* 04752: mov cx, 0xe */
    /* 04755: rep movsw word ptr es:[di], word ptr [si] */
    /* 04757: pop si */
    /* 04758: ret  */
}

void sub_04A69(void) {
    /* 04A69: mov word ptr ss:[0x10], 0xc7 */
    /* 04A70: call 0xbc7 */
    /* 04A73: call 0xd5f */
    /* 04A76: call 0xc0b */
    /* 04A79: mov byte ptr [0x3ade], 0xff */
    /* 04A7E: mov byte ptr [0x3adf], 0xff */
    /* 04A83: mov byte ptr [0x3ae0], 0 */
    /* 04A88: mov word ptr [0x3816], 0 */
    /* 04A8E: mov si, 0x3cb6 */
    /* 04A91: mov cx, 0x14 */
    /* 04A94: mov word ptr [si], 0xfff7 */
    /* 04A98: add si, 0xc */
    /* 04A9B: loop 0x4a94 */
    /* 04A9D: mov word ptr [0x8f3c], 0x30 */
    /* 04AA3: mov word ptr [0x8f3e], 0x44 */
    /* 04AA9: mov word ptr [0x8f40], 0 */
    /* 04AAF: mov word ptr [0x8f42], 0 */
    /* 04AB5: mov word ptr [0x8f44], 4 */
    /* 04ABB: call 0x5488 */
    /* 04ABE: mov word ptr [0x8f42], 1 */
    /* 04AC4: mov word ptr [0x8f44], 4 */
    /* 04ACA: call 0x5488 */
    /* 04ACD: call 0x577d */
    /* 04AD0: call 0x5612 */
    /* 04AD3: call 0xa51 */
    /* 04AD6: call 0x5612 */
    /* 04AD9: call 0xe09 */
    /* 04ADC: call 0xd81 */
    /* 04ADF: mov word ptr [0x8e88], 0 */
    /* 04AE5: call 0x4bc7 */
    /* 04AE8: mov word ptr [0x8e88], 7 */
    /* 04AEE: call 0x4c59 */
}

void sub_04BC7(void) {
    /* 04BC7: mov ax, word ptr [0x3046] */
    /* 04BCA: add ax, 9 */
    /* 04BCD: cmp ax, word ptr [0x3046] */
    /* 04BD1: jne 0x4bcd */
    /* 04BD3: ret  */
}

void sub_04C48(void) {
    /* 04C48: push cx */
    /* 04C49: call 0xc93 */
    /* 04C4C: call 0x5691 */
    /* 04C4F: call 0x56b8 */
    /* 04C52: call 0xa51 */
    /* 04C55: pop cx */
    /* 04C56: loop 0x4c48 */
    /* 04C58: ret  */
}

void sub_04C59(void) {
    /* 04C59: call 0xa51 */
    /* 04C5C: cmp word ptr [0x8f3c], 0 */
    /* 04C61: je 0x4c7c */
    /* 04C63: sub word ptr [0x8f3c], 4 */
    /* 04C68: js 0x4c6c */
    /* 04C6A: jne 0x4c7c */
    /* 04C6C: mov ah, 1 */
    /* 04C6E: int 0x80 */
    /* 04C70: mov ah, 2 */
    /* 04C72: mov al, 1 */
    /* 04C74: int 0x80 */
    /* 04C76: mov word ptr [0x8f3c], 0 */
    /* 04C7C: cmp word ptr [0x8f3e], 0 */
    /* 04C81: je 0x4c92 */
    /* 04C83: sub word ptr [0x8f3e], 4 */
    /* 04C88: je 0x4c92 */
    /* 04C8A: jns 0x4c92 */
    /* 04C8C: mov word ptr [0x8f3e], 0 */
    /* 04C92: call 0x5612 */
    /* 04C95: call 0x4cfa */
    /* 04C98: call 0x4d0d */
    /* 04C9B: cmp word ptr [0x8f3c], 0 */
    /* 04CA0: jne 0x4c59 */
    /* 04CA2: cmp word ptr [0x8f3e], 0 */
    /* 04CA7: jne 0x4c59 */
    /* 04CA9: call 0xc71 */
    /* 04CAC: ret  */
}

void sub_04CAD(void) {
    /* 04CAD: call 0xc71 */
    /* 04CB0: call 0xa51 */
    /* 04CB3: cmp word ptr [0x8f3e], 0x44 */
    /* 04CB8: je 0x4ccc */
    /* 04CBA: add word ptr [0x8f3e], 4 */
    /* 04CBF: cmp word ptr [0x8f3e], 0x44 */
    /* 04CC4: jle 0x4ccc */
    /* 04CC6: mov word ptr [0x8f3e], 0x44 */
    /* 04CCC: cmp word ptr [0x8f3c], 0x30 */
    /* 04CD1: je 0x4ce5 */
    /* 04CD3: add word ptr [0x8f3c], 4 */
    /* 04CD8: cmp word ptr [0x8f3c], 0x30 */
    /* 04CDD: jle 0x4ce5 */
    /* 04CDF: mov word ptr [0x8f3c], 0x30 */
    /* 04CE5: call 0x5612 */
    /* 04CE8: call 0x4d0d */
    /* 04CEB: call 0x4cfa */
    /* 04CEE: cmp word ptr [0x8f3e], 0x44 */
    /* 04CF3: jne 0x4cb0 */
    /* 04CF5: mov ah, 1 */
    /* 04CF7: int 0x80 */
    /* 04CF9: ret  */
}

void sub_04CFA(void) {
    /* 04CFA: mov dx, 4 */
    /* 04CFD: mov si, 0xb144 */
    /* 04D00: test word ptr [0x8f3c], 4 */
    /* 04D06: je 0x4d1e */
    /* 04D08: mov si, 0xb1ae */
    /* 04D0B: jmp 0x4d1e */
    /* 04D0D: mov dx, 0x6d */
    /* 04D10: mov si, 0xb144 */
    /* 04D13: test word ptr [0x8f3e], 4 */
    /* 04D19: je 0x4d1e */
    /* 04D1B: mov si, 0xb1ae */
    /* 04D1E: push dx */
    /* 04D1F: push si */
    /* 04D20: mov cx, 0xe2 */
    /* 04D23: call 0xc2d */
    /* 04D26: pop si */
    /* 04D27: pop dx */
    /* 04D28: push dx */
    /* 04D29: push si */
    /* 04D2A: mov cx, 0x102 */
    /* 04D2D: call 0xc2d */
    /* 04D30: pop si */
    /* 04D31: pop dx */
    /* 04D32: mov cx, 0x122 */
    /* 04D35: jmp 0xc2d */
    /* 04D38: mov bx, word ptr [0x3816] */
    /* 04D3C: shl bx, 1 */
    /* 04D3E: mov ax, word ptr [bx + 0x38d0] */
    /* 04D42: cmp word ptr [0x991c], 5 */
    /* 04D47: jne 0x4d4b */
    /* 04D49: shr ax, 1 */
    /* 04D4B: cdq  */
}

void sub_04D0D(void) {
    /* 04D0D: mov dx, 0x6d */
    /* 04D10: mov si, 0xb144 */
    /* 04D13: test word ptr [0x8f3e], 4 */
    /* 04D19: je 0x4d1e */
    /* 04D1B: mov si, 0xb1ae */
    /* 04D1E: push dx */
    /* 04D1F: push si */
    /* 04D20: mov cx, 0xe2 */
    /* 04D23: call 0xc2d */
    /* 04D26: pop si */
    /* 04D27: pop dx */
    /* 04D28: push dx */
    /* 04D29: push si */
    /* 04D2A: mov cx, 0x102 */
    /* 04D2D: call 0xc2d */
    /* 04D30: pop si */
    /* 04D31: pop dx */
    /* 04D32: mov cx, 0x122 */
    /* 04D35: jmp 0xc2d */
    /* 04D38: mov bx, word ptr [0x3816] */
    /* 04D3C: shl bx, 1 */
    /* 04D3E: mov ax, word ptr [bx + 0x38d0] */
    /* 04D42: cmp word ptr [0x991c], 5 */
    /* 04D47: jne 0x4d4b */
    /* 04D49: shr ax, 1 */
    /* 04D4B: cdq  */
    /* 04D4C: cmp dx, word ptr [0x915c] */
    /* 04D50: jl 0x4d60 */
    /* 04D52: jne 0x4d5a */
    /* 04D54: cmp ax, word ptr [0x915a] */
    /* 04D58: jbe 0x4d60 */
    /* 04D5A: mov word ptr [0x3816], 0 */
}

void sub_04D38(void) {
    /* 04D38: mov bx, word ptr [0x3816] */
    /* 04D3C: shl bx, 1 */
    /* 04D3E: mov ax, word ptr [bx + 0x38d0] */
    /* 04D42: cmp word ptr [0x991c], 5 */
    /* 04D47: jne 0x4d4b */
    /* 04D49: shr ax, 1 */
    /* 04D4B: cdq  */
    /* 04D4C: cmp dx, word ptr [0x915c] */
    /* 04D50: jl 0x4d60 */
    /* 04D52: jne 0x4d5a */
    /* 04D54: cmp ax, word ptr [0x915a] */
    /* 04D58: jbe 0x4d60 */
    /* 04D5A: mov word ptr [0x3816], 0 */
    /* 04D60: mov si, 0x3cb6 */
    /* 04D63: mov bp, word ptr [0x3816] */
    /* 04D67: add bp, 2 */
    /* 04D6A: mov bx, bp */
    /* 04D6C: dec bx */
    /* 04D6D: shl bx, 1 */
    /* 04D6F: mov di, 0x38d0 */
    /* 04D72: add di, bx */
    /* 04D74: add bx, 0x389a */
    /* 04D78: mov ax, word ptr [di] */
    /* 04D7A: cmp word ptr [0x991c], 5 */
    /* 04D7F: jne 0x4d83 */
    /* 04D81: shr ax, 1 */
    /* 04D83: cmp ax, word ptr [0x8f4a] */
    /* 04D87: jg 0x4da2 */
    /* 04D89: cdq  */
    /* 04D8A: cmp dx, word ptr [0x915c] */
    /* 04D8E: jg 0x4da2 */
    /* 04D90: jne 0x4d98 */
}

void sub_04E12(void) {
    /* 04E12: mov si, 0x3cb6 */
    /* 04E15: mov word ptr [si + 6], 0x1a */
    /* 04E1A: mov word ptr [si + 8], 0x3ae8 */
    /* 04E1F: add si, 0xc */
    /* 04E22: cmp si, 0x3d9a */
    /* 04E26: jl 0x4e15 */
    /* 04E28: ret  */
}

void sub_04E29(void) {
    /* 04E29: mov si, 0x3cb6 */
    /* 04E2C: mov cx, 0x14 */
    /* 04E2F: mov ax, word ptr [si + 6] */
    /* 04E32: test ax, ax */
    /* 04E34: je 0x4e72 */
    /* 04E36: cmp ax, 0x1b */
    /* 04E39: jne 0x4e43 */
    /* 04E3B: cmp word ptr [si - 6], 0x1a */
    /* 04E3F: je 0x4e68 */
    /* 04E41: jmp 0x4e72 */
    /* 04E43: cmp ax, 0x1a */
    /* 04E46: jge 0x4e72 */
    /* 04E48: mov bx, ax */
    /* 04E4A: shl bx, 1 */
    /* 04E4C: mov ax, word ptr [bx + 0x38ce] */
    /* 04E50: cmp word ptr [0x991c], 5 */
    /* 04E55: jne 0x4e59 */
    /* 04E57: shr ax, 1 */
    /* 04E59: cdq  */
    /* 04E5A: cmp dx, word ptr [0x915c] */
    /* 04E5E: jl 0x4e72 */
    /* 04E60: jne 0x4e68 */
    /* 04E62: cmp ax, word ptr [0x915a] */
    /* 04E66: jbe 0x4e72 */
    /* 04E68: mov word ptr [si + 6], 0x1a */
    /* 04E6D: mov word ptr [si + 8], 0x3ae8 */
    /* 04E72: add si, 0xc */
    /* 04E75: loop 0x4e2f */
    /* 04E77: ret  */
}

void sub_04E78(void) {
    /* 04E78: mov word ptr [0x8f42], 0 */
    /* 04E7E: mov word ptr [0x8f44], 0 */
    /* 04E84: mov word ptr [0x3818], 0xffff */
    /* 04E8A: call 0x5435 */
    /* 04E8D: mov word ptr [0x39b2], 0xffff */
    /* 04E93: mov byte ptr [0x8f5b], 0 */
    /* 04E98: call 0x5369 */
    /* 04E9B: cmp word ptr [0x8f44], 4 */
    /* 04EA0: je 0x4f20 */
    /* 04EA2: mov ax, word ptr [0x8f42] */
    /* 04EA5: mov bx, word ptr [0x8f44] */
    /* 04EA9: cmp ax, word ptr [0x3818] */
    /* 04EAD: jne 0x4eb5 */
    /* 04EAF: cmp bx, word ptr [0x381a] */
    /* 04EB3: je 0x4f27 */
    /* 04EB5: mov dx, bx */
    /* 04EB7: shl bx, 1 */
    /* 04EB9: shl bx, 1 */
    /* 04EBB: add bx, dx */
    /* 04EBD: add ax, bx */
    /* 04EBF: mov bx, 0xc */
    /* 04EC2: mul bx */
    /* 04EC4: mov si, 0x3cb6 */
    /* 04EC7: add si, ax */
    /* 04EC9: mov ax, word ptr [si + 6] */
    /* 04ECC: test ax, ax */
    /* 04ECE: je 0x4e93 */
    /* 04ED0: cmp ax, 0x1a */
    /* 04ED3: je 0x4ef3 */
    /* 04ED5: cmp ax, 0x1b */
    /* 04ED8: je 0x4f04 */
    /* 04EDA: mov ax, word ptr [0x8f42] */
}

void sub_04FE3(void) {
    /* 04FE3: mov si, word ptr [0x39b4] */
    /* 04FE7: mov bx, word ptr [si + 6] */
    /* 04FEA: cmp bx, 3 */
    /* 04FED: jne 0x4ff2 */
    /* 04FEF: jmp 0x50b4 */
    /* 04FF2: cmp bx, 4 */
    /* 04FF5: jne 0x4ffa */
    /* 04FF7: jmp 0x50bd */
    /* 04FFA: cmp bx, 7 */
    /* 04FFD: jne 0x5002 */
    /* 04FFF: jmp 0x50bd */
    /* 05002: cmp bx, 5 */
    /* 05005: jne 0x500a */
    /* 05007: jmp 0x50c6 */
    /* 0500A: cmp bx, 6 */
    /* 0500D: jne 0x5012 */
    /* 0500F: jmp 0x50cf */
    /* 05012: cmp bx, 0xc */
    /* 05015: jne 0x501a */
    /* 05017: jmp 0x50d8 */
    /* 0501A: cmp bx, 0x10 */
    /* 0501D: jne 0x5022 */
    /* 0501F: jmp 0x50f5 */
    /* 05022: cmp bx, 0x16 */
    /* 05025: jne 0x502a */
    /* 05027: jmp 0x50fe */
    /* 0502A: cmp bx, 0x18 */
    /* 0502D: jne 0x5032 */
    /* 0502F: jmp 0x5107 */
    /* 05032: cmp bx, 0x19 */
    /* 05035: jne 0x503a */
    /* 05037: jmp 0x5110 */
}

void sub_05119(void) {
    /* 05119: mov si, 0x3cb6 */
    /* 0511C: mov di, word ptr [0x9008] */
    /* 05120: cmp word ptr [di], 0 */
    /* 05123: je 0x5145 */
    /* 05125: cmp word ptr [di], 0x94 */
    /* 05129: je 0x5140 */
    /* 0512B: mov bx, word ptr [di + 0x36] */
    /* 0512E: mov word ptr [si + 6], bx */
    /* 05131: mov word ptr [si + 0xa], di */
    /* 05134: shl bx, 1 */
    /* 05136: mov ax, word ptr [bx + 0x3898] */
    /* 0513A: mov word ptr [si + 8], ax */
    /* 0513D: add si, 0xc */
    /* 05140: mov di, word ptr [di + 0xa] */
    /* 05143: jmp 0x5120 */
    /* 05145: mov word ptr [si + 6], 0 */
    /* 0514A: add si, 0xc */
    /* 0514D: cmp si, 0x3d9a */
    /* 05151: jle 0x5145 */
    /* 05153: ret  */
}

void sub_05154(void) {
    /* 05154: mov word ptr [0x8f42], 0 */
    /* 0515A: mov word ptr [0x8f44], 0 */
    /* 05160: mov word ptr [0x3818], 0xffff */
    /* 05166: call 0x5435 */
    /* 05169: mov word ptr [0x39b2], 0xffff */
    /* 0516F: mov byte ptr [0x8f5b], 0 */
    /* 05174: call 0x5369 */
    /* 05177: cmp word ptr [0x8f44], 4 */
    /* 0517C: je 0x51d5 */
    /* 0517E: mov ax, word ptr [0x8f42] */
    /* 05181: mov bx, word ptr [0x8f44] */
    /* 05185: cmp ax, word ptr [0x3818] */
    /* 05189: jne 0x5191 */
    /* 0518B: cmp bx, word ptr [0x381a] */
    /* 0518F: je 0x51dc */
    /* 05191: mov dx, bx */
    /* 05193: shl bx, 1 */
    /* 05195: shl bx, 1 */
    /* 05197: add bx, dx */
    /* 05199: add ax, bx */
    /* 0519B: mov bx, 0xc */
    /* 0519E: mul bx */
    /* 051A0: mov si, 0x3cb6 */
    /* 051A3: add si, ax */
    /* 051A5: mov ax, word ptr [si + 6] */
    /* 051A8: test ax, ax */
    /* 051AA: je 0x516f */
    /* 051AC: mov ax, word ptr [0x8f42] */
    /* 051AF: mov word ptr [0x3818], ax */
    /* 051B2: mov ax, word ptr [0x8f44] */
    /* 051B5: mov word ptr [0x381a], ax */
    /* 051B8: push si */
}

void sub_0521A(void) {
    /* 0521A: mov word ptr [0x39b4], si */
    /* 0521E: mov si, 0x3ac2 */
    /* 05221: call 0x5787 */
    /* 05224: mov si, word ptr [0x39b4] */
    /* 05228: mov bx, word ptr [si + 6] */
    /* 0522B: shl bx, 1 */
    /* 0522D: mov ax, word ptr [bx + 0x38ce] */
    /* 05231: cmp word ptr [0x991c], 5 */
    /* 05236: jne 0x523a */
    /* 05238: shr ax, 1 */
    /* 0523A: mov word ptr [0x39b2], ax */
    /* 0523D: jmp 0x57fa */
    /* 05240: mov word ptr [0x39b4], si */
    /* 05244: mov word ptr [0x3c9a], 0xf7 */
    /* 0524A: mov word ptr [0x3c9c], 0x78 */
    /* 05250: mov word ptr [0x3c9e], 0xf700 */
    /* 05256: call 0xa51 */
    /* 05259: call 0xc93 */
    /* 0525C: call 0x5691 */
    /* 0525F: call 0x56b8 */
    /* 05262: call 0x54db */
    /* 05265: sub word ptr [0x3c9c], 2 */
    /* 0526A: cmp word ptr [0x3c9c], 0x68 */
    /* 0526F: jg 0x5256 */
    /* 05271: mov cx, 3 */
    /* 05274: call 0x54fc */
    /* 05277: mov word ptr [0x3c9e], 0xf470 */
    /* 0527D: mov cx, 3 */
    /* 05280: call 0x54fc */
    /* 05283: mov word ptr [0x3c9e], 0xf700 */
    /* 05289: mov cx, 3 */
    /* 0528C: call 0x54fc */
}

void sub_05240(void) {
    /* 05240: mov word ptr [0x39b4], si */
    /* 05244: mov word ptr [0x3c9a], 0xf7 */
    /* 0524A: mov word ptr [0x3c9c], 0x78 */
    /* 05250: mov word ptr [0x3c9e], 0xf700 */
    /* 05256: call 0xa51 */
    /* 05259: call 0xc93 */
    /* 0525C: call 0x5691 */
    /* 0525F: call 0x56b8 */
    /* 05262: call 0x54db */
    /* 05265: sub word ptr [0x3c9c], 2 */
    /* 0526A: cmp word ptr [0x3c9c], 0x68 */
    /* 0526F: jg 0x5256 */
    /* 05271: mov cx, 3 */
    /* 05274: call 0x54fc */
    /* 05277: mov word ptr [0x3c9e], 0xf470 */
    /* 0527D: mov cx, 3 */
    /* 05280: call 0x54fc */
    /* 05283: mov word ptr [0x3c9e], 0xf700 */
    /* 05289: mov cx, 3 */
    /* 0528C: call 0x54fc */
    /* 0528F: mov word ptr [0x3c9e], 0xf990 */
    /* 05295: mov cx, 3 */
    /* 05298: call 0x54fc */
    /* 0529B: mov word ptr [0x3c9e], 0xf700 */
    /* 052A1: mov cx, 3 */
    /* 052A4: call 0x54fc */
    /* 052A7: mov word ptr [0x3c9e], 0xf470 */
    /* 052AD: mov cx, 3 */
    /* 052B0: call 0x54fc */
    /* 052B3: mov word ptr [0x3c9e], 0xf700 */
    /* 052B9: mov cx, 3 */
    /* 052BC: call 0x54fc */
}

void sub_05319(void) {
    /* 05319: push bx */
    /* 0531A: push ax */
    /* 0531B: call 0x576d */
    /* 0531E: pop bx */
    /* 0531F: push bx */
    /* 05320: shl bx, 1 */
    /* 05322: mov si, word ptr [bx + 0x3866] */
    /* 05326: call 0x5787 */
    /* 05329: pop ax */
    /* 0532A: pop bx */
    /* 0532B: cmp byte ptr [0x3ade], 0 */
    /* 05330: je 0x5368 */
    /* 05332: cmp ax, 1 */
    /* 05335: je 0x535c */
    /* 05337: cmp ax, 0x13 */
    /* 0533A: je 0x535c */
    /* 0533C: cmp ax, 0x12 */
    /* 0533F: je 0x535c */
    /* 05341: cmp ax, 8 */
    /* 05344: je 0x535c */
    /* 05346: cmp ax, 0xa */
    /* 05349: je 0x535c */
    /* 0534B: cmp ax, 0xe */
    /* 0534E: je 0x535c */
    /* 05350: cmp ax, 9 */
    /* 05353: je 0x535c */
    /* 05355: cmp ax, 0xd */
    /* 05358: je 0x535c */
    /* 0535A: jmp 0x5368 */
    /* 0535C: push bx */
    /* 0535D: mov si, 0x3ad4 */
    /* 05360: call 0x5787 */
}

void sub_05369(void) {
    /* 05369: cmp word ptr [0x3adc], 0 */
    /* 0536E: je 0x5377 */
    /* 05370: dec word ptr [0x3adc] */
    /* 05374: jmp 0x5416 */
    /* 05377: cmp byte ptr [0x8f5b], 0 */
    /* 0537C: je 0x5381 */
    /* 0537E: jmp 0x5429 */
    /* 05381: cmp byte ptr [0x8f59], 0 */
    /* 05386: jne 0x538b */
    /* 05388: jmp 0x5416 */
    /* 0538B: mov word ptr [0x8e88], 8 */
    /* 05391: mov word ptr [0x3adc], 4 */
    /* 05397: call 0x5488 */
    /* 0539A: test byte ptr [0x8f59], 4 */
    /* 0539F: je 0x53c5 */
    /* 053A1: cmp word ptr [0x8f44], 4 */
    /* 053A6: jne 0x53b7 */
    /* 053A8: xor ax, ax */
    /* 053AA: cmp word ptr [0x8f42], 0 */
    /* 053AF: jne 0x53b2 */
    /* 053B1: inc ax */
    /* 053B2: mov word ptr [0x8f42], ax */
    /* 053B5: jmp 0x5413 */
    /* 053B7: dec word ptr [0x8f42] */
    /* 053BB: jns 0x5413 */
    /* 053BD: mov word ptr [0x8f42], 4 */
    /* 053C3: jmp 0x5413 */
    /* 053C5: test byte ptr [0x8f59], 8 */
    /* 053CA: je 0x53e6 */
    /* 053CC: cmp word ptr [0x8f44], 4 */
    /* 053D1: je 0x53a8 */
    /* 053D3: inc word ptr [0x8f42] */
}

void sub_05435(void) {
    /* 05435: mov bx, word ptr [0x8f44] */
    /* 05439: cmp bx, 4 */
    /* 0543C: je 0x5465 */
    /* 0543E: mov bp, bx */
    /* 05440: shl bx, 1 */
    /* 05442: shl bx, 1 */
    /* 05444: add bx, bp */
    /* 05446: add bx, word ptr [0x8f42] */
    /* 0544A: mov ax, 0xc */
    /* 0544D: mul bx */
    /* 0544F: mov bx, ax */
    /* 05451: mov cx, word ptr [bx + 0x3cb8] */
    /* 05455: mov dx, word ptr [bx + 0x3cba] */
    /* 05459: add cx, 0xa */
    /* 0545C: add dx, 0x1f */
    /* 0545F: mov si, 0xb282 */
    /* 05462: jmp 0xc2d */
    /* 05465: mov cx, 4 */
    /* 05468: mov si, 0xdde0 */
    /* 0546B: cmp word ptr [0x8f42], 0 */
    /* 05470: je 0x5482 */
    /* 05472: mov cx, 0x2d */
    /* 05475: mov si, 0xe1e8 */
    /* 05478: cmp byte ptr [0x3ade], 0 */
    /* 0547D: jne 0x5482 */
    /* 0547F: mov si, 0xdfe4 */
    /* 05482: mov dx, 0xa8 */
    /* 05485: jmp 0xc2d */
    /* 05488: mov bx, word ptr [0x8f44] */
    /* 0548C: cmp bx, 4 */
    /* 0548F: je 0x54b8 */
    /* 05491: mov ax, bx */
}

void sub_05488(void) {
    /* 05488: mov bx, word ptr [0x8f44] */
    /* 0548C: cmp bx, 4 */
    /* 0548F: je 0x54b8 */
    /* 05491: mov ax, bx */
    /* 05493: shl bx, 1 */
    /* 05495: shl bx, 1 */
    /* 05497: add bx, ax */
    /* 05499: add bx, word ptr [0x8f42] */
    /* 0549D: mov ax, 0xc */
    /* 054A0: mul bx */
    /* 054A2: mov bx, ax */
    /* 054A4: mov cx, word ptr [bx + 0x3cb8] */
    /* 054A8: mov dx, word ptr [bx + 0x3cba] */
    /* 054AC: add cx, 0xa */
    /* 054AF: add dx, 0x1f */
    /* 054B2: mov si, 0xb218 */
    /* 054B5: jmp 0xc2d */
    /* 054B8: mov cx, 4 */
    /* 054BB: mov si, 0xe3ec */
    /* 054BE: cmp word ptr [0x8f42], 0 */
    /* 054C3: je 0x54d5 */
    /* 054C5: mov cx, 0x2d */
    /* 054C8: mov si, 0xe7f4 */
    /* 054CB: cmp byte ptr [0x3ade], 0 */
    /* 054D0: jne 0x54d5 */
    /* 054D2: mov si, 0xe5f0 */
    /* 054D5: mov dx, 0xa8 */
    /* 054D8: jmp 0xc2d */
    /* 054DB: push word ptr ss:[0x10] */
    /* 054E0: mov word ptr ss:[0x10], 0x68 */
    /* 054E7: mov cx, word ptr [0x3c9a] */
    /* 054EB: mov dx, word ptr [0x3c9c] */
}

void sub_054DB(void) {
    /* 054DB: push word ptr ss:[0x10] */
    /* 054E0: mov word ptr ss:[0x10], 0x68 */
    /* 054E7: mov cx, word ptr [0x3c9a] */
    /* 054EB: mov dx, word ptr [0x3c9c] */
    /* 054EF: mov si, word ptr [0x3c9e] */
    /* 054F3: call 0x875 */
    /* 054F6: pop word ptr ss:[0x10] */
    /* 054FB: ret  */
}

void sub_054FC(void) {
    /* 054FC: push cx */
    /* 054FD: call 0xa51 */
    /* 05500: call 0x5691 */
    /* 05503: call 0x56b8 */
    /* 05506: call 0xc93 */
    /* 05509: call 0x54db */
    /* 0550C: pop cx */
    /* 0550D: loop 0x54fc */
    /* 0550F: ret  */
}

void sub_05510(void) {
    /* 05510: mov word ptr [0x3c9a], 0x106 */
    /* 05516: mov word ptr [0x3c9c], 0x88 */
    /* 0551C: mov word ptr [0x3c9e], 0xf700 */
    /* 05522: call 0xa51 */
    /* 05525: call 0x5691 */
    /* 05528: call 0x56b8 */
    /* 0552B: call 0xc93 */
    /* 0552E: call 0x54db */
    /* 05531: cmp word ptr [0x3c9a], 0x11c */
    /* 05537: je 0x5545 */
    /* 05539: add word ptr [0x3c9a], 2 */
    /* 0553E: sub word ptr [0x3c9c], 2 */
    /* 05543: jmp 0x5522 */
    /* 05545: mov word ptr [0x3c9e], 0xf990 */
    /* 0554B: mov cx, 6 */
    /* 0554E: call 0x54fc */
    /* 05551: mov ah, 1 */
    /* 05553: int 0x80 */
    /* 05555: mov word ptr [0x8e88], 8 */
    /* 0555B: mov byte ptr [0x3adf], 0 */
    /* 05560: mov word ptr [0x3c9e], 0xf700 */
    /* 05566: mov cx, 6 */
    /* 05569: call 0x54fc */
    /* 0556C: call 0xa51 */
    /* 0556F: call 0x5691 */
    /* 05572: call 0x56b8 */
    /* 05575: call 0xc93 */
    /* 05578: call 0x54db */
    /* 0557B: sub word ptr [0x3c9a], 2 */
    /* 05580: add word ptr [0x3c9c], 2 */
    /* 05585: cmp word ptr [0x3c9a], 0x106 */
    /* 0558B: jg 0x556c */
}

void sub_0558E(void) {
    /* 0558E: call 0xa51 */
    /* 05591: mov si, 0x3cb6 */
    /* 05594: mov cx, 0x14 */
    /* 05597: inc word ptr [si] */
    /* 05599: add si, 0xc */
    /* 0559C: loop 0x5597 */
    /* 0559E: cmp word ptr [0x3cb6], 0 */
    /* 055A3: je 0x55ad */
    /* 055A5: call 0x56b8 */
    /* 055A8: call 0xc93 */
    /* 055AB: jmp 0x558e */
    /* 055AD: mov si, 0x3cb6 */
    /* 055B0: mov cx, 0x14 */
    /* 055B3: mov word ptr [si], 1 */
    /* 055B7: add si, 0xc */
    /* 055BA: loop 0x55b3 */
    /* 055BC: mov cx, 5 */
    /* 055BF: push cx */
    /* 055C0: jmp 0x55c6 */
    /* 055C2: push cx */
    /* 055C3: call 0xa51 */
    /* 055C6: call 0x56b8 */
    /* 055C9: call 0xc93 */
    /* 055CC: pop cx */
    /* 055CD: loop 0x55c2 */
    /* 055CF: ret  */
}

void sub_055D0(void) {
    /* 055D0: mov si, 0x3cb6 */
    /* 055D3: mov cx, 0x14 */
    /* 055D6: mov word ptr [si], 0 */
    /* 055DA: add si, 0xc */
    /* 055DD: loop 0x55d6 */
    /* 055DF: call 0xa51 */
    /* 055E2: mov si, 0x3cb6 */
    /* 055E5: mov cx, 0x14 */
    /* 055E8: dec word ptr [si] */
    /* 055EA: add si, 0xc */
    /* 055ED: loop 0x55e8 */
    /* 055EF: cmp word ptr [0x3cb6], -9 */
    /* 055F4: je 0x55fe */
    /* 055F6: call 0x56b8 */
    /* 055F9: call 0xc93 */
    /* 055FC: jmp 0x55df */
    /* 055FE: mov cx, 0xb */
    /* 05601: push cx */
    /* 05602: jmp 0x5608 */
    /* 05604: push cx */
    /* 05605: call 0xa51 */
    /* 05608: call 0x56b8 */
    /* 0560B: call 0xc93 */
    /* 0560E: pop cx */
    /* 0560F: loop 0x5604 */
    /* 05611: ret  */
}

void sub_05612(void) {
    /* 05612: call 0x56b8 */
    /* 05615: call 0xc93 */
    /* 05618: call 0xcb5 */
    /* 0561B: ret  */
}

void sub_05691(void) {
    /* 05691: mov si, 0x3cb6 */
    /* 05694: mov cx, 0x14 */
    /* 05697: cmp word ptr [si + 6], 0 */
    /* 0569B: jne 0x56a3 */
    /* 0569D: mov word ptr [si], 0 */
    /* 056A1: jmp 0x56b2 */
    /* 056A3: dec word ptr [si] */
    /* 056A5: jg 0x56b2 */
    /* 056A7: call 0x4191 */
    /* 056AA: and ax, 0xff */
    /* 056AD: add ax, 0x14 */
    /* 056B0: mov word ptr [si], ax */
    /* 056B2: add si, 0xc */
    /* 056B5: loop 0x5697 */
    /* 056B7: ret  */
}

void sub_056B8(void) {
    /* 056B8: mov di, 0x3cb6 */
    /* 056BB: mov cx, 0x14 */
    /* 056BE: push cx */
    /* 056BF: cmp word ptr [di], 0 */
    /* 056C2: jg 0x56ec */
    /* 056C4: cmp word ptr [di], -8 */
    /* 056C7: je 0x56d4 */
    /* 056C9: call 0xcd7 */
    /* 056CC: cmp word ptr [di], 0 */
    /* 056CF: jne 0x56d4 */
    /* 056D1: jmp 0x5761 */
    /* 056D4: push di */
    /* 056D5: mov cx, word ptr [di + 2] */
    /* 056D8: mov dx, word ptr [di + 4] */
    /* 056DB: mov bx, word ptr [di] */
    /* 056DD: add bx, 9 */
    /* 056E0: shl bx, 1 */
    /* 056E2: mov si, word ptr [bx + 0x3ca0] */
    /* 056E6: call 0x875 */
    /* 056E9: pop di */
    /* 056EA: jmp 0x5761 */
    /* 056EC: cmp word ptr [di], 2 */
    /* 056EF: jg 0x5705 */
    /* 056F1: jne 0x5700 */
    /* 056F3: cmp word ptr [0x8e88], 0 */
    /* 056F8: jns 0x5700 */
    /* 056FA: mov word ptr [0x8e8a], 0 */
    /* 05700: call 0xcd7 */
    /* 05703: jmp 0x5761 */
    /* 05705: pop bx */
    /* 05706: push bx */
    /* 05707: and bx, 1 */
}

void sub_0576D(void) {
    /* 0576D: call 0xc71 */
    /* 05770: mov word ptr [0x8f46], 0x37 */
    /* 05776: mov word ptr [0x8f48], 0x76 */
    /* 0577C: ret  */
}

void sub_0577D(void) {
    /* 0577D: mov ax, word ptr [0x915a] */
    /* 05780: mov dx, word ptr [0x915c] */
    /* 05784: jmp 0xb1d */
    /* 05787: mov byte ptr [0x8f40], 0xff */
    /* 0578C: push si */
    /* 0578D: call 0x5691 */
    /* 05790: call 0x56b8 */
    /* 05793: call 0xc93 */
    /* 05796: call 0xa51 */
    /* 05799: pop si */
    /* 0579A: call 0x4191 */
    /* 0579D: and ax, 3 */
    /* 057A0: je 0x579a */
    /* 057A2: dec ax */
    /* 057A3: or ax, 0x80 */
    /* 057A6: xor ax, ax */
    /* 057A8: mov di, si */
    /* 057AA: cmp byte ptr [di], 0 */
    /* 057AD: je 0x57bd */
    /* 057AF: cmp byte ptr [di], 0x20 */
    /* 057B2: je 0x57bd */
    /* 057B4: cmp byte ptr [di], 0xd */
    /* 057B7: je 0x57bd */
    /* 057B9: inc ax */
    /* 057BA: inc di */
    /* 057BB: jmp 0x57aa */
    /* 057BD: add ax, word ptr [0x8f46] */
    /* 057C1: cmp ax, 0x4b */
    /* 057C4: jle 0x57c9 */
    /* 057C6: call 0x5829 */
    /* 057C9: xor ax, ax */
    /* 057CB: lodsb al, byte ptr [si] */
}

void sub_05787(void) {
    /* 05787: mov byte ptr [0x8f40], 0xff */
    /* 0578C: push si */
    /* 0578D: call 0x5691 */
    /* 05790: call 0x56b8 */
    /* 05793: call 0xc93 */
    /* 05796: call 0xa51 */
    /* 05799: pop si */
    /* 0579A: call 0x4191 */
    /* 0579D: and ax, 3 */
    /* 057A0: je 0x579a */
    /* 057A2: dec ax */
    /* 057A3: or ax, 0x80 */
    /* 057A6: xor ax, ax */
    /* 057A8: mov di, si */
    /* 057AA: cmp byte ptr [di], 0 */
    /* 057AD: je 0x57bd */
    /* 057AF: cmp byte ptr [di], 0x20 */
    /* 057B2: je 0x57bd */
    /* 057B4: cmp byte ptr [di], 0xd */
    /* 057B7: je 0x57bd */
    /* 057B9: inc ax */
    /* 057BA: inc di */
    /* 057BB: jmp 0x57aa */
    /* 057BD: add ax, word ptr [0x8f46] */
    /* 057C1: cmp ax, 0x4b */
    /* 057C4: jle 0x57c9 */
    /* 057C6: call 0x5829 */
    /* 057C9: xor ax, ax */
    /* 057CB: lodsb al, byte ptr [si] */
    /* 057CC: test al, al */
    /* 057CE: je 0x57f4 */
    /* 057D0: cmp al, 0x20 */
}

void sub_057FA(void) {
    /* 057FA: mov byte ptr [0x8f40], 0xff */
    /* 057FF: push ax */
    /* 05800: call 0xa51 */
    /* 05803: call 0x5691 */
    /* 05806: call 0x56b8 */
    /* 05809: call 0xc93 */
    /* 0580C: pop ax */
    /* 0580D: cmp ax, 0xa */
    /* 05810: jl 0x581d */
    /* 05812: cdq  */
    /* 05813: mov bx, 0xa */
    /* 05816: div bx */
    /* 05818: push dx */
    /* 05819: call 0x580d */
    /* 0581C: pop ax */
    /* 0581D: add ax, 0x30 */
    /* 05820: call 0xcf9 */
    /* 05823: mov byte ptr [0x8f40], 0 */
    /* 05828: ret  */
}

void sub_0580D(void) {
    /* 0580D: cmp ax, 0xa */
    /* 05810: jl 0x581d */
    /* 05812: cdq  */
    /* 05813: mov bx, 0xa */
    /* 05816: div bx */
    /* 05818: push dx */
    /* 05819: call 0x580d */
    /* 0581C: pop ax */
    /* 0581D: add ax, 0x30 */
    /* 05820: call 0xcf9 */
    /* 05823: mov byte ptr [0x8f40], 0 */
    /* 05828: ret  */
}

void sub_05829(void) {
    /* 05829: mov ax, 0x37 */
    /* 0582C: mov word ptr [0x8f46], ax */
    /* 0582F: add word ptr [0x8f48], 7 */
    /* 05834: ret  */
}

void sub_05863(void) {
    /* 05863: xor ax, ax */
    /* 05865: mov ah, 2 */
    /* 05867: mov al, 0 */
    /* 05869: int 0x80 */
    /* 0586B: mov word ptr [0x3754], 0x3625 */
    /* 05871: mov word ptr [0x3752], 0x78 */
    /* 05877: mov word ptr [0x3750], 0 */
    /* 0587D: mov di, 0x9a40 */
    /* 05880: mov cx, 0x30 */
    /* 05883: call 0x4191 */
    /* 05886: stosw word ptr es:[di], ax */
    /* 05887: call 0x4191 */
    /* 0588A: stosw word ptr es:[di], ax */
    /* 0588B: call 0x4191 */
    /* 0588E: and ax, 0x1fff */
    /* 05891: stosw word ptr es:[di], ax */
    /* 05892: loop 0x5883 */
    /* 05894: call 0xde7 */
    /* 05897: call 0xd81 */
    /* 0589A: cmp byte ptr [0x8f5b], 0 */
    /* 0589F: jne 0x5916 */
    /* 058A1: call 0xa0d */
    /* 058A4: call 0xd1b */
    /* 058A7: cmp word ptr [0x3750], 0x12 */
    /* 058AC: jl 0x58d9 */
    /* 058AE: mov word ptr [0x3752], 0x78 */
    /* 058B4: mov si, word ptr [0x3754] */
    /* 058B8: call 0xafb */
    /* 058BB: cmp word ptr [0x3750], 0x24 */
    /* 058C0: jl 0x58d9 */
    /* 058C2: cmp word ptr [0x3750], 0x36 */
    /* 058C7: jge 0x58d9 */
}

void sub_05926(void) {
    /* 05926: push si */
    /* 05927: push cx */
    /* 05928: call 0x5935 */
    /* 0592B: pop cx */
    /* 0592C: pop si */
    /* 0592D: mov ax, 0x64 */
    /* 05930: call 0x595d */
    /* 05933: jmp 0x5950 */
    /* 05935: call 0xbc7 */
    /* 05938: mov cx, 0x30 */
    /* 0593B: mov di, 0x9a40 */
    /* 0593E: call 0x4191 */
    /* 05941: stosw word ptr es:[di], ax */
    /* 05942: call 0x4191 */
    /* 05945: stosw word ptr es:[di], ax */
    /* 05946: call 0x4191 */
    /* 05949: and ax, 0x1fff */
    /* 0594C: stosw word ptr es:[di], ax */
    /* 0594D: loop 0x593e */
    /* 0594F: ret  */
}

void sub_05935(void) {
    /* 05935: call 0xbc7 */
    /* 05938: mov cx, 0x30 */
    /* 0593B: mov di, 0x9a40 */
    /* 0593E: call 0x4191 */
    /* 05941: stosw word ptr es:[di], ax */
    /* 05942: call 0x4191 */
    /* 05945: stosw word ptr es:[di], ax */
    /* 05946: call 0x4191 */
    /* 05949: and ax, 0x1fff */
    /* 0594C: stosw word ptr es:[di], ax */
    /* 0594D: loop 0x593e */
    /* 0594F: ret  */
}

void sub_05950(void) {
    /* 05950: call 0xe2b */
    /* 05953: call 0xd81 */
    /* 05956: call 0xbe9 */
    /* 05959: call 0x426a */
    /* 0595C: ret  */
}

void sub_0595D(void) {
    /* 0595D: mov word ptr [0x3752], ax */
    /* 05960: mov word ptr [0x3754], si */
    /* 05964: cmp byte ptr [0x374e], 0 */
    /* 05969: je 0x598f */
    /* 0596B: call 0xde7 */
    /* 0596E: call 0xa0d */
    /* 05971: mov si, word ptr [0x3754] */
    /* 05975: call 0xafb */
    /* 05978: call 0x831 */
    /* 0597B: call 0xa51 */
    /* 0597E: call 0xd81 */
    /* 05981: cmp byte ptr [0x8f5b], 0 */
    /* 05986: je 0x596e */
    /* 05988: mov byte ptr [0x8f5b], 0 */
    /* 0598D: jmp 0x59a9 */
    /* 0598F: push cx */
    /* 05990: call 0xa0d */
    /* 05993: mov si, word ptr [0x3754] */
    /* 05997: call 0xafb */
    /* 0599A: call 0x831 */
    /* 0599D: call 0xa51 */
    /* 059A0: call 0xde7 */
    /* 059A3: call 0xd81 */
    /* 059A6: pop cx */
    /* 059A7: loop 0x598f */
    /* 059A9: ret  */
}

void sub_059AA(void) {
    /* 059AA: mov ax, 0xc */
    /* 059AD: mov si, 0x352b */
    /* 059B0: mov cx, 1 */
    /* 059B3: call 0x595d */
    /* 059B6: mov cx, 0x55 */
    /* 059B9: push cx */
    /* 059BA: call 0xb3f */
    /* 059BD: pop cx */
    /* 059BE: cmp byte ptr [0x8f5b], 0 */
    /* 059C3: jne 0x59c7 */
    /* 059C5: loop 0x59b9 */
    /* 059C7: ret  */
}

void sub_059C8(void) {
    /* 059C8: mov ax, word ptr [0x9152] */
    /* 059CB: mov dx, word ptr [0x9154] */
    /* 059CF: cmp dx, word ptr [0x358d] */
    /* 059D3: jge 0x59d8 */
    /* 059D5: jmp 0x5b0a */
    /* 059D8: jne 0x59e3 */
    /* 059DA: cmp ax, word ptr [0x358b] */
    /* 059DE: jg 0x59e3 */
    /* 059E0: jmp 0x5b0a */
    /* 059E3: call 0x5b0b */
    /* 059E6: mov si, 0x358b */
    /* 059E9: mov di, 0x3616 */
    /* 059EC: mov ax, word ptr [0x9152] */
    /* 059EF: mov dx, word ptr [0x9154] */
    /* 059F3: cmp dx, word ptr [si - 2] */
    /* 059F6: jl 0x5a21 */
    /* 059F8: jne 0x59ff */
    /* 059FA: cmp ax, word ptr [si - 4] */
    /* 059FD: jbe 0x5a21 */
    /* 059FF: sub si, 4 */
    /* 05A02: mov ax, word ptr [si] */
    /* 05A04: mov word ptr [si + 4], ax */
    /* 05A07: mov ax, word ptr [si + 2] */
    /* 05A0A: mov word ptr [si + 6], ax */
    /* 05A0D: mov cx, 0xb */
    /* 05A10: dec di */
    /* 05A11: mov al, byte ptr [di] */
    /* 05A13: mov byte ptr [di + 0xf], al */
    /* 05A16: loop 0x5a10 */
    /* 05A18: sub di, 4 */
    /* 05A1B: cmp si, 0x3567 */
    /* 05A1F: jg 0x59ec */
}

void sub_05B0B(void) {
    /* 05B0B: mov si, 0x352b */
    /* 05B0E: jmp 0x5b13 */
    /* 05B10: mov si, 0x353f */
    /* 05B13: push si */
    /* 05B14: call 0x5935 */
    /* 05B17: mov ax, 0xc */
    /* 05B1A: pop si */
    /* 05B1B: mov cx, 1 */
    /* 05B1E: jmp 0x595d */
    /* 05B21: mov word ptr [0x91b0], 3 */
    /* 05B27: call 0x5935 */
    /* 05B2A: mov ax, 0xc */
    /* 05B2D: mov si, 0x3477 */
    /* 05B30: mov cx, 1 */
    /* 05B33: call 0x595d */
    /* 05B36: mov byte ptr [0x8f5b], 0 */
    /* 05B3B: xor ax, ax */
    /* 05B3D: push ax */
    /* 05B3E: call 0x9eb */
    /* 05B41: mov word ptr [0x3752], 0xc */
    /* 05B47: mov si, 0x3477 */
    /* 05B4A: call 0xafb */
    /* 05B4D: mov word ptr [0x3752], 0x3c */
    /* 05B53: mov si, 0x348b */
    /* 05B56: pop ax */
    /* 05B57: push ax */
    /* 05B58: test ax, ax */
    /* 05B5A: jne 0x5b5f */
    /* 05B5C: mov si, 0x349f */
    /* 05B5F: call 0xafb */
    /* 05B62: mov word ptr [0x3752], 0x54 */
    /* 05B68: mov si, 0x34b3 */
}

void sub_05B10(void) {
    /* 05B10: mov si, 0x353f */
    /* 05B13: push si */
    /* 05B14: call 0x5935 */
    /* 05B17: mov ax, 0xc */
    /* 05B1A: pop si */
    /* 05B1B: mov cx, 1 */
    /* 05B1E: jmp 0x595d */
    /* 05B21: mov word ptr [0x91b0], 3 */
    /* 05B27: call 0x5935 */
    /* 05B2A: mov ax, 0xc */
    /* 05B2D: mov si, 0x3477 */
    /* 05B30: mov cx, 1 */
    /* 05B33: call 0x595d */
    /* 05B36: mov byte ptr [0x8f5b], 0 */
    /* 05B3B: xor ax, ax */
    /* 05B3D: push ax */
    /* 05B3E: call 0x9eb */
    /* 05B41: mov word ptr [0x3752], 0xc */
    /* 05B47: mov si, 0x3477 */
    /* 05B4A: call 0xafb */
    /* 05B4D: mov word ptr [0x3752], 0x3c */
    /* 05B53: mov si, 0x348b */
    /* 05B56: pop ax */
    /* 05B57: push ax */
    /* 05B58: test ax, ax */
    /* 05B5A: jne 0x5b5f */
    /* 05B5C: mov si, 0x349f */
    /* 05B5F: call 0xafb */
    /* 05B62: mov word ptr [0x3752], 0x54 */
    /* 05B68: mov si, 0x34b3 */
    /* 05B6B: pop ax */
    /* 05B6C: push ax */
}

void sub_05B21(void) {
    /* 05B21: mov word ptr [0x91b0], 3 */
    /* 05B27: call 0x5935 */
    /* 05B2A: mov ax, 0xc */
    /* 05B2D: mov si, 0x3477 */
    /* 05B30: mov cx, 1 */
    /* 05B33: call 0x595d */
    /* 05B36: mov byte ptr [0x8f5b], 0 */
    /* 05B3B: xor ax, ax */
    /* 05B3D: push ax */
    /* 05B3E: call 0x9eb */
    /* 05B41: mov word ptr [0x3752], 0xc */
    /* 05B47: mov si, 0x3477 */
    /* 05B4A: call 0xafb */
    /* 05B4D: mov word ptr [0x3752], 0x3c */
    /* 05B53: mov si, 0x348b */
    /* 05B56: pop ax */
    /* 05B57: push ax */
    /* 05B58: test ax, ax */
    /* 05B5A: jne 0x5b5f */
    /* 05B5C: mov si, 0x349f */
    /* 05B5F: call 0xafb */
    /* 05B62: mov word ptr [0x3752], 0x54 */
    /* 05B68: mov si, 0x34b3 */
    /* 05B6B: pop ax */
    /* 05B6C: push ax */
    /* 05B6D: cmp ax, 1 */
    /* 05B70: jne 0x5b75 */
    /* 05B72: mov si, 0x34c7 */
    /* 05B75: call 0xafb */
    /* 05B78: mov word ptr [0x3752], 0x6c */
    /* 05B7E: mov si, 0x34db */
    /* 05B81: cmp byte ptr [0x8f54], 0 */
}

void sub_05C0F(void) {
    /* 05C0F: call 0x5935 */
    /* 05C12: mov ax, 0x50 */
    /* 05C15: mov si, 0x344f */
    /* 05C18: mov cx, 1 */
    /* 05C1B: call 0x595d */
    /* 05C1E: mov byte ptr [0x8f5b], 0 */
    /* 05C23: mov ax, 0x4f */
    /* 05C26: push ax */
    /* 05C27: call 0x9eb */
    /* 05C2A: mov word ptr [0x3752], 0x50 */
    /* 05C30: mov si, 0x344f */
    /* 05C33: call 0xafb */
    /* 05C36: pop ax */
    /* 05C37: push ax */
    /* 05C38: shr ax, 1 */
    /* 05C3A: shr ax, 1 */
    /* 05C3C: shr ax, 1 */
    /* 05C3E: add al, 0x30 */
    /* 05C40: mov byte ptr [0x346c], al */
    /* 05C43: mov word ptr [0x3752], 0x78 */
    /* 05C49: mov si, 0x3463 */
    /* 05C4C: call 0xafb */
    /* 05C4F: call 0x5c7c */
    /* 05C52: call 0x831 */
    /* 05C55: call 0xa51 */
    /* 05C58: cmp byte ptr [0x8f5b], 0 */
    /* 05C5D: jne 0x5c6d */
    /* 05C5F: pop ax */
    /* 05C60: dec ax */
    /* 05C61: push ax */
    /* 05C62: jne 0x5c27 */
    /* 05C64: add sp, 2 */
}

void sub_05C7C(void) {
    /* 05C7C: mov ax, word ptr [0x91b0] */
    /* 05C7F: add al, 0x30 */
    /* 05C81: mov byte ptr [0x33fb], al */
    /* 05C84: mov si, 0x33f3 */
    /* 05C87: call 0xb83 */
    /* 05C8A: ret  */
}

void sub_05C8B(void) {
    /* 05C8B: mov dx, 0x41c8 */
    /* 05C8E: mov ax, 0x349b */
    /* 05C91: mov es, ax */
    /* 05C93: xor di, di */
    /* 05C95: call 0x11c */
    /* 05C98: mov dx, 0x41d2 */
    /* 05C9B: mov ax, 0x349b */
    /* 05C9E: mov es, ax */
    /* 05CA0: mov di, 0x6be6 */
    /* 05CA3: call 0x11c */
    /* 05CA6: mov dx, 0x41de */
    /* 05CA9: mov ax, 0x349b */
    /* 05CAC: mov es, ax */
    /* 05CAE: mov di, 0xabbc */
    /* 05CB1: call 0x11c */
    /* 05CB4: mov dx, 0x41e7 */
    /* 05CB7: mov ax, 0x2824 */
    /* 05CBA: mov es, ax */
    /* 05CBC: xor di, di */
    /* 05CBE: call 0x11c */
    /* 05CC1: call 0xda3 */
    /* 05CC4: ret  */
}

void sub_05CC5(void) {
    /* 05CC5: mov ax, word ptr [0x991c] */
    /* 05CC8: cmp ax, word ptr [0x8e6c] */
    /* 05CCC: jne 0x5cd1 */
    /* 05CCE: jmp 0x5e03 */
    /* 05CD1: mov word ptr [0x8e6c], ax */
    /* 05CD4: call 0x5b10 */
    /* 05CD7: mov ax, word ptr [0x991c] */
    /* 05CDA: add al, 0x30 */
    /* 05CDC: mov byte ptr [0x41ef], al */
    /* 05CDF: mov byte ptr [0x41fa], al */
    /* 05CE2: mov byte ptr [0x4206], al */
    /* 05CE5: mov byte ptr [0x4215], al */
    /* 05CE8: mov byte ptr [0x4222], al */
    /* 05CEB: mov byte ptr [0x4231], al */
    /* 05CEE: mov dx, 0x41ee */
    /* 05CF1: call 0x5e24 */
    /* 05CF4: mov word ptr [0x8e60], ax */
    /* 05CF7: mov bx, ax */
    /* 05CF9: mov cx, 0x2ee0 */
    /* 05CFC: mov dx, 0xdf16 */
    /* 05CFF: call 0x5e52 */
    /* 05D02: mov bx, word ptr [0x8e60] */
    /* 05D06: call 0x5e59 */
    /* 05D09: xor di, di */
    /* 05D0B: mov si, 0xdf16 */
    /* 05D0E: xor ch, ch */
    /* 05D10: lodsb al, byte ptr [si] */
    /* 05D11: mov cl, al */
    /* 05D13: rep movsw word ptr es:[di], word ptr [si] */
    /* 05D15: lodsb al, byte ptr [si] */
    /* 05D16: mov cl, al */
    /* 05D18: xor ax, ax */
}

void sub_05E24(void) {
    /* 05E24: push dx */
    /* 05E25: mov ax, 0x3d00 */
    /* 05E28: int 0x21 */
    /* 05E2A: pop dx */
    /* 05E2B: jae 0x5e34 */
    /* 05E2D: push dx */
    /* 05E2E: call 0x5e35 */
    /* 05E31: pop dx */
    /* 05E32: jmp 0x5e24 */
    /* 05E34: ret  */
}

void sub_05E35(void) {
    /* 05E35: call 0x5950 */
    /* 05E38: call 0xd5f */
    /* 05E3B: mov si, 0x343b */
    /* 05E3E: mov byte ptr [0x374e], 0xff */
    /* 05E43: call 0x5926 */
    /* 05E46: mov byte ptr [0x374e], 0 */
    /* 05E4B: call 0xd5f */
    /* 05E4E: call 0x5b10 */
    /* 05E51: ret  */
}

void sub_05E52(void) {
    /* 05E52: mov ah, 0x3f */
    /* 05E54: int 0x21 */
    /* 05E56: jb 0x5e04 */
    /* 05E58: ret  */
}

void sub_05E59(void) {
    /* 05E59: mov ah, 0x3e */
    /* 05E5B: int 0x21 */
    /* 05E5D: ret  */
}

void sub_05E5E(void) {
    /* 05E5E: mov ax, 0x3509 */
    /* 05E61: int 0x21 */
    /* 05E63: mov word ptr [0x8e66], bx */
    /* 05E67: mov word ptr [0x8e68], es */
    /* 05E6B: mov ax, 0x2509 */
    /* 05E6E: push ds */
    /* 05E6F: mov dx, cs */
    /* 05E71: mov ds, dx */
    /* 05E73: mov dx, 0x5eeb */
    /* 05E76: int 0x21 */
    /* 05E78: pop ds */
    /* 05E79: ret  */
}

void sub_05E7A(void) {
    /* 05E7A: mov ax, 0x2509 */
    /* 05E7D: push ds */
    /* 05E7E: mov dx, word ptr [0x8e66] */
    /* 05E82: mov ds, word ptr [0x8e68] */
    /* 05E86: int 0x21 */
    /* 05E88: pop ds */
    /* 05E89: ret  */
}

void sub_05E8A(void) {
    /* 05E8A: mov word ptr cs:[0x6009], 3 */
    /* 05E91: mov ax, 0x3508 */
    /* 05E94: int 0x21 */
    /* 05E96: mov word ptr [0x8e62], bx */
    /* 05E9A: mov word ptr [0x8e64], es */
    /* 05E9E: mov ax, 0x2508 */
    /* 05EA1: push ds */
    /* 05EA2: mov dx, 0x600b */
    /* 05EA5: mov cx, cs */
    /* 05EA7: mov ds, cx */
    /* 05EA9: int 0x21 */
    /* 05EAB: pop ds */
    /* 05EAC: cli  */
    /* 05EAD: mov al, 0x36 */
    /* 05EAF: out 0x43, al */
    /* 05EB1: mov dx, 0x5555 */
    /* 05EB4: mov al, dl */
    /* 05EB6: out 0x40, al */
    /* 05EB8: mov al, dh */
    /* 05EBA: out 0x40, al */
    /* 05EBC: in al, 0x61 */
    /* 05EBE: mov byte ptr [0x3042], al */
    /* 05EC1: sti  */
    /* 05EC2: ret  */
}

void sub_05EC3(void) {
    /* 05EC3: cli  */
    /* 05EC4: mov al, byte ptr [0x3042] */
    /* 05EC7: out 0x61, al */
    /* 05EC9: mov al, 0x36 */
    /* 05ECB: out 0x43, al */
    /* 05ECD: mov dx, 0xffff */
    /* 05ED0: mov al, dl */
    /* 05ED2: out 0x40, al */
    /* 05ED4: mov al, dh */
    /* 05ED6: out 0x40, al */
    /* 05ED8: in al, 0x61 */
    /* 05EDA: sti  */
    /* 05EDB: mov ax, 0x2508 */
    /* 05EDE: push ds */
    /* 05EDF: mov dx, word ptr [0x8e62] */
    /* 05EE3: mov ds, word ptr [0x8e64] */
    /* 05EE7: int 0x21 */
    /* 05EE9: pop ds */
    /* 05EEA: ret  */
}

void sub_06058(void) {
    /* 06058: mov byte ptr [0x8f53], 0 */
    /* 0605D: mov word ptr [0x8f50], 0x200 */
    /* 06063: shr word ptr [0x8f50], 1 */
    /* 06067: call 0x60ef */
    /* 0606A: test bx, bx */
    /* 0606C: je 0x60a4 */
    /* 0606E: cmp word ptr [0x8f50], 0 */
    /* 06073: je 0x607f */
    /* 06075: cmp bl, 0x20 */
    /* 06078: jb 0x6063 */
    /* 0607A: cmp bh, 0x20 */
    /* 0607D: jb 0x6063 */
    /* 0607F: shr bh, 1 */
    /* 06081: shr bl, 1 */
    /* 06083: mov word ptr [0x8f4e], bx */
    /* 06087: mov al, bh */
    /* 06089: shl bh, 1 */
    /* 0608B: add bh, al */
    /* 0608D: mov al, bl */
    /* 0608F: shl bl, 1 */
    /* 06091: add bl, al */
    /* 06093: mov word ptr [0x8f4c], bx */
    /* 06097: mov ax, word ptr [0x8f4d] */
    /* 0609A: xchg al, ah */
    /* 0609C: mov word ptr [0x8f4d], ax */
    /* 0609F: mov byte ptr [0x8f53], 0xff */
    /* 060A4: ret  */
}

void sub_060EF(void) {
    /* 060EF: cli  */
    /* 060F0: mov dx, 0x201 */
    /* 060F3: mov bp, 0x100 */
    /* 060F6: out dx, al */
    /* 060F7: xor bx, bx */
    /* 060F9: in al, dx */
    /* 060FA: test al, 1 */
    /* 060FC: je 0x6100 */
    /* 060FE: inc bh */
    /* 06100: test al, 2 */
    /* 06102: je 0x6106 */
    /* 06104: inc bl */
    /* 06106: test al, 3 */
    /* 06108: je 0x6114 */
    /* 0610A: mov ax, word ptr [0x8f50] */
    /* 0610D: dec ax */
    /* 0610E: jns 0x610d */
    /* 06110: dec bp */
    /* 06111: jne 0x60f9 */
    /* 06113: in al, dx */
    /* 06114: sti  */
    /* 06115: ret  */
}

