
; basic_block_004F2
004F2: b8 53 18                 mov ax, 0x1853
004F5: 8e d8                    mov ds, ax
004F7: 8e c0                    mov es, ax
004F9: fc                       cld
004FA: 89 26 6a 8e              mov word ptr [0x8e6a], sp
004FE: e8 a2 00                 call 0x5a3
00501: c7 06 6c 8e 00 00        mov word ptr [0x8e6c], 0
00507: e8 e3 02                 call 0x7ed
0050A: c7 06 88 8e 00 00        mov word ptr [0x8e88], 0
00510: c7 06 8a 8e 00 00        mov word ptr [0x8e8a], 0
00516: 06                       push es
00517: 33 c0                    xor ax, ax
00519: 8e c0                    mov es, ax
0051B: fa                       cli
0051C: 26 c7 06 00 02 00 00     mov word ptr es:[0x200], 0
00523: 26 c7 06 02 02 b9 14     mov word ptr es:[0x202], 0x14b9
0052A: fb                       sti
0052B: 07                       pop es
0052C: b4 22                    mov ah, 0x22
0052E: b0 16                    mov al, 0x16
00530: cd 80                    int 0x80
00532: e8 55 59                 call 0x5e8a
00535: c7 06 48 30 00 00        mov word ptr [0x3048], 0
0053B: 83 3e 48 30 28           cmp word ptr [0x3048], 0x28
00540: 7c f9                    jl 0x53b

; basic_block_005A3
005A3: c6 06 57 8f 00           mov byte ptr [0x8f57], 0
005A8: e8 55 fa                 call 0
005AB: 8c d8                    mov ax, ds
005AD: 8e c0                    mov es, ax
005AF: b8 04 00                 mov ax, 4
005B2: 80 3e 59 8e 00           cmp byte ptr [0x8e59], 0
005B7: 75 21                    jne 0x5da

; basic_block_00501

; basic_block_007ED
007ED: 8b 2e 44 30              mov bp, word ptr [0x3044]
007F1: d1 e5                    shl bp, 1
007F3: d1 e5                    shl bp, 1
007F5: 2e ff 9e fb 07           lcall cs:[bp + 0x7fb]
007FA: c3                       ret

; basic_block_0050A

; basic_block_05E8A
05E8A: 2e c7 06 09 60 03 00     mov word ptr cs:[0x6009], 3
05E91: b8 08 35                 mov ax, 0x3508
05E94: cd 21                    int 0x21
05E96: 89 1e 62 8e              mov word ptr [0x8e62], bx
05E9A: 8c 06 64 8e              mov word ptr [0x8e64], es
05E9E: b8 08 25                 mov ax, 0x2508
05EA1: 1e                       push ds
05EA2: ba 0b 60                 mov dx, 0x600b
05EA5: 8c c9                    mov cx, cs
05EA7: 8e d9                    mov ds, cx
05EA9: cd 21                    int 0x21
05EAB: 1f                       pop ds
05EAC: fa                       cli
05EAD: b0 36                    mov al, 0x36
05EAF: e6 43                    out 0x43, al
05EB1: ba 55 55                 mov dx, 0x5555
05EB4: 8a c2                    mov al, dl
05EB6: e6 40                    out 0x40, al
05EB8: 8a c6                    mov al, dh
05EBA: e6 40                    out 0x40, al
05EBC: e4 61                    in al, 0x61
05EBE: a2 42 30                 mov byte ptr [0x3042], al
05EC1: fb                       sti
05EC2: c3                       ret

; basic_block_00535

; basic_block_0053B

; basic_block_00542
00542: e8 19 59                 call 0x5e5e
00545: e8 43 57                 call 0x5c8b
00548: 8c d8                    mov ax, ds
0054A: 8e c0                    mov es, ax
0054C: e8 26 37                 call 0x3c75
0054F: 83 3e 44 30 04           cmp word ptr [0x3044], 4
00554: 75 2f                    jne 0x585

; basic_block_00000
00000: 8c d8                    mov ax, ds
00002: 8e c0                    mov es, ax
00004: b9 08 00                 mov cx, 8
00007: bf 58 8e                 mov di, 0x8e58
0000A: b0 ff                    mov al, 0xff
0000C: f3 aa                    rep stosb byte ptr es:[di], al
0000E: b8 00 1a                 mov ax, 0x1a00
00011: cd 10                    int 0x10
00013: 3c 1a                    cmp al, 0x1a
00015: 75 1b                    jne 0x32

; basic_block_005AB

; basic_block_005DA
005DA: a3 44 30                 mov word ptr [0x3044], ax
005DD: b4 0f                    mov ah, 0xf
005DF: cd 10                    int 0x10
005E1: 88 3e f3 2e              mov byte ptr [0x2ef3], bh
005E5: a2 f4 2e                 mov byte ptr [0x2ef4], al
005E8: 88 26 f5 2e              mov byte ptr [0x2ef5], ah
005EC: b4 01                    mov ah, 1
005EE: b5 20                    mov ch, 0x20
005F0: b1 20                    mov cl, 0x20
005F2: cd 10                    int 0x10
005F4: b8 00 06                 mov ax, 0x600
005F7: 32 ff                    xor bh, bh
005F9: 33 c9                    xor cx, cx
005FB: 8a 16 f5 2e              mov dl, byte ptr [0x2ef5]
005FF: fe ca                    dec dl
00601: b6 18                    mov dh, 0x18
00603: cd 10                    int 0x10
00605: e8 f6 00                 call 0x6fe
00608: 32 e4                    xor ah, ah
0060A: cd 16                    int 0x16
0060C: 80 fc 1c                 cmp ah, 0x1c
0060F: 74 46                    je 0x657

; basic_block_005B9
005B9: b8 03 00                 mov ax, 3
005BC: 80 3e 5a 8e 00           cmp byte ptr [0x8e5a], 0
005C1: 75 17                    jne 0x5da

; basic_block_007FA

; basic_block_05E5E
05E5E: b8 09 35                 mov ax, 0x3509
05E61: cd 21                    int 0x21
05E63: 89 1e 66 8e              mov word ptr [0x8e66], bx
05E67: 8c 06 68 8e              mov word ptr [0x8e68], es
05E6B: b8 09 25                 mov ax, 0x2509
05E6E: 1e                       push ds
05E6F: 8c ca                    mov dx, cs
05E71: 8e da                    mov ds, dx
05E73: ba eb 5e                 mov dx, 0x5eeb
05E76: cd 21                    int 0x21
05E78: 1f                       pop ds
05E79: c3                       ret

; basic_block_00545

; basic_block_05C8B
05C8B: ba c8 41                 mov dx, 0x41c8
05C8E: b8 9b 34                 mov ax, 0x349b
05C91: 8e c0                    mov es, ax
05C93: 33 ff                    xor di, di
05C95: e8 84 a4                 call 0x11c
05C98: ba d2 41                 mov dx, 0x41d2
05C9B: b8 9b 34                 mov ax, 0x349b
05C9E: 8e c0                    mov es, ax
05CA0: bf e6 6b                 mov di, 0x6be6
05CA3: e8 76 a4                 call 0x11c
05CA6: ba de 41                 mov dx, 0x41de
05CA9: b8 9b 34                 mov ax, 0x349b
05CAC: 8e c0                    mov es, ax
05CAE: bf bc ab                 mov di, 0xabbc
05CB1: e8 68 a4                 call 0x11c
05CB4: ba e7 41                 mov dx, 0x41e7
05CB7: b8 24 28                 mov ax, 0x2824
05CBA: 8e c0                    mov es, ax
05CBC: 33 ff                    xor di, di
05CBE: e8 5b a4                 call 0x11c
05CC1: e8 df b0                 call 0xda3
05CC4: c3                       ret

; basic_block_00548

; basic_block_03C75
03C75: e8 e0 23                 call 0x6058
03C78: c6 06 54 8f 00           mov byte ptr [0x8f54], 0
03C7D: c7 06 6e 8e 01 00        mov word ptr [0x8e6e], 1
03C83: c6 06 55 8f 00           mov byte ptr [0x8f55], 0
03C88: c6 06 56 8f 00           mov byte ptr [0x8f56], 0
03C8D: 36 c7 06 10 00 bf 00     mov word ptr ss:[0x10], 0xbf
03C94: e8 d3 05                 call 0x426a
03C97: c7 06 70 8e 01 00        mov word ptr [0x8e70], 1
03C9D: 8b 26 6a 8e              mov sp, word ptr [0x8e6a]
03CA1: e8 bb d0                 call 0xd5f
03CA4: c6 06 58 8f 00           mov byte ptr [0x8f58], 0
03CA9: c6 06 59 8f 00           mov byte ptr [0x8f59], 0
03CAE: c6 06 5b 8f 00           mov byte ptr [0x8f5b], 0
03CB3: c7 06 88 8e 00 00        mov word ptr [0x8e88], 0
03CB9: c7 06 8a 8e 00 00        mov word ptr [0x8e8a], 0
03CBF: e8 a1 1b                 call 0x5863
03CC2: e8 5c 1e                 call 0x5b21
03CC5: e8 97 d0                 call 0xd5f
03CC8: c7 06 1c 99 01 00        mov word ptr [0x991c], 1
03CCE: c6 06 50 35 31           mov byte ptr [0x3550], 0x31
03CD3: e8 ef 1f                 call 0x5cc5
03CD6: e8 4e db                 call 0x1827
03CD9: e8 67 de                 call 0x1b43
03CDC: c6 06 27 37 31           mov byte ptr [0x3727], 0x31
03CE1: 80 3e 5d 8f 00           cmp byte ptr [0x8f5d], 0
03CE6: 75 05                    jne 0x3ced

; basic_block_0054F

; basic_block_00585
00585: b4 01                    mov ah, 1
00587: cd 80                    int 0x80
00589: e8 37 59                 call 0x5ec3
0058C: e8 eb 58                 call 0x5e7a
0058F: b8 03 00                 mov ax, 3
00592: 83 3e 44 30 04           cmp word ptr [0x3044], 4
00597: 75 03                    jne 0x59c

; basic_block_00556
00556: ba b8 03                 mov dx, 0x3b8
00559: b0 00                    mov al, 0
0055B: ee                       out dx, al
0055C: ba b4 03                 mov dx, 0x3b4
0055F: be e0 2e                 mov si, 0x2ee0
00562: b9 09 00                 mov cx, 9
00565: ad                       lodsw ax, word ptr [si]
00566: ef                       out dx, ax
00567: e2 fc                    loop 0x565
00569: 06                       push es
0056A: b8 00 b0                 mov ax, 0xb000
0056D: 8e c0                    mov es, ax
0056F: 33 ff                    xor di, di
00571: b9 00 40                 mov cx, 0x4000
00574: 33 c0                    xor ax, ax
00576: f3 ab                    rep stosw word ptr es:[di], ax
00578: 07                       pop es
00579: ba b8 03                 mov dx, 0x3b8
0057C: b0 08                    mov al, 8
0057E: ee                       out dx, al
0057F: ba bf 03                 mov dx, 0x3bf
00582: b0 00                    mov al, 0
00584: ee                       out dx, al

; basic_block_00032
00032: c6 06 59 8e 00           mov byte ptr [0x8e59], 0
00037: e8 2d 00                 call 0x67
0003A: e8 4c 00                 call 0x89
0003D: e8 57 00                 call 0x97
00040: ba b4 03                 mov dx, 0x3b4
00043: e8 bb 00                 call 0x101
00046: 72 14                    jb 0x5c

; basic_block_00017
00017: 3a df                    cmp bl, bh
00019: 73 02                    jae 0x1d

; basic_block_006FE
006FE: be fd 2e                 mov si, 0x2efd
00701: 33 c9                    xor cx, cx
00703: b3 07                    mov bl, 7
00705: 3b 0e 44 30              cmp cx, word ptr [0x3044]
00709: 75 0b                    jne 0x716

; basic_block_00608

; basic_block_00657
00657: 83 3e 44 30 05           cmp word ptr [0x3044], 5
0065C: 75 05                    jne 0x663

; basic_block_00611
00611: 80 fc 41                 cmp ah, 0x41
00614: 74 3c                    je 0x652

; basic_block_005C3
005C3: b8 02 00                 mov ax, 2
005C6: 80 3e 58 8e 00           cmp byte ptr [0x8e58], 0
005CB: 75 0d                    jne 0x5da

; basic_block_0011C
0011C: b8 00 3d                 mov ax, 0x3d00
0011F: cd 21                    int 0x21
00121: 73 03                    jae 0x126

; basic_block_05C98

; basic_block_05CA6

; basic_block_05CB4

; basic_block_05CC1

; basic_block_00DA3
00DA3: 8b 2e 44 30              mov bp, word ptr [0x3044]
00DA7: d1 e5                    shl bp, 1
00DA9: d1 e5                    shl bp, 1
00DAB: 2e ff 9e b1 0d           lcall cs:[bp + 0xdb1]
00DB0: c3                       ret

; basic_block_05CC4

; basic_block_06058
06058: c6 06 53 8f 00           mov byte ptr [0x8f53], 0
0605D: c7 06 50 8f 00 02        mov word ptr [0x8f50], 0x200
06063: d1 2e 50 8f              shr word ptr [0x8f50], 1
06067: e8 85 00                 call 0x60ef
0606A: 85 db                    test bx, bx
0606C: 74 36                    je 0x60a4

; basic_block_03C78

; basic_block_0426A
0426A: be 40 9a                 mov si, 0x9a40
0426D: b9 30 00                 mov cx, 0x30
04270: b8 c0 00                 mov ax, 0xc0
04273: e8 2b ff                 call 0x41a1
04276: 89 04                    mov word ptr [si], ax
04278: b8 28 00                 mov ax, 0x28
0427B: 83 3e 44 30 00           cmp word ptr [0x3044], 0
04280: 74 1b                    je 0x429d

; basic_block_03C97

; basic_block_00D5F
00D5F: 8b 2e 44 30              mov bp, word ptr [0x3044]
00D63: d1 e5                    shl bp, 1
00D65: d1 e5                    shl bp, 1
00D67: 2e ff 9e 6d 0d           lcall cs:[bp + 0xd6d]
00D6C: c3                       ret

; basic_block_03CA4

; basic_block_05863
05863: 33 c0                    xor ax, ax
05865: b4 02                    mov ah, 2
05867: b0 00                    mov al, 0
05869: cd 80                    int 0x80
0586B: c7 06 54 37 25 36        mov word ptr [0x3754], 0x3625
05871: c7 06 52 37 78 00        mov word ptr [0x3752], 0x78
05877: c7 06 50 37 00 00        mov word ptr [0x3750], 0
0587D: bf 40 9a                 mov di, 0x9a40
05880: b9 30 00                 mov cx, 0x30
05883: e8 0b e9                 call 0x4191
05886: ab                       stosw word ptr es:[di], ax
05887: e8 07 e9                 call 0x4191
0588A: ab                       stosw word ptr es:[di], ax
0588B: e8 03 e9                 call 0x4191
0588E: 25 ff 1f                 and ax, 0x1fff
05891: ab                       stosw word ptr es:[di], ax
05892: e2 ef                    loop 0x5883
05894: e8 50 b5                 call 0xde7
05897: e8 e7 b4                 call 0xd81
0589A: 80 3e 5b 8f 00           cmp byte ptr [0x8f5b], 0
0589F: 75 75                    jne 0x5916

; basic_block_03CC2

; basic_block_05B21
05B21: c7 06 b0 91 03 00        mov word ptr [0x91b0], 3
05B27: e8 0b fe                 call 0x5935
05B2A: b8 0c 00                 mov ax, 0xc
05B2D: be 77 34                 mov si, 0x3477
05B30: b9 01 00                 mov cx, 1
05B33: e8 27 fe                 call 0x595d
05B36: c6 06 5b 8f 00           mov byte ptr [0x8f5b], 0
05B3B: 33 c0                    xor ax, ax
05B3D: 50                       push ax
05B3E: e8 aa ae                 call 0x9eb
05B41: c7 06 52 37 0c 00        mov word ptr [0x3752], 0xc
05B47: be 77 34                 mov si, 0x3477
05B4A: e8 ae af                 call 0xafb
05B4D: c7 06 52 37 3c 00        mov word ptr [0x3752], 0x3c
05B53: be 8b 34                 mov si, 0x348b
05B56: 58                       pop ax
05B57: 50                       push ax
05B58: 85 c0                    test ax, ax
05B5A: 75 03                    jne 0x5b5f

; basic_block_03CC5

; basic_block_03CC8

; basic_block_05CC5
05CC5: a1 1c 99                 mov ax, word ptr [0x991c]
05CC8: 3b 06 6c 8e              cmp ax, word ptr [0x8e6c]
05CCC: 75 03                    jne 0x5cd1

; basic_block_03CD6

; basic_block_01827
01827: c6 06 5c 8f 00           mov byte ptr [0x8f5c], 0
0182C: c6 06 5d 8f ff           mov byte ptr [0x8f5d], 0xff
01831: c7 06 1e 99 08 00        mov word ptr [0x991e], 8
01837: c7 06 1a 99 01 00        mov word ptr [0x991a], 1
0183D: c7 06 7a 8e 00 00        mov word ptr [0x8e7a], 0
01843: c6 06 5e 8f 00           mov byte ptr [0x8f5e], 0
01848: 83 3e 70 8e 02           cmp word ptr [0x8e70], 2
0184D: 75 05                    jne 0x1854

; basic_block_03CD9

; basic_block_01B43
01B43: be 00 00                 mov si, 0
01B46: bf 00 00                 mov di, 0
01B49: b9 70 17                 mov cx, 0x1770
01B4C: b8 65 15                 mov ax, 0x1565
01B4F: 8e c0                    mov es, ax
01B51: f3 a5                    rep movsw word ptr es:[di], word ptr [si]
01B53: 8c d8                    mov ax, ds
01B55: 8e c0                    mov es, ax
01B57: c7 06 32 8f 00 00        mov word ptr [0x8f32], 0
01B5D: c7 06 86 8e 00 00        mov word ptr [0x8e86], 0
01B63: bf 8c 8e                 mov di, 0x8e8c
01B66: b9 10 00                 mov cx, 0x10
01B69: 33 c0                    xor ax, ax
01B6B: f3 ab                    rep stosw word ptr es:[di], ax
01B6D: c6 06 b0 8f 00           mov byte ptr [0x8fb0], 0
01B72: c6 06 59 8f 00           mov byte ptr [0x8f59], 0
01B77: c6 06 5b 8f 00           mov byte ptr [0x8f5b], 0
01B7C: e8 30 ff                 call 0x1aaf
01B7F: 83 3e 70 8e 02           cmp word ptr [0x8e70], 2
01B84: 75 09                    jne 0x1b8f

; basic_block_03CDC

; basic_block_03CED
03CED: be 15 37                 mov si, 0x3715
03CF0: c6 06 4e 37 ff           mov byte ptr [0x374e], 0xff
03CF5: e8 2e 1c                 call 0x5926
03CF8: c6 06 4e 37 00           mov byte ptr [0x374e], 0
03CFD: e8 5f d0                 call 0xd5f
03D00: 80 3e 54 8f 00           cmp byte ptr [0x8f54], 0
03D05: 74 06                    je 0x3d0d

; basic_block_03CE8
03CE8: c6 06 27 37 32           mov byte ptr [0x3727], 0x32

; basic_block_05EC3
05EC3: fa                       cli
05EC4: a0 42 30                 mov al, byte ptr [0x3042]
05EC7: e6 61                    out 0x61, al
05EC9: b0 36                    mov al, 0x36
05ECB: e6 43                    out 0x43, al
05ECD: ba ff ff                 mov dx, 0xffff
05ED0: 8a c2                    mov al, dl
05ED2: e6 40                    out 0x40, al
05ED4: 8a c6                    mov al, dh
05ED6: e6 40                    out 0x40, al
05ED8: e4 61                    in al, 0x61
05EDA: fb                       sti
05EDB: b8 08 25                 mov ax, 0x2508
05EDE: 1e                       push ds
05EDF: 8b 16 62 8e              mov dx, word ptr [0x8e62]
05EE3: 8e 1e 64 8e              mov ds, word ptr [0x8e64]
05EE7: cd 21                    int 0x21
05EE9: 1f                       pop ds
05EEA: c3                       ret

; basic_block_0058C

; basic_block_05E7A
05E7A: b8 09 25                 mov ax, 0x2509
05E7D: 1e                       push ds
05E7E: 8b 16 66 8e              mov dx, word ptr [0x8e66]
05E82: 8e 1e 68 8e              mov ds, word ptr [0x8e68]
05E86: cd 21                    int 0x21
05E88: 1f                       pop ds
05E89: c3                       ret

; basic_block_0058F

; basic_block_0059C
0059C: cd 10                    int 0x10
0059E: b8 00 4c                 mov ax, 0x4c00
005A1: cd 21                    int 0x21

; basic_block_00599
00599: b8 07 00                 mov ax, 7

; basic_block_00067
00067: b3 10                    mov bl, 0x10
00069: b4 12                    mov ah, 0x12
0006B: cd 10                    int 0x10
0006D: 80 fb 10                 cmp bl, 0x10
00070: 74 11                    je 0x83

; basic_block_0003A

; basic_block_00089
00089: ba d4 03                 mov dx, 0x3d4
0008C: e8 72 00                 call 0x101
0008F: 73 05                    jae 0x96

; basic_block_0003D

; basic_block_00097
00097: bb 00 b8                 mov bx, 0xb800
0009A: 8e c3                    mov es, bx
0009C: 33 ff                    xor di, di
0009E: 26 ff 36 00 00           push word ptr es:[0]
000A3: 26 c7 06 00 00 4a 41     mov word ptr es:[0], 0x414a
000AA: cd 12                    int 0x12
000AC: 05 3f 00                 add ax, 0x3f
000AF: 25 c0 ff                 and ax, 0xffc0
000B2: 2d 40 00                 sub ax, 0x40
000B5: b1 06                    mov cl, 6
000B7: d3 e0                    shl ax, cl
000B9: 8e c0                    mov es, ax
000BB: 8b d0                    mov dx, ax
000BD: b8 4a 41                 mov ax, 0x414a
000C0: b9 00 80                 mov cx, 0x8000
000C3: f2 af                    repne scasw ax, word ptr es:[di]
000C5: 74 0f                    je 0xd6

; basic_block_00040

; basic_block_00101
00101: b0 0f                    mov al, 0xf
00103: ee                       out dx, al
00104: ee                       out dx, al
00105: 42                       inc dx
00106: ec                       in al, dx
00107: 8a e0                    mov ah, al
00109: b0 66                    mov al, 0x66
0010B: ee                       out dx, al
0010C: b9 00 01                 mov cx, 0x100
0010F: e2 fe                    loop 0x10f
00111: ec                       in al, dx
00112: 86 c4                    xchg ah, al
00114: ee                       out dx, al
00115: 80 fc 66                 cmp ah, 0x66
00118: 74 01                    je 0x11b

; basic_block_00046

; basic_block_0005C
0005C: c6 06 5c 8e 00           mov byte ptr [0x8e5c], 0
00061: c6 06 5d 8e 00           mov byte ptr [0x8e5d], 0
00066: c3                       ret

; basic_block_00048
00048: b2 ba                    mov dl, 0xba
0004A: ec                       in al, dx
0004B: 24 80                    and al, 0x80
0004D: 8a e0                    mov ah, al
0004F: b9 00 80                 mov cx, 0x8000
00052: ec                       in al, dx
00053: 24 80                    and al, 0x80
00055: 3a c4                    cmp al, ah
00057: e1 f9                    loope 0x52
00059: 74 06                    je 0x61

; basic_block_0001D
0001D: 80 fb 0b                 cmp bl, 0xb
00020: 72 0a                    jb 0x2c

; basic_block_0001B
0001B: 8a df                    mov bl, bh

; basic_block_00716
00716: 88 1e f7 2e              mov byte ptr [0x2ef7], bl
0071A: ac                       lodsb al, byte ptr [si]
0071B: 84 c0                    test al, al
0071D: 74 41                    je 0x760

; basic_block_0070B
0070B: b3 1f                    mov bl, 0x1f
0070D: 80 3e f4 2e 07           cmp byte ptr [0x2ef4], 7
00712: 75 02                    jne 0x716

; basic_block_00663
00663: a1 44 30                 mov ax, word ptr [0x3044]
00666: bb f8 2e                 mov bx, 0x2ef8
00669: d7                       xlatb
0066A: a3 44 30                 mov word ptr [0x3044], ax
0066D: c3                       ret

; basic_block_0065E
0065E: e8 0d 00                 call 0x66e
00661: eb 91                    jmp 0x5f4

; basic_block_00652
00652: c6 06 57 8f ff           mov byte ptr [0x8f57], 0xff

; basic_block_00616
00616: 80 fc 39                 cmp ah, 0x39
00619: 74 16                    je 0x631

; basic_block_005CD
005CD: b8 00 00                 mov ax, 0
005D0: 80 3e 5d 8e 00           cmp byte ptr [0x8e5d], 0
005D5: 75 03                    jne 0x5da

; basic_block_00126
00126: 1e                       push ds
00127: bb 65 15                 mov bx, 0x1565
0012A: 8e db                    mov ds, bx
0012C: 89 3e 6c 23              mov word ptr [0x236c], di
00130: 8c 06 6e 23              mov word ptr [0x236e], es
00134: 8e c3                    mov es, bx
00136: a3 70 23                 mov word ptr [0x2370], ax
00139: b4 3f                    mov ah, 0x3f
0013B: 8b 1e 70 23              mov bx, word ptr [0x2370]
0013F: b9 00 02                 mov cx, 0x200
00142: ba 6c 21                 mov dx, 0x216c
00145: cd 21                    int 0x21
00147: 73 03                    jae 0x14c

; basic_block_00123
00123: e9 de 5c                 jmp 0x5e04

; basic_block_00DB0

; basic_block_060EF
060EF: fa                       cli
060F0: ba 01 02                 mov dx, 0x201
060F3: bd 00 01                 mov bp, 0x100
060F6: ee                       out dx, al
060F7: 33 db                    xor bx, bx
060F9: ec                       in al, dx
060FA: a8 01                    test al, 1
060FC: 74 02                    je 0x6100

; basic_block_0606A

; basic_block_060A4
060A4: c3                       ret

; basic_block_0606E
0606E: 83 3e 50 8f 00           cmp word ptr [0x8f50], 0
06073: 74 0a                    je 0x607f

; basic_block_041A1
041A1: 52                       push dx
041A2: 51                       push cx
041A3: 50                       push ax
041A4: e8 ea ff                 call 0x4191
041A7: 33 d2                    xor dx, dx
041A9: 59                       pop cx
041AA: f7 f1                    div cx
041AC: 8b c2                    mov ax, dx
041AE: 59                       pop cx
041AF: 5a                       pop dx
041B0: c3                       ret

; basic_block_04276

; basic_block_0429D
0429D: e8 01 ff                 call 0x41a1
042A0: 89 44 02                 mov word ptr [si + 2], ax
042A3: c7 44 04 00 00           mov word ptr [si + 4], 0
042A8: 83 c6 06                 add si, 6
042AB: e2 c3                    loop 0x4270
042AD: c3                       ret

; basic_block_04282
04282: 83 3e 44 30 03           cmp word ptr [0x3044], 3
04287: 74 14                    je 0x429d

; basic_block_00D6C

; basic_block_04191
04191: 52                       push dx
04192: b8 55 62                 mov ax, 0x6255
04195: f7 26 4a 30              mul word ptr [0x304a]
04199: 05 19 36                 add ax, 0x3619
0419C: a3 4a 30                 mov word ptr [0x304a], ax
0419F: 5a                       pop dx
041A0: c3                       ret

; basic_block_05886

; basic_block_0588A

; basic_block_0588E

; basic_block_00DE7
00DE7: 8b 2e 44 30              mov bp, word ptr [0x3044]
00DEB: d1 e5                    shl bp, 1
00DED: d1 e5                    shl bp, 1
00DEF: 2e ff 9e f5 0d           lcall cs:[bp + 0xdf5]
00DF4: c3                       ret

; basic_block_05897

; basic_block_00D81
00D81: 8b 2e 44 30              mov bp, word ptr [0x3044]
00D85: d1 e5                    shl bp, 1
00D87: d1 e5                    shl bp, 1
00D89: 2e ff 9e 8f 0d           lcall cs:[bp + 0xd8f]
00D8E: c3                       ret

; basic_block_0589A

; basic_block_05916
05916: c6 06 5b 8f 00           mov byte ptr [0x8f5b], 0
0591B: b4 01                    mov ah, 1
0591D: cd 80                    int 0x80
0591F: e8 c5 b4                 call 0xde7
05922: e8 5c b4                 call 0xd81
05925: c3                       ret

; basic_block_058A1
058A1: e8 69 b1                 call 0xa0d
058A4: e8 74 b4                 call 0xd1b
058A7: 83 3e 50 37 12           cmp word ptr [0x3750], 0x12
058AC: 7c 2b                    jl 0x58d9

; basic_block_05935
05935: e8 8f b2                 call 0xbc7
05938: b9 30 00                 mov cx, 0x30
0593B: bf 40 9a                 mov di, 0x9a40
0593E: e8 50 e8                 call 0x4191
05941: ab                       stosw word ptr es:[di], ax
05942: e8 4c e8                 call 0x4191
05945: ab                       stosw word ptr es:[di], ax
05946: e8 48 e8                 call 0x4191
05949: 25 ff 1f                 and ax, 0x1fff
0594C: ab                       stosw word ptr es:[di], ax
0594D: e2 ef                    loop 0x593e
0594F: c3                       ret

; basic_block_05B2A

; basic_block_0595D
0595D: a3 52 37                 mov word ptr [0x3752], ax
05960: 89 36 54 37              mov word ptr [0x3754], si
05964: 80 3e 4e 37 00           cmp byte ptr [0x374e], 0
05969: 74 24                    je 0x598f

; basic_block_05B36

; basic_block_009EB
009EB: 8b 2e 44 30              mov bp, word ptr [0x3044]
009EF: d1 e5                    shl bp, 1
009F1: d1 e5                    shl bp, 1
009F3: 2e ff 9e f9 09           lcall cs:[bp + 0x9f9]
009F8: c3                       ret

; basic_block_05B41

; basic_block_00AFB
00AFB: 8b 2e 44 30              mov bp, word ptr [0x3044]
00AFF: d1 e5                    shl bp, 1
00B01: d1 e5                    shl bp, 1
00B03: 2e ff 9e 09 0b           lcall cs:[bp + 0xb09]
00B08: c3                       ret

; basic_block_05B4D

; basic_block_05B5F
05B5F: e8 99 af                 call 0xafb
05B62: c7 06 52 37 54 00        mov word ptr [0x3752], 0x54
05B68: be b3 34                 mov si, 0x34b3
05B6B: 58                       pop ax
05B6C: 50                       push ax
05B6D: 3d 01 00                 cmp ax, 1
05B70: 75 03                    jne 0x5b75

; basic_block_05B5C
05B5C: be 9f 34                 mov si, 0x349f

; basic_block_05CD1
05CD1: a3 6c 8e                 mov word ptr [0x8e6c], ax
05CD4: e8 39 fe                 call 0x5b10
05CD7: a1 1c 99                 mov ax, word ptr [0x991c]
05CDA: 04 30                    add al, 0x30
05CDC: a2 ef 41                 mov byte ptr [0x41ef], al
05CDF: a2 fa 41                 mov byte ptr [0x41fa], al
05CE2: a2 06 42                 mov byte ptr [0x4206], al
05CE5: a2 15 42                 mov byte ptr [0x4215], al
05CE8: a2 22 42                 mov byte ptr [0x4222], al
05CEB: a2 31 42                 mov byte ptr [0x4231], al
05CEE: ba ee 41                 mov dx, 0x41ee
05CF1: e8 30 01                 call 0x5e24
05CF4: a3 60 8e                 mov word ptr [0x8e60], ax
05CF7: 8b d8                    mov bx, ax
05CF9: b9 e0 2e                 mov cx, 0x2ee0
05CFC: ba 16 df                 mov dx, 0xdf16
05CFF: e8 50 01                 call 0x5e52
05D02: 8b 1e 60 8e              mov bx, word ptr [0x8e60]
05D06: e8 50 01                 call 0x5e59
05D09: 33 ff                    xor di, di
05D0B: be 16 df                 mov si, 0xdf16
05D0E: 32 ed                    xor ch, ch
05D10: ac                       lodsb al, byte ptr [si]
05D11: 8a c8                    mov cl, al
05D13: f3 a5                    rep movsw word ptr es:[di], word ptr [si]
05D15: ac                       lodsb al, byte ptr [si]
05D16: 8a c8                    mov cl, al
05D18: 33 c0                    xor ax, ax
05D1A: f3 ab                    rep stosw word ptr es:[di], ax
05D1C: 81 ff e0 2e              cmp di, 0x2ee0
05D20: 7d 06                    jge 0x5d28

; basic_block_05CCE
05CCE: e9 32 01                 jmp 0x5e03

; basic_block_01854
01854: c6 06 5f 8f 00           mov byte ptr [0x8f5f], 0
01859: c6 06 60 8f 00           mov byte ptr [0x8f60], 0
0185E: e8 46 f1                 call 0x9a7
01861: e8 0f f2                 call 0xa73
01864: c6 06 61 8f 00           mov byte ptr [0x8f61], 0
01869: be 4c 9f                 mov si, 0x9f4c
0186C: b9 9e 00                 mov cx, 0x9e
0186F: 89 36 7c 8e              mov word ptr [0x8e7c], si
01873: c7 04 00 00              mov word ptr [si], 0
01877: 8d 7c 4c                 lea di, [si + 0x4c]
0187A: 89 7c 08                 mov word ptr [si + 8], di
0187D: 8b f7                    mov si, di
0187F: e2 f2                    loop 0x1873
01881: c7 04 00 00              mov word ptr [si], 0
01885: c7 44 08 00 00           mov word ptr [si + 8], 0
0188A: bf 80 9c                 mov di, 0x9c80
0188D: b8 ff ff                 mov ax, 0xffff
01890: b9 40 01                 mov cx, 0x140
01893: f3 ab                    rep stosw word ptr es:[di], ax
01895: e8 11 fe                 call 0x16a9
01898: e8 1f fe                 call 0x16ba
0189B: 80 3e 5e 8f 00           cmp byte ptr [0x8f5e], 0
018A0: 74 0b                    je 0x18ad

; basic_block_0184F
0184F: c6 06 5e 8f ff           mov byte ptr [0x8f5e], 0xff

; basic_block_01AAF
01AAF: c7 06 8e 91 00 2d        mov word ptr [0x918e], 0x2d00
01AB5: c7 06 96 91 00 00        mov word ptr [0x9196], 0
01ABB: c7 06 90 91 00 12        mov word ptr [0x9190], 0x1200
01AC1: c7 06 92 91 ee 7f        mov word ptr [0x9192], 0x7fee
01AC7: c7 06 94 91 ee 7f        mov word ptr [0x9194], 0x7fee
01ACD: c7 06 ae 91 10 00        mov word ptr [0x91ae], 0x10
01AD3: a1 12 9f                 mov ax, word ptr [0x9f12]
01AD6: a3 a2 91                 mov word ptr [0x91a2], ax
01AD9: a1 16 9f                 mov ax, word ptr [0x9f16]
01ADC: a3 a4 91                 mov word ptr [0x91a4], ax
01ADF: a1 90 91                 mov ax, word ptr [0x9190]
01AE2: a3 a6 91                 mov word ptr [0x91a6], ax
01AE5: a1 5a 91                 mov ax, word ptr [0x915a]
01AE8: a3 66 91                 mov word ptr [0x9166], ax
01AEB: a1 5c 91                 mov ax, word ptr [0x915c]
01AEE: a3 68 91                 mov word ptr [0x9168], ax
01AF1: c7 06 98 91 01 00        mov word ptr [0x9198], 1
01AF7: c7 06 9a 91 00 00        mov word ptr [0x919a], 0
01AFD: c7 06 9e 91 00 00        mov word ptr [0x919e], 0
01B03: e8 72 f4                 call 0xf78
01B06: c7 06 a0 91 00 00        mov word ptr [0x91a0], 0
01B0C: c7 06 7e 8e 00 00        mov word ptr [0x8e7e], 0
01B12: c7 06 9c 91 00 00        mov word ptr [0x919c], 0
01B18: c7 06 5a 91 00 00        mov word ptr [0x915a], 0
01B1E: c7 06 5c 91 00 00        mov word ptr [0x915c], 0
01B24: c7 06 66 91 00 00        mov word ptr [0x9166], 0
01B2A: c7 06 68 91 00 00        mov word ptr [0x9168], 0
01B30: c7 06 64 91 00 00        mov word ptr [0x9164], 0
01B36: c7 06 ac 91 01 00        mov word ptr [0x91ac], 1
01B3C: c7 06 b2 91 00 00        mov word ptr [0x91b2], 0
01B42: c3                       ret

; basic_block_01B7F

; basic_block_01B8F
01B8F: c3                       ret

; basic_block_01B86
01B86: e8 90 fe                 call 0x1a19
01B89: e8 23 ff                 call 0x1aaf
01B8C: e8 8a fe                 call 0x1a19

; basic_block_05926
05926: 56                       push si
05927: 51                       push cx
05928: e8 0a 00                 call 0x5935
0592B: 59                       pop cx
0592C: 5e                       pop si
0592D: b8 64 00                 mov ax, 0x64
05930: e8 2a 00                 call 0x595d
05933: eb 1b                    jmp 0x5950

; basic_block_03CF8

; basic_block_03D00

; basic_block_03D0D
03D0D: e8 75 cc                 call 0x985
03D10: e8 fc ca                 call 0x80f
03D13: e8 19 cd                 call 0xa2f
03D16: e8 12 d1                 call 0xe2b
03D19: e8 65 d0                 call 0xd81
03D1C: c6 06 59 8f 00           mov byte ptr [0x8f59], 0
03D21: c6 06 5b 8f 00           mov byte ptr [0x8f5b], 0
03D26: ff 06 9c 91              inc word ptr [0x919c]
03D2A: a1 9c 91                 mov ax, word ptr [0x919c]
03D2D: 25 03 00                 and ax, 3
03D30: 75 15                    jne 0x3d47

; basic_block_03D07
03D07: b4 02                    mov ah, 2
03D09: b0 00                    mov al, 0
03D0B: cd 80                    int 0x80

; basic_block_00083
00083: c6 06 5a 8e 00           mov byte ptr [0x8e5a], 0
00088: c3                       ret

; basic_block_00072
00072: b4 12                    mov ah, 0x12
00074: b3 10                    mov bl, 0x10
00076: cd 10                    int 0x10
00078: 80 fb 03                 cmp bl, 3
0007B: 73 05                    jae 0x82

; basic_block_0008F

; basic_block_00096
00096: c3                       ret

; basic_block_00091
00091: c6 06 5b 8e 00           mov byte ptr [0x8e5b], 0

; basic_block_000D6
000D6: 83 ef 02                 sub di, 2
000D9: 8e c3                    mov es, bx
000DB: 26 c7 06 00 00 49 48     mov word ptr es:[0], 0x4849
000E2: 8e c2                    mov es, dx
000E4: 26 81 3d 49 48           cmp word ptr es:[di], 0x4849
000E9: 75 06                    jne 0xf1

; basic_block_000C7
000C7: 8e c3                    mov es, bx
000C9: 33 ff                    xor di, di
000CB: 26 8f 06 00 00           pop word ptr es:[0]
000D0: c6 06 58 8e 00           mov byte ptr [0x8e58], 0
000D5: c3                       ret

; basic_block_0011B
0011B: c3                       ret

; basic_block_0011A
0011A: f9                       stc

; basic_block_00061

; basic_block_0005B
0005B: c3                       ret

; basic_block_0002C
0002C: c6 06 58 8e 00           mov byte ptr [0x8e58], 0
00031: c3                       ret

; basic_block_00022
00022: 80 fb 0c                 cmp bl, 0xc
00025: 77 05                    ja 0x2c

; basic_block_00760
00760: c3                       ret

; basic_block_0071F
0071F: 2a 06 f5 2e              sub al, byte ptr [0x2ef5]
00723: f6 d8                    neg al
00725: d0 e8                    shr al, 1
00727: a2 f2 2e                 mov byte ptr [0x2ef2], al
0072A: ac                       lodsb al, byte ptr [si]
0072B: a2 f6 2e                 mov byte ptr [0x2ef6], al
0072E: 51                       push cx
0072F: ac                       lodsb al, byte ptr [si]
00730: 84 c0                    test al, al
00732: 74 28                    je 0x75c

; basic_block_00714
00714: b3 f0                    mov bl, 0xf0

; basic_block_0066E
0066E: b8 00 06                 mov ax, 0x600
00671: 32 ff                    xor bh, bh
00673: 33 c9                    xor cx, cx
00675: 8a 16 f5 2e              mov dl, byte ptr [0x2ef5]
00679: fe ca                    dec dl
0067B: b6 18                    mov dh, 0x18
0067D: cd 10                    int 0x10
0067F: be 9a 2f                 mov si, 0x2f9a
00682: b9 06 00                 mov cx, 6
00685: 51                       push cx
00686: 32 d2                    xor dl, dl
00688: ac                       lodsb al, byte ptr [si]
00689: 8a f0                    mov dh, al
0068B: 8a 3e f3 2e              mov bh, byte ptr [0x2ef3]
0068F: b4 02                    mov ah, 2
00691: cd 10                    int 0x10
00693: b8 20 09                 mov ax, 0x920
00696: 8a 3e f3 2e              mov bh, byte ptr [0x2ef3]
0069A: b3 07                    mov bl, 7
0069C: b9 01 00                 mov cx, 1
0069F: cd 10                    int 0x10
006A1: ac                       lodsb al, byte ptr [si]
006A2: 84 c0                    test al, al
006A4: 74 0c                    je 0x6b2

; basic_block_00661

; basic_block_005F4

; basic_block_00631
00631: ff 06 44 30              inc word ptr [0x3044]
00635: 83 3e 44 30 06           cmp word ptr [0x3044], 6
0063A: 7c c9                    jl 0x605

; basic_block_0061B
0061B: 80 fc 50                 cmp ah, 0x50
0061E: 74 11                    je 0x631

; basic_block_005D7
005D7: b8 01 00                 mov ax, 1

; basic_block_0014C
0014C: a1 77 21                 mov ax, word ptr [0x2177]
0014F: a3 00 00                 mov word ptr [0], ax
00152: a1 79 21                 mov ax, word ptr [0x2179]
00155: a3 02 00                 mov word ptr [2], ax
00158: a0 6c 21                 mov al, byte ptr [0x216c]
0015B: 32 e4                    xor ah, ah
0015D: 05 6e 21                 add ax, 0x216e
00160: a3 6a 21                 mov word ptr [0x216a], ax
00163: e8 34 00                 call 0x19a
00166: b4 3e                    mov ah, 0x3e
00168: 8b 1e 70 23              mov bx, word ptr [0x2370]
0016C: cd 21                    int 0x21
0016E: 58                       pop ax
0016F: 8e d8                    mov ds, ax
00171: 8e c0                    mov es, ax
00173: c3                       ret

; basic_block_00149
00149: e9 b8 5c                 jmp 0x5e04

; basic_block_05E04
05E04: b8 53 18                 mov ax, 0x1853
05E07: 8e d8                    mov ds, ax
05E09: 8e c0                    mov es, ax
05E0B: b8 03 00                 mov ax, 3
05E0E: 83 3e 44 30 04           cmp word ptr [0x3044], 4
05E13: 75 03                    jne 0x5e18

; basic_block_06100
06100: a8 02                    test al, 2
06102: 74 02                    je 0x6106

; basic_block_060FE
060FE: fe c7                    inc bh

; basic_block_0607F
0607F: d0 ef                    shr bh, 1
06081: d0 eb                    shr bl, 1
06083: 89 1e 4e 8f              mov word ptr [0x8f4e], bx
06087: 8a c7                    mov al, bh
06089: d0 e7                    shl bh, 1
0608B: 02 f8                    add bh, al
0608D: 8a c3                    mov al, bl
0608F: d0 e3                    shl bl, 1
06091: 02 d8                    add bl, al
06093: 89 1e 4c 8f              mov word ptr [0x8f4c], bx
06097: a1 4d 8f                 mov ax, word ptr [0x8f4d]
0609A: 86 e0                    xchg al, ah
0609C: a3 4d 8f                 mov word ptr [0x8f4d], ax
0609F: c6 06 53 8f ff           mov byte ptr [0x8f53], 0xff

; basic_block_06075
06075: 80 fb 20                 cmp bl, 0x20
06078: 72 e9                    jb 0x6063

; basic_block_041A7

; basic_block_042A0

; basic_block_04289
04289: b8 50 00                 mov ax, 0x50
0428C: 83 3e 44 30 02           cmp word ptr [0x3044], 2
04291: 74 0a                    je 0x429d

; basic_block_00DF4

; basic_block_00D8E

; basic_block_05922

; basic_block_05925

; basic_block_00A0D
00A0D: 8b 2e 44 30              mov bp, word ptr [0x3044]
00A11: d1 e5                    shl bp, 1
00A13: d1 e5                    shl bp, 1
00A15: 2e ff 9e 1b 0a           lcall cs:[bp + 0xa1b]
00A1A: c3                       ret

; basic_block_058A4

; basic_block_00D1B
00D1B: 8b 2e 44 30              mov bp, word ptr [0x3044]
00D1F: d1 e5                    shl bp, 1
00D21: d1 e5                    shl bp, 1
00D23: 2e ff 9e 29 0d           lcall cs:[bp + 0xd29]
00D28: c3                       ret

; basic_block_058A7

; basic_block_058D9
058D9: e8 55 af                 call 0x831
058DC: 80 3e 5b 8f 00           cmp byte ptr [0x8f5b], 0
058E1: 75 33                    jne 0x5916

; basic_block_058AE
058AE: c7 06 52 37 78 00        mov word ptr [0x3752], 0x78
058B4: 8b 36 54 37              mov si, word ptr [0x3754]
058B8: e8 40 b2                 call 0xafb
058BB: 83 3e 50 37 24           cmp word ptr [0x3750], 0x24
058C0: 7c 17                    jl 0x58d9

; basic_block_00BC7
00BC7: 8b 2e 44 30              mov bp, word ptr [0x3044]
00BCB: d1 e5                    shl bp, 1
00BCD: d1 e5                    shl bp, 1
00BCF: 2e ff 9e d5 0b           lcall cs:[bp + 0xbd5]
00BD4: c3                       ret

; basic_block_05938

; basic_block_05941

; basic_block_05945

; basic_block_05949

; basic_block_0598F
0598F: 51                       push cx
05990: e8 7a b0                 call 0xa0d
05993: 8b 36 54 37              mov si, word ptr [0x3754]
05997: e8 61 b1                 call 0xafb
0599A: e8 94 ae                 call 0x831
0599D: e8 b1 b0                 call 0xa51
059A0: e8 44 b4                 call 0xde7
059A3: e8 db b3                 call 0xd81
059A6: 59                       pop cx
059A7: e2 e6                    loop 0x598f
059A9: c3                       ret

; basic_block_0596B
0596B: e8 79 b4                 call 0xde7
0596E: e8 9c b0                 call 0xa0d
05971: 8b 36 54 37              mov si, word ptr [0x3754]
05975: e8 83 b1                 call 0xafb
05978: e8 b6 ae                 call 0x831
0597B: e8 d3 b0                 call 0xa51
0597E: e8 00 b4                 call 0xd81
05981: 80 3e 5b 8f 00           cmp byte ptr [0x8f5b], 0
05986: 74 e6                    je 0x596e

; basic_block_009F8

; basic_block_00B08

; basic_block_05B62

; basic_block_05B75
05B75: e8 83 af                 call 0xafb
05B78: c7 06 52 37 6c 00        mov word ptr [0x3752], 0x6c
05B7E: be db 34                 mov si, 0x34db
05B81: 80 3e 54 8f 00           cmp byte ptr [0x8f54], 0
05B86: 75 03                    jne 0x5b8b

; basic_block_05B72
05B72: be c7 34                 mov si, 0x34c7

; basic_block_05B10
05B10: be 3f 35                 mov si, 0x353f
05B13: 56                       push si
05B14: e8 1e fe                 call 0x5935
05B17: b8 0c 00                 mov ax, 0xc
05B1A: 5e                       pop si
05B1B: b9 01 00                 mov cx, 1
05B1E: e9 3c fe                 jmp 0x595d

; basic_block_05CD7

; basic_block_05E24
05E24: 52                       push dx
05E25: b8 00 3d                 mov ax, 0x3d00
05E28: cd 21                    int 0x21
05E2A: 5a                       pop dx
05E2B: 73 07                    jae 0x5e34

; basic_block_05CF4

; basic_block_05E52
05E52: b4 3f                    mov ah, 0x3f
05E54: cd 21                    int 0x21
05E56: 72 ac                    jb 0x5e04

; basic_block_05D02

; basic_block_05E59
05E59: b4 3e                    mov ah, 0x3e
05E5B: cd 21                    int 0x21
05E5D: c3                       ret

; basic_block_05D09

; basic_block_05D28
05D28: ba 14 42                 mov dx, 0x4214
05D2B: e8 f6 00                 call 0x5e24
05D2E: a3 60 8e                 mov word ptr [0x8e60], ax
05D31: 8b d8                    mov bx, ax
05D33: b9 2a 08                 mov cx, 0x82a
05D36: ba 74 d2                 mov dx, 0xd274
05D39: e8 16 01                 call 0x5e52
05D3C: 8b 1e 60 8e              mov bx, word ptr [0x8e60]
05D40: e8 16 01                 call 0x5e59
05D43: ba 21 42                 mov dx, 0x4221
05D46: e8 db 00                 call 0x5e24
05D49: a3 60 8e                 mov word ptr [0x8e60], ax
05D4C: 8b d8                    mov bx, ax
05D4E: b9 92 03                 mov cx, 0x392
05D51: ba 9e da                 mov dx, 0xda9e
05D54: e8 fb 00                 call 0x5e52
05D57: 8b 1e 60 8e              mov bx, word ptr [0x8e60]
05D5B: e8 fb 00                 call 0x5e59
05D5E: ba 30 42                 mov dx, 0x4230
05D61: e8 c0 00                 call 0x5e24
05D64: a3 60 8e                 mov word ptr [0x8e60], ax
05D67: 8b d8                    mov bx, ax
05D69: b9 96 1e                 mov cx, 0x1e96
05D6C: ba 30 de                 mov dx, 0xde30
05D6F: e8 e0 00                 call 0x5e52
05D72: 8b 1e 60 8e              mov bx, word ptr [0x8e60]
05D76: e8 e0 00                 call 0x5e59
05D79: be 30 de                 mov si, 0xde30
05D7C: b9 73 00                 mov cx, 0x73
05D7F: b8 16 df                 mov ax, 0xdf16
05D82: 01 04                    add word ptr [si], ax
05D84: 83 c6 02                 add si, 2
05D87: e2 f9                    loop 0x5d82
05D89: ba f9 41                 mov dx, 0x41f9
05D8C: e8 95 00                 call 0x5e24
05D8F: a3 60 8e                 mov word ptr [0x8e60], ax
05D92: 8b d8                    mov bx, ax
05D94: b9 80 e4                 mov cx, 0xe480
05D97: 33 d2                    xor dx, dx
05D99: b8 d0 53                 mov ax, 0x53d0
05D9C: 1e                       push ds
05D9D: 8e d8                    mov ds, ax
05D9F: e8 b0 00                 call 0x5e52
05DA2: 1f                       pop ds
05DA3: 8b 1e 60 8e              mov bx, word ptr [0x8e60]
05DA7: e8 af 00                 call 0x5e59
05DAA: 06                       push es
05DAB: b8 89 44                 mov ax, 0x4489
05DAE: 8e c0                    mov es, ax
05DB0: 33 c0                    xor ax, ax
05DB2: 33 ff                    xor di, di
05DB4: b9 34 7a                 mov cx, 0x7a34
05DB7: f3 ab                    rep stosw word ptr es:[di], ax
05DB9: 07                       pop es
05DBA: ba 05 42                 mov dx, 0x4205
05DBD: e8 64 00                 call 0x5e24
05DC0: a3 60 8e                 mov word ptr [0x8e60], ax
05DC3: 8b d8                    mov bx, ax
05DC5: b9 68 f4                 mov cx, 0xf468
05DC8: ba 00 00                 mov dx, 0
05DCB: b8 89 44                 mov ax, 0x4489
05DCE: 1e                       push ds
05DCF: 8e d8                    mov ds, ax
05DD1: e8 7e 00                 call 0x5e52
05DD4: 1f                       pop ds
05DD5: 8b 1e 60 8e              mov bx, word ptr [0x8e60]
05DD9: e8 7d 00                 call 0x5e59
05DDC: 1e                       push ds
05DDD: b8 d0 53                 mov ax, 0x53d0
05DE0: 8e d8                    mov ds, ax
05DE2: 33 f6                    xor si, si
05DE4: bf 38 55                 mov di, 0x5538
05DE7: b9 90 1c                 mov cx, 0x1c90
05DEA: ad                       lodsw ax, word ptr [si]
05DEB: 8b d0                    mov dx, ax
05DED: ad                       lodsw ax, word ptr [si]
05DEE: 0b d0                    or dx, ax
05DF0: ad                       lodsw ax, word ptr [si]
05DF1: 0b d0                    or dx, ax
05DF3: ad                       lodsw ax, word ptr [si]
05DF4: 0b c2                    or ax, dx
05DF6: ab                       stosw word ptr es:[di], ax
05DF7: e2 f1                    loop 0x5dea
05DF9: 1f                       pop ds
05DFA: e8 c8 af                 call 0xdc5
05DFD: e8 50 fb                 call 0x5950
05E00: e8 5c af                 call 0xd5f
05E03: c3                       ret

; basic_block_05D22
05D22: 81 ff e0 2e              cmp di, 0x2ee0
05D26: 7c e8                    jl 0x5d10

; basic_block_05E03

; basic_block_009A7
009A7: 8b 2e 44 30              mov bp, word ptr [0x3044]
009AB: d1 e5                    shl bp, 1
009AD: d1 e5                    shl bp, 1
009AF: 2e ff 9e b5 09           lcall cs:[bp + 0x9b5]
009B4: c3                       ret

; basic_block_01861

; basic_block_00A73
00A73: 8b 2e 44 30              mov bp, word ptr [0x3044]
00A77: d1 e5                    shl bp, 1
00A79: d1 e5                    shl bp, 1
00A7B: 2e ff 9e 81 0a           lcall cs:[bp + 0xa81]
00A80: c3                       ret

; basic_block_01864

; basic_block_016A9
016A9: e8 c3 f7                 call 0xe6f
016AC: 83 36 7a 8e 01           xor word ptr [0x8e7a], 1
016B1: e8 bb f7                 call 0xe6f
016B4: 83 36 7a 8e 01           xor word ptr [0x8e7a], 1
016B9: c3                       ret

; basic_block_01898

; basic_block_016BA
016BA: be b2 8f                 mov si, 0x8fb2
016BD: e8 a2 f0                 call 0x762
016C0: be fe 8f                 mov si, 0x8ffe
016C3: e8 9c f0                 call 0x762
016C6: be 4a 90                 mov si, 0x904a
016C9: e8 96 f0                 call 0x762
016CC: be 96 90                 mov si, 0x9096
016CF: e8 90 f0                 call 0x762
016D2: be e2 90                 mov si, 0x90e2
016D5: e8 8a f0                 call 0x762
016D8: be 00 9f                 mov si, 0x9f00
016DB: bf b2 8f                 mov di, 0x8fb2
016DE: e8 9b f0                 call 0x77c
016E1: c7 04 08 00              mov word ptr [si], 8
016E5: c7 44 02 11 43           mov word ptr [si + 2], 0x4311
016EA: c7 44 04 53 08           mov word ptr [si + 4], 0x853
016EF: c7 44 0c 7a 07           mov word ptr [si + 0xc], 0x77a
016F4: c7 44 0e 00 00           mov word ptr [si + 0xe], 0
016F9: c7 44 12 a0 00           mov word ptr [si + 0x12], 0xa0
016FE: c7 44 16 b0 00           mov word ptr [si + 0x16], 0xb0
01703: bb 92 32                 mov bx, 0x3292
01706: b9 04 00                 mov cx, 4
01709: e8 16 f9                 call 0x1022
0170C: bf b2 8f                 mov di, 0x8fb2
0170F: e8 7c f0                 call 0x78e
01712: c7 04 c4 00              mov word ptr [si], 0xc4
01716: c7 44 02 59 47           mov word ptr [si + 2], 0x4759
0171B: c7 44 04 61 07           mov word ptr [si + 4], 0x761
01720: 8b 3f                    mov di, word ptr [bx]
01722: 83 c3 02                 add bx, 2
01725: 2e 8b 05                 mov ax, word ptr cs:[di]
01728: 89 44 0c                 mov word ptr [si + 0xc], ax
0172B: 2e 8b 45 02              mov ax, word ptr cs:[di + 2]
0172F: 89 44 0e                 mov word ptr [si + 0xe], ax
01732: 83 c7 04                 add di, 4
01735: 89 7c 10                 mov word ptr [si + 0x10], di
01738: c7 44 12 a0 00           mov word ptr [si + 0x12], 0xa0
0173D: c7 44 16 b0 00           mov word ptr [si + 0x16], 0xb0
01742: 8b c1                    mov ax, cx
01744: 48                       dec ax
01745: 89 44 22                 mov word ptr [si + 0x22], ax
01748: e2 bf                    loop 0x1709
0174A: c7 06 34 91 00 00        mov word ptr [0x9134], 0
01750: c7 06 4c 91 00 00        mov word ptr [0x914c], 0
01756: c7 06 38 91 00 00        mov word ptr [0x9138], 0
0175C: c7 06 3c 91 00 00        mov word ptr [0x913c], 0
01762: c7 06 40 91 00 00        mov word ptr [0x9140], 0
01768: c7 06 44 91 00 00        mov word ptr [0x9144], 0
0176E: c7 06 48 91 00 00        mov word ptr [0x9148], 0
01774: e8 55 14                 call 0x2bcc
01777: b9 0e 00                 mov cx, 0xe
0177A: bf 6a 91                 mov di, 0x916a
0177D: 33 c0                    xor ax, ax
0177F: f3 ab                    rep stosw word ptr es:[di], ax
01781: e8 67 1e                 call 0x35eb
01784: c7 06 2e 91 08 00        mov word ptr [0x912e], 8
0178A: c7 06 30 91 08 00        mov word ptr [0x9130], 8
01790: c7 06 32 91 01 00        mov word ptr [0x9132], 1
01796: c7 06 7e 8e 00 00        mov word ptr [0x8e7e], 0
0179C: c7 06 50 91 00 00        mov word ptr [0x9150], 0
017A2: c7 06 80 8e 00 00        mov word ptr [0x8e80], 0
017A8: c7 06 82 8e 00 00        mov word ptr [0x8e82], 0
017AE: c7 06 52 91 00 00        mov word ptr [0x9152], 0
017B4: c7 06 54 91 00 00        mov word ptr [0x9154], 0
017BA: c7 06 56 91 00 00        mov word ptr [0x9156], 0
017C0: c7 06 58 91 00 00        mov word ptr [0x9158], 0
017C6: c7 06 5e 91 00 00        mov word ptr [0x915e], 0
017CC: c7 06 60 91 00 00        mov word ptr [0x9160], 0
017D2: c7 06 84 8e 00 00        mov word ptr [0x8e84], 0
017D8: c7 06 62 91 00 00        mov word ptr [0x9162], 0
017DE: bf 1c 92                 mov di, 0x921c
017E1: b9 07 00                 mov cx, 7
017E4: 32 c0                    xor al, al
017E6: f3 aa                    rep stosb byte ptr es:[di], al
017E8: c7 06 64 91 00 00        mov word ptr [0x9164], 0
017EE: c7 06 86 91 27 00        mov word ptr [0x9186], 0x27
017F4: c7 06 88 91 00 00        mov word ptr [0x9188], 0
017FA: c6 06 23 92 00           mov byte ptr [0x9223], 0
017FF: c6 06 24 92 00           mov byte ptr [0x9224], 0
01804: c7 06 8a 91 03 00        mov word ptr [0x918a], 3
0180A: c7 06 8c 91 01 00        mov word ptr [0x918c], 1
01810: c6 06 25 92 00           mov byte ptr [0x9225], 0
01815: c7 06 b0 91 03 00        mov word ptr [0x91b0], 3
0181B: e8 73 f6                 call 0xe91
0181E: c6 06 af 8f ff           mov byte ptr [0x8faf], 0xff
01823: e8 7f f3                 call 0xba5
01826: c3                       ret

; basic_block_0189B

; basic_block_018AD
018AD: e8 69 01                 call 0x1a19
018B0: c7 06 8a 91 00 00        mov word ptr [0x918a], 0
018B6: e8 d8 f5                 call 0xe91
018B9: e8 5d 01                 call 0x1a19
018BC: c3                       ret

; basic_block_018A2
018A2: e8 74 01                 call 0x1a19
018A5: e8 12 fe                 call 0x16ba
018A8: e8 6e 01                 call 0x1a19
018AB: eb 0f                    jmp 0x18bc

; basic_block_00F78
00F78: 89 1e 74 8e              mov word ptr [0x8e74], bx
00F7C: 8b 1e 1c 99              mov bx, word ptr [0x991c]
00F80: d1 e3                    shl bx, 1
00F82: 2e ff b7 8a 0f           push word ptr cs:[bx + 0xf8a]
00F87: 8b 1e 74 8e              mov bx, word ptr [0x8e74]
00F8B: c3                       ret

; basic_block_01B06

; basic_block_01A19
01A19: be 80 ce                 mov si, 0xce80
01A1C: bf b2 8f                 mov di, 0x8fb2
01A1F: b9 46 01                 mov cx, 0x146
01A22: ad                       lodsw ax, word ptr [si]
01A23: 8b 1d                    mov bx, word ptr [di]
01A25: 89 5c fe                 mov word ptr [si - 2], bx
01A28: ab                       stosw word ptr es:[di], ax
01A29: e2 f7                    loop 0x1a22
01A2B: be 00 9f                 mov si, 0x9f00
01A2E: bf 62 8f                 mov di, 0x8f62
01A31: b9 4c 00                 mov cx, 0x4c
01A34: ac                       lodsb al, byte ptr [si]
01A35: 8a 25                    mov ah, byte ptr [di]
01A37: 88 64 ff                 mov byte ptr [si - 1], ah
01A3A: aa                       stosb byte ptr es:[di], al
01A3B: e2 f7                    loop 0x1a34
01A3D: be 00 00                 mov si, 0
01A40: bf 00 00                 mov di, 0
01A43: b9 70 17                 mov cx, 0x1770
01A46: b8 65 15                 mov ax, 0x1565
01A49: 8e c0                    mov es, ax
01A4B: ad                       lodsw ax, word ptr [si]
01A4C: 26 8b 1d                 mov bx, word ptr es:[di]
01A4F: 89 5c fe                 mov word ptr [si - 2], bx
01A52: ab                       stosw word ptr es:[di], ax
01A53: e2 f6                    loop 0x1a4b
01A55: 8c d8                    mov ax, ds
01A57: 8e c0                    mov es, ax
01A59: 83 36 7a 8e 01           xor word ptr [0x8e7a], 1
01A5E: e8 f9 f4                 call 0xf5a
01A61: c3                       ret

; basic_block_01B89

; basic_block_01B8C

; basic_block_0592B

; basic_block_05933

; basic_block_05950
05950: e8 d8 b4                 call 0xe2b
05953: e8 2b b4                 call 0xd81
05956: e8 90 b2                 call 0xbe9
05959: e8 0e e9                 call 0x426a
0595C: c3                       ret

; basic_block_00985
00985: 8b 2e 44 30              mov bp, word ptr [0x3044]
00989: d1 e5                    shl bp, 1
0098B: d1 e5                    shl bp, 1
0098D: 2e ff 9e 93 09           lcall cs:[bp + 0x993]
00992: c3                       ret

; basic_block_03D10

; basic_block_0080F
0080F: 8b 2e 44 30              mov bp, word ptr [0x3044]
00813: d1 e5                    shl bp, 1
00815: d1 e5                    shl bp, 1
00817: 2e ff 9e 1d 08           lcall cs:[bp + 0x81d]
0081C: c3                       ret

; basic_block_03D13

; basic_block_00A2F
00A2F: 8b 2e 44 30              mov bp, word ptr [0x3044]
00A33: d1 e5                    shl bp, 1
00A35: d1 e5                    shl bp, 1
00A37: 2e ff 9e 3d 0a           lcall cs:[bp + 0xa3d]
00A3C: c3                       ret

; basic_block_03D16

; basic_block_00E2B
00E2B: 8b 2e 44 30              mov bp, word ptr [0x3044]
00E2F: d1 e5                    shl bp, 1
00E31: d1 e5                    shl bp, 1
00E33: 2e ff 9e 39 0e           lcall cs:[bp + 0xe39]
00E38: c3                       ret

; basic_block_03D19

; basic_block_03D1C

; basic_block_03D47
03D47: e8 3b cc                 call 0x985
03D4A: c7 06 9a 91 01 00        mov word ptr [0x919a], 1
03D50: e8 fa d0                 call 0xe4d
03D53: e8 4f ce                 call 0xba5
03D56: e8 e4 f9                 call 0x373d
03D59: e8 94 d2                 call 0xff0
03D5C: e8 23 f9                 call 0x3682
03D5F: e8 ad ca                 call 0x80f
03D62: e8 10 09                 call 0x4675
03D65: e8 2d cd                 call 0xa95
03D68: e8 aa f8                 call 0x3615
03D6B: a0 58 8f                 mov al, byte ptr [0x8f58]
03D6E: 84 c0                    test al, al
03D70: 75 03                    jne 0x3d75

; basic_block_03D32
03D32: a1 ac 91                 mov ax, word ptr [0x91ac]
03D35: a3 b0 8e                 mov word ptr [0x8eb0], ax
03D38: a1 ac 91                 mov ax, word ptr [0x91ac]
03D3B: a3 b2 8e                 mov word ptr [0x8eb2], ax
03D3E: ff 06 b2 8e              inc word ptr [0x8eb2]
03D42: 83 06 ac 91 02           add word ptr [0x91ac], 2

; basic_block_00082
00082: c3                       ret

; basic_block_0007D
0007D: c6 06 5e 8e 00           mov byte ptr [0x8e5e], 0

; basic_block_000F1
000F1: 8e c3                    mov es, bx
000F3: 26 c7 06 00 00 4a 41     mov word ptr es:[0], 0x414a
000FA: 8e c2                    mov es, dx
000FC: 83 c7 02                 add di, 2
000FF: eb c2                    jmp 0xc3

; basic_block_000EB
000EB: 26 8f 06 00 00           pop word ptr es:[0]
000F0: c3                       ret

; basic_block_00027
00027: c6 06 5a 8e 00           mov byte ptr [0x8e5a], 0

; basic_block_0075C
0075C: 59                       pop cx
0075D: 41                       inc cx
0075E: eb a3                    jmp 0x703

; basic_block_00734
00734: b4 02                    mov ah, 2
00736: 8a 3e f3 2e              mov bh, byte ptr [0x2ef3]
0073A: 8a 36 f6 2e              mov dh, byte ptr [0x2ef6]
0073E: 8a 16 f2 2e              mov dl, byte ptr [0x2ef2]
00742: cd 10                    int 0x10
00744: fe 06 f2 2e              inc byte ptr [0x2ef2]
00748: 8a 44 ff                 mov al, byte ptr [si - 1]
0074B: b4 09                    mov ah, 9
0074D: 8a 1e f7 2e              mov bl, byte ptr [0x2ef7]
00751: 8a 3e f3 2e              mov bh, byte ptr [0x2ef3]
00755: b9 01 00                 mov cx, 1
00758: cd 10                    int 0x10
0075A: eb d3                    jmp 0x72f

; basic_block_006B2
006B2: 32 e4                    xor ah, ah
006B4: cd 16                    int 0x16
006B6: 88 24                    mov byte ptr [si], ah
006B8: 46                       inc si
006B9: 80 f4 80                 xor ah, 0x80
006BC: 88 24                    mov byte ptr [si], ah
006BE: 46                       inc si
006BF: 3c 20                    cmp al, 0x20
006C1: 7d 1d                    jge 0x6e0

; basic_block_006A6
006A6: b4 0e                    mov ah, 0xe
006A8: 8a 3e f3 2e              mov bh, byte ptr [0x2ef3]
006AC: b3 07                    mov bl, 7
006AE: cd 10                    int 0x10
006B0: eb e1                    jmp 0x693

; basic_block_00605

; basic_block_0063C
0063C: c7 06 44 30 00 00        mov word ptr [0x3044], 0
00642: eb c1                    jmp 0x605

; basic_block_00620
00620: 80 fc 4d                 cmp ah, 0x4d
00623: 74 0c                    je 0x631

; basic_block_0019A
0019A: 56                       push si
0019B: 57                       push di
0019C: 55                       push bp
0019D: a1 00 00                 mov ax, word ptr [0]
001A0: 0b 06 02 00              or ax, word ptr [2]
001A4: 75 03                    jne 0x1a9

; basic_block_00166

; basic_block_05E18
05E18: cd 10                    int 0x10
05E1A: ba 0f 30                 mov dx, 0x300f
05E1D: b4 09                    mov ah, 9
05E1F: cd 21                    int 0x21
05E21: e9 2b a7                 jmp 0x54f

; basic_block_05E15
05E15: b8 07 00                 mov ax, 7

; basic_block_06106
06106: a8 03                    test al, 3
06108: 74 0a                    je 0x6114

; basic_block_06104
06104: fe c3                    inc bl

; basic_block_06063

; basic_block_0607A
0607A: 80 ff 20                 cmp bh, 0x20
0607D: 72 e4                    jb 0x6063

; basic_block_04293
04293: 83 3e 44 30 04           cmp word ptr [0x3044], 4
04298: 74 03                    je 0x429d

; basic_block_00A1A

; basic_block_00D28

; basic_block_00831
00831: 8b 2e 44 30              mov bp, word ptr [0x3044]
00835: d1 e5                    shl bp, 1
00837: d1 e5                    shl bp, 1
00839: 2e ff 9e 3f 08           lcall cs:[bp + 0x83f]
0083E: c3                       ret

; basic_block_058DC

; basic_block_058E3
058E3: e8 6b b1                 call 0xa51
058E6: ff 06 50 37              inc word ptr [0x3750]
058EA: 83 3e 50 37 48           cmp word ptr [0x3750], 0x48
058EF: 75 b0                    jne 0x58a1

; basic_block_058BB

; basic_block_058C2
058C2: 83 3e 50 37 36           cmp word ptr [0x3750], 0x36
058C7: 7d 10                    jge 0x58d9

; basic_block_00BD4

; basic_block_05993

; basic_block_0599A

; basic_block_0599D

; basic_block_00A51
00A51: 8b 2e 44 30              mov bp, word ptr [0x3044]
00A55: d1 e5                    shl bp, 1
00A57: d1 e5                    shl bp, 1
00A59: 2e ff 9e 5f 0a           lcall cs:[bp + 0xa5f]
00A5E: c3                       ret

; basic_block_059A0

; basic_block_059A3

; basic_block_059A6

; basic_block_0596E

; basic_block_05971

; basic_block_05978

; basic_block_0597B

; basic_block_0597E

; basic_block_05981

; basic_block_05988
05988: c6 06 5b 8f 00           mov byte ptr [0x8f5b], 0
0598D: eb 1a                    jmp 0x59a9

; basic_block_05B78

; basic_block_05B8B
05B8B: 58                       pop ax
05B8C: 50                       push ax
05B8D: 3d 02 00                 cmp ax, 2
05B90: 75 03                    jne 0x5b95

; basic_block_05B88
05B88: be 03 35                 mov si, 0x3503

; basic_block_05B17

; basic_block_05E34
05E34: c3                       ret

; basic_block_05E2D
05E2D: 52                       push dx
05E2E: e8 04 00                 call 0x5e35
05E31: 5a                       pop dx
05E32: eb f0                    jmp 0x5e24

; basic_block_05E58
05E58: c3                       ret

; basic_block_05D2E

; basic_block_05D3C

; basic_block_05D43

; basic_block_05D49

; basic_block_05D57

; basic_block_05D5E

; basic_block_05D64

; basic_block_05D72

; basic_block_05D79

; basic_block_05D8F

; basic_block_05DA2

; basic_block_05DAA

; basic_block_05DC0

; basic_block_05DD4

; basic_block_05DDC

; basic_block_00DC5
00DC5: 8b 2e 44 30              mov bp, word ptr [0x3044]
00DC9: d1 e5                    shl bp, 1
00DCB: d1 e5                    shl bp, 1
00DCD: 2e ff 9e d3 0d           lcall cs:[bp + 0xdd3]
00DD2: c3                       ret

; basic_block_05DFD

; basic_block_05E00

; basic_block_05D10

; basic_block_009B4

; basic_block_00A80

; basic_block_00E6F
00E6F: 8b 2e 44 30              mov bp, word ptr [0x3044]
00E73: d1 e5                    shl bp, 1
00E75: d1 e5                    shl bp, 1
00E77: 2e ff 9e 7d 0e           lcall cs:[bp + 0xe7d]
00E7C: c3                       ret

; basic_block_016AC

; basic_block_016B4

; basic_block_00762
00762: c7 04 00 00              mov word ptr [si], 0
00766: 89 74 0a                 mov word ptr [si + 0xa], si
00769: 89 74 08                 mov word ptr [si + 8], si
0076C: c7 44 02 61 07           mov word ptr [si + 2], 0x761
00771: c7 44 04 61 07           mov word ptr [si + 4], 0x761
00776: c7 44 06 61 07           mov word ptr [si + 6], 0x761
0077B: c3                       ret

; basic_block_016C0

; basic_block_016C6

; basic_block_016CC

; basic_block_016D2

; basic_block_016D8

; basic_block_0077C
0077C: 53                       push bx
0077D: 8b 5d 0a                 mov bx, word ptr [di + 0xa]
00780: 89 75 0a                 mov word ptr [di + 0xa], si
00783: 89 5c 0a                 mov word ptr [si + 0xa], bx
00786: 89 7c 08                 mov word ptr [si + 8], di
00789: 89 77 08                 mov word ptr [bx + 8], si
0078C: 5b                       pop bx
0078D: c3                       ret

; basic_block_016E1

; basic_block_01022
01022: 83 3e 7c 8e 00           cmp word ptr [0x8e7c], 0
01027: 74 18                    je 0x1041

; basic_block_0170C

; basic_block_0078E
0078E: 53                       push bx
0078F: 8b 5d 08                 mov bx, word ptr [di + 8]
00792: 89 75 08                 mov word ptr [di + 8], si
00795: 89 5c 08                 mov word ptr [si + 8], bx
00798: 89 7c 0a                 mov word ptr [si + 0xa], di
0079B: 89 77 0a                 mov word ptr [bx + 0xa], si
0079E: 5b                       pop bx
0079F: c3                       ret

; basic_block_01712

; basic_block_02BCC
02BCC: 83 3e 34 91 00           cmp word ptr [0x9134], 0
02BD1: 74 09                    je 0x2bdc

; basic_block_01777

; basic_block_035EB
035EB: 83 3e 62 91 00           cmp word ptr [0x9162], 0
035F0: 75 22                    jne 0x3614

; basic_block_01784

; basic_block_00E91
00E91: 8b 2e 44 30              mov bp, word ptr [0x3044]
00E95: d1 e5                    shl bp, 1
00E97: d1 e5                    shl bp, 1
00E99: 2e ff 9e 9f 0e           lcall cs:[bp + 0xe9f]
00E9E: c3                       ret

; basic_block_0181E

; basic_block_00BA5
00BA5: 8b 2e 44 30              mov bp, word ptr [0x3044]
00BA9: d1 e5                    shl bp, 1
00BAB: d1 e5                    shl bp, 1
00BAD: 2e ff 9e b3 0b           lcall cs:[bp + 0xbb3]
00BB2: c3                       ret

; basic_block_01826

; basic_block_018B0

; basic_block_018B9

; basic_block_018BC

; basic_block_018A5

; basic_block_018A8

; basic_block_018AB

; basic_block_00F5A
00F5A: 89 1e 74 8e              mov word ptr [0x8e74], bx
00F5E: 8b 1e 1c 99              mov bx, word ptr [0x991c]
00F62: d1 e3                    shl bx, 1
00F64: 2e ff b7 6c 0f           push word ptr cs:[bx + 0xf6c]
00F69: 8b 1e 74 8e              mov bx, word ptr [0x8e74]
00F6D: c3                       ret

; basic_block_01A61

; basic_block_05953

; basic_block_05956

; basic_block_00BE9
00BE9: 8b 2e 44 30              mov bp, word ptr [0x3044]
00BED: d1 e5                    shl bp, 1
00BEF: d1 e5                    shl bp, 1
00BF1: 2e ff 9e f7 0b           lcall cs:[bp + 0xbf7]
00BF6: c3                       ret

; basic_block_05959

; basic_block_0595C

; basic_block_00992

; basic_block_0081C

; basic_block_00A3C

; basic_block_00E38

; basic_block_03D4A

; basic_block_00E4D
00E4D: 8b 2e 44 30              mov bp, word ptr [0x3044]
00E51: d1 e5                    shl bp, 1
00E53: d1 e5                    shl bp, 1
00E55: 2e ff 9e 5b 0e           lcall cs:[bp + 0xe5b]
00E5A: c3                       ret

; basic_block_03D53

; basic_block_03D56

; basic_block_0373D
0373D: 8b 36 54 90              mov si, word ptr [0x9054]
03741: 33 c9                    xor cx, cx
03743: 8b 04                    mov ax, word ptr [si]
03745: 85 c0                    test ax, ax
03747: 74 12                    je 0x375b

; basic_block_03D59

; basic_block_00FF0
00FF0: 89 1e 74 8e              mov word ptr [0x8e74], bx
00FF4: 8b 1e 1c 99              mov bx, word ptr [0x991c]
00FF8: d1 e3                    shl bx, 1
00FFA: 2e ff b7 02 10           push word ptr cs:[bx + 0x1002]
00FFF: 8b 1e 74 8e              mov bx, word ptr [0x8e74]
01003: c3                       ret

; basic_block_03D5C

; basic_block_03682
03682: 8b 36 bc 8f              mov si, word ptr [0x8fbc]
03686: e8 73 00                 call 0x36fc
03689: 8b 36 54 90              mov si, word ptr [0x9054]
0368D: e8 6c 00                 call 0x36fc
03690: 8b 36 08 90              mov si, word ptr [0x9008]
03694: a0 5b 8f                 mov al, byte ptr [0x8f5b]
03697: a2 ae 8f                 mov byte ptr [0x8fae], al
0369A: c6 06 5b 8f 00           mov byte ptr [0x8f5b], 0
0369F: e8 5a 00                 call 0x36fc
036A2: 8b 36 a0 90              mov si, word ptr [0x90a0]
036A6: e8 53 00                 call 0x36fc
036A9: 8b 36 ec 90              mov si, word ptr [0x90ec]
036AD: e8 4c 00                 call 0x36fc
036B0: 8b 36 bc 8f              mov si, word ptr [0x8fbc]
036B4: e8 54 00                 call 0x370b
036B7: 8b 36 08 90              mov si, word ptr [0x9008]
036BB: e8 4d 00                 call 0x370b
036BE: 8b 36 54 90              mov si, word ptr [0x9054]
036C2: e8 46 00                 call 0x370b
036C5: 8b 36 a0 90              mov si, word ptr [0x90a0]
036C9: e8 3f 00                 call 0x370b
036CC: 8b 36 ec 90              mov si, word ptr [0x90ec]
036D0: e8 38 00                 call 0x370b
036D3: be 8c 8e                 mov si, 0x8e8c
036D6: b9 08 00                 mov cx, 8
036D9: 8b 04                    mov ax, word ptr [si]
036DB: 85 c0                    test ax, ax
036DD: 74 17                    je 0x36f6

; basic_block_03D5F

; basic_block_03D62

; basic_block_04675
04675: 83 3e 80 8e 00           cmp word ptr [0x8e80], 0
0467A: 75 14                    jne 0x4690

; basic_block_03D65

; basic_block_00A95
00A95: 8b 2e 44 30              mov bp, word ptr [0x3044]
00A99: d1 e5                    shl bp, 1
00A9B: d1 e5                    shl bp, 1
00A9D: 2e ff 9e a3 0a           lcall cs:[bp + 0xaa3]
00AA2: c3                       ret

; basic_block_03D68

; basic_block_03615
03615: be 74 d2                 mov si, 0xd274
03618: 8b 1e 92 91              mov bx, word ptr [0x9192]
0361C: 8b 0e 90 91              mov cx, word ptr [0x9190]
03620: 8b 04                    mov ax, word ptr [si]
03622: 85 c0                    test ax, ax
03624: 78 1d                    js 0x3643

; basic_block_03D6B

; basic_block_03D75
03D75: c6 06 58 8f 00           mov byte ptr [0x8f58], 0
03D7A: be 8f 3d                 mov si, 0x3d8f
03D7D: 2e a2 9b 3d              mov byte ptr cs:[0x3d9b], al
03D81: 2e 3a 04                 cmp al, byte ptr cs:[si]
03D84: 74 05                    je 0x3d8b

; basic_block_03D72
03D72: e9 a5 00                 jmp 0x3e1a

; basic_block_000C3

; basic_block_00703

; basic_block_0072F

; basic_block_006E0
006E0: 50                       push ax
006E1: b8 20 09                 mov ax, 0x920
006E4: 8a 3e f3 2e              mov bh, byte ptr [0x2ef3]
006E8: b3 07                    mov bl, 7
006EA: b9 01 00                 mov cx, 1
006ED: cd 10                    int 0x10
006EF: 58                       pop ax
006F0: b4 0e                    mov ah, 0xe
006F2: 8a 3e f3 2e              mov bh, byte ptr [0x2ef3]
006F6: b3 0f                    mov bl, 0xf
006F8: cd 10                    int 0x10
006FA: 59                       pop cx
006FB: e2 88                    loop 0x685
006FD: c3                       ret

; basic_block_006C3
006C3: 50                       push ax
006C4: b8 20 09                 mov ax, 0x920
006C7: 8a 3e f3 2e              mov bh, byte ptr [0x2ef3]
006CB: b3 07                    mov bl, 7
006CD: b9 01 00                 mov cx, 1
006D0: cd 10                    int 0x10
006D2: b8 5e 0e                 mov ax, 0xe5e
006D5: 8a 3e f3 2e              mov bh, byte ptr [0x2ef3]
006D9: b3 0f                    mov bl, 0xf
006DB: cd 10                    int 0x10
006DD: 58                       pop ax
006DE: 04 41                    add al, 0x41

; basic_block_00693

; basic_block_00625
00625: 80 fc 48                 cmp ah, 0x48
00628: 74 1a                    je 0x644

; basic_block_001A9
001A9: e8 84 00                 call 0x230
001AC: e8 f9 00                 call 0x2a8
001AF: bf c4 0f                 mov di, 0xfc4
001B2: 57                       push di
001B3: e8 1e 01                 call 0x2d4
001B6: 8b f8                    mov di, ax
001B8: 3d 00 01                 cmp ax, 0x100
001BB: 7d 23                    jge 0x1e0

; basic_block_001A6
001A6: e9 83 00                 jmp 0x22c

; basic_block_06114
06114: fb                       sti
06115: c3                       ret

; basic_block_0610A
0610A: a1 50 8f                 mov ax, word ptr [0x8f50]
0610D: 48                       dec ax
0610E: 79 fd                    jns 0x610d

; basic_block_0429A
0429A: b8 a0 00                 mov ax, 0xa0

; basic_block_0083E

; basic_block_058E6

; basic_block_058F1
058F1: c7 06 50 37 00 00        mov word ptr [0x3750], 0
058F7: 83 06 54 37 28           add word ptr [0x3754], 0x28
058FC: 81 3e 54 37 15 37        cmp word ptr [0x3754], 0x3715
05902: 75 9d                    jne 0x58a1

; basic_block_058C9
058C9: c7 06 52 37 96 00        mov word ptr [0x3752], 0x96
058CF: 8b 36 54 37              mov si, word ptr [0x3754]
058D3: 83 c6 14                 add si, 0x14
058D6: e8 22 b2                 call 0xafb

; basic_block_00A5E

; basic_block_059A9

; basic_block_05B95
05B95: e8 63 af                 call 0xafb
05B98: e8 e1 00                 call 0x5c7c
05B9B: e8 93 ac                 call 0x831
05B9E: e8 b0 ae                 call 0xa51
05BA1: f6 06 59 8f 01           test byte ptr [0x8f59], 1
05BA6: 74 18                    je 0x5bc0

; basic_block_05B92
05B92: 83 c6 14                 add si, 0x14

; basic_block_05E35
05E35: e8 18 fb                 call 0x5950
05E38: e8 24 af                 call 0xd5f
05E3B: be 3b 34                 mov si, 0x343b
05E3E: c6 06 4e 37 ff           mov byte ptr [0x374e], 0xff
05E43: e8 e0 fa                 call 0x5926
05E46: c6 06 4e 37 00           mov byte ptr [0x374e], 0
05E4B: e8 11 af                 call 0xd5f
05E4E: e8 bf fc                 call 0x5b10
05E51: c3                       ret

; basic_block_05E31

; basic_block_00DD2

; basic_block_00E7C

; basic_block_01041
01041: be 96 90                 mov si, 0x9096
01044: 8b 74 0a                 mov si, word ptr [si + 0xa]
01047: 83 3c 04                 cmp word ptr [si], 4
0104A: 74 21                    je 0x106d

; basic_block_01029
01029: 8b 36 7c 8e              mov si, word ptr [0x8e7c]
0102D: ff 74 08                 push word ptr [si + 8]
01030: 8f 06 7c 8e              pop word ptr [0x8e7c]
01034: c6 44 26 00              mov byte ptr [si + 0x26], 0
01038: c6 44 4a 00              mov byte ptr [si + 0x4a], 0
0103C: c6 44 4b 00              mov byte ptr [si + 0x4b], 0
01040: c3                       ret

; basic_block_02BDC
02BDC: c7 06 34 91 94 00        mov word ptr [0x9134], 0x94
02BE2: 56                       push si
02BE3: e8 3c e4                 call 0x1022
02BE6: bf fe 8f                 mov di, 0x8ffe
02BE9: e8 90 db                 call 0x77c
02BEC: 89 36 36 91              mov word ptr [0x9136], si
02BF0: c7 04 94 00              mov word ptr [si], 0x94
02BF4: c7 44 02 df 37           mov word ptr [si + 2], 0x37df
02BF9: c7 44 06 34 91           mov word ptr [si + 6], 0x9134
02BFE: c7 44 04 61 07           mov word ptr [si + 4], 0x761
02C03: c7 44 34 00 00           mov word ptr [si + 0x34], 0
02C08: c7 44 24 02 00           mov word ptr [si + 0x24], 2
02C0D: c7 44 36 01 00           mov word ptr [si + 0x36], 1
02C12: c7 44 48 ff ff           mov word ptr [si + 0x48], 0xffff
02C17: 8b fe                    mov di, si
02C19: 5e                       pop si
02C1A: c7 06 30 91 08 00        mov word ptr [0x9130], 8
02C20: c3                       ret

; basic_block_02BD3
02BD3: 56                       push si
02BD4: 8b 36 36 91              mov si, word ptr [0x9136]
02BD8: e8 e5 db                 call 0x7c0
02BDB: 5e                       pop si

; basic_block_03614
03614: c3                       ret

; basic_block_035F2
035F2: bf 34 91                 mov di, 0x9134
035F5: be 6a 91                 mov si, 0x916a
035F8: b9 07 00                 mov cx, 7
035FB: 8b 05                    mov ax, word ptr [di]
035FD: 89 04                    mov word ptr [si], ax
035FF: 85 c0                    test ax, ax
03601: 74 06                    je 0x3609

; basic_block_00E9E

; basic_block_00BB2

; basic_block_00BF6

; basic_block_00E5A

; basic_block_0375B
0375B: 89 0e 32 8f              mov word ptr [0x8f32], cx
0375F: c3                       ret

; basic_block_03749
03749: 3d 50 00                 cmp ax, 0x50
0374C: 74 06                    je 0x3754

; basic_block_036FC
036FC: 83 3c 00                 cmp word ptr [si], 0
036FF: 74 09                    je 0x370a

; basic_block_03689

; basic_block_03690

; basic_block_036A2

; basic_block_036A9

; basic_block_036B0

; basic_block_0370B
0370B: 83 3c 00                 cmp word ptr [si], 0
0370E: 74 09                    je 0x3719

; basic_block_036B7

; basic_block_036BE

; basic_block_036C5

; basic_block_036CC

; basic_block_036D3

; basic_block_036F6
036F6: 83 c6 04                 add si, 4
036F9: e2 de                    loop 0x36d9
036FB: c3                       ret

; basic_block_036DF
036DF: 8b 3e 54 90              mov di, word ptr [0x9054]
036E3: 83 3d 00                 cmp word ptr [di], 0
036E6: 74 0a                    je 0x36f2

; basic_block_04690
04690: 83 3e 1e 99 10           cmp word ptr [0x991e], 0x10
04695: 74 04                    je 0x469b

; basic_block_0467C
0467C: 80 3e 24 92 00           cmp byte ptr [0x9224], 0
04681: 75 0d                    jne 0x4690

; basic_block_00AA2

; basic_block_03643
03643: 3b cb                    cmp cx, bx
03645: 7d 3a                    jge 0x3681

; basic_block_03626
03626: 3b d8                    cmp bx, ax
03628: 7e 14                    jle 0x363e

; basic_block_03D8B
03D8B: 2e ff 64 01              jmp word ptr cs:[si + 1]

; basic_block_03D86
03D86: 83 c6 03                 add si, 3
03D89: eb f6                    jmp 0x3d81

; basic_block_03E1A
03E1A: a1 90 91                 mov ax, word ptr [0x9190]
03E1D: a3 fe fc                 mov word ptr [0xfcfe], ax
03E20: a1 9a 91                 mov ax, word ptr [0x919a]
03E23: a3 e2 fc                 mov word ptr [0xfce2], ax
03E26: a1 e2 fc                 mov ax, word ptr [0xfce2]
03E29: 3b 06 8c 91              cmp ax, word ptr [0x918c]
03E2D: 74 17                    je 0x3e46

; basic_block_00644
00644: ff 0e 44 30              dec word ptr [0x3044]
00648: 79 bb                    jns 0x605

; basic_block_0062A
0062A: 80 fc 4b                 cmp ah, 0x4b
0062D: 74 15                    je 0x644

; basic_block_00230
00230: 56                       push si
00231: 57                       push di
00232: 8c d8                    mov ax, ds
00234: 8e c0                    mov es, ax
00236: fc                       cld
00237: b8 01 00                 mov ax, 1
0023A: b9 3a 01                 mov cx, 0x13a
0023D: bf 04 00                 mov di, 4
00240: f3 ab                    rep stosw word ptr es:[di], ax
00242: b8 e6 04                 mov ax, 0x4e6
00245: ba 00 00                 mov dx, 0
00248: b9 3a 01                 mov cx, 0x13a
0024B: bf 46 0c                 mov di, 0xc46
0024E: bb d2 09                 mov bx, 0x9d2
00251: ab                       stosw word ptr es:[di], ax
00252: 05 02 00                 add ax, 2
00255: 89 17                    mov word ptr [bx], dx
00257: 83 c3 02                 add bx, 2
0025A: 83 c2 02                 add dx, 2
0025D: e2 f2                    loop 0x251
0025F: be 00 00                 mov si, 0
00262: bf 02 00                 mov di, 2
00265: bb 74 02                 mov bx, 0x274
00268: b9 39 01                 mov cx, 0x139
0026B: 8b 84 04 00              mov ax, word ptr [si + 4]
0026F: 03 85 04 00              add ax, word ptr [di + 4]
00273: 89 87 04 00              mov word ptr [bx + 4], ax
00277: 89 b7 46 0c              mov word ptr [bx + 0xc46], si
0027B: 89 9c ec 04              mov word ptr [si + 0x4ec], bx
0027F: 89 9d ec 04              mov word ptr [di + 0x4ec], bx
00283: 83 c6 04                 add si, 4
00286: 83 c7 04                 add di, 4
00289: 83 c3 02                 add bx, 2
0028C: e2 dd                    loop 0x26b
0028E: 33 c0                    xor ax, ax
00290: a3 2c 11                 mov word ptr [0x112c], ax
00293: a3 2c 11                 mov word ptr [0x112c], ax
00296: a2 2e 11                 mov byte ptr [0x112e], al
00299: a2 2e 11                 mov byte ptr [0x112e], al
0029C: c7 06 ea 04 ff ff        mov word ptr [0x4ea], 0xffff
002A2: a3 d0 09                 mov word ptr [0x9d0], ax
002A5: 5f                       pop di
002A6: 5e                       pop si
002A7: c3                       ret

; basic_block_001AC

; basic_block_002A8
002A8: fc                       cld
002A9: 8c df                    mov di, ds
002AB: 8e c7                    mov es, di
002AD: bf 2f 11                 mov di, 0x112f
002B0: b0 00                    mov al, 0
002B2: bb 0d 00                 mov bx, 0xd
002B5: 8b cb                    mov cx, bx
002B7: f3 aa                    rep stosb byte ptr es:[di], al
002B9: fe c0                    inc al
002BB: 75 f8                    jne 0x2b5

; basic_block_001AF

; basic_block_002D4
002D4: 8b 36 2a 11              mov si, word ptr [0x112a]
002D8: 8b 16 2c 11              mov dx, word ptr [0x112c]
002DC: 8a 0e 2e 11              mov cl, byte ptr [0x112e]
002E0: 81 e1 ff 00              and cx, 0xff
002E4: eb 0e                    jmp 0x2f4

; basic_block_001B6

; basic_block_001E0
001E0: e8 69 01                 call 0x34c
001E3: 8b cf                    mov cx, di
001E5: 5f                       pop di
001E6: 8b f7                    mov si, di
001E8: 2b f0                    sub si, ax
001EA: 4e                       dec si
001EB: 81 e6 ff 0f              and si, 0xfff
001EF: 81 e9 fd 00              sub cx, 0xfd
001F3: 29 0e 00 00              sub word ptr [0], cx
001F7: 83 1e 02 00 00           sbb word ptr [2], 0
001FC: 8a 84 2f 11              mov al, byte ptr [si + 0x112f]
00200: 88 85 2f 11              mov byte ptr [di + 0x112f], al
00204: 46                       inc si
00205: 47                       inc di
00206: 81 e6 ff 0f              and si, 0xfff
0020A: 81 e7 ff 0f              and di, 0xfff
0020E: 06                       push es
0020F: 57                       push di
00210: c4 3e 6c 23              les di, ptr [0x236c]
00214: aa                       stosb byte ptr es:[di], al
00215: 89 3e 6c 23              mov word ptr [0x236c], di
00219: 5f                       pop di
0021A: 07                       pop es
0021B: e2 df                    loop 0x1fc
0021D: a1 02 00                 mov ax, word ptr [2]
00220: 0b c0                    or ax, ax
00222: 78 08                    js 0x22c

; basic_block_001BD
001BD: 5f                       pop di
001BE: 06                       push es
001BF: 57                       push di
001C0: c4 3e 6c 23              les di, ptr [0x236c]
001C4: aa                       stosb byte ptr es:[di], al
001C5: 89 3e 6c 23              mov word ptr [0x236c], di
001C9: 5f                       pop di
001CA: 07                       pop es
001CB: 88 85 2f 11              mov byte ptr [di + 0x112f], al
001CF: 47                       inc di
001D0: 81 e7 ff 0f              and di, 0xfff
001D4: 83 2e 00 00 01           sub word ptr [0], 1
001D9: 83 1e 02 00 00           sbb word ptr [2], 0
001DE: eb 3d                    jmp 0x21d

; basic_block_0022C
0022C: 5d                       pop bp
0022D: 5f                       pop di
0022E: 5e                       pop si
0022F: c3                       ret

; basic_block_0610D

; basic_block_06110
06110: 4d                       dec bp
06111: 75 e6                    jne 0x60f9

; basic_block_05904
05904: e8 a3 00                 call 0x59aa
05907: 80 3e 5b 8f 00           cmp byte ptr [0x8f5b], 0
0590C: 75 08                    jne 0x5916

; basic_block_05B98

; basic_block_05C7C
05C7C: a1 b0 91                 mov ax, word ptr [0x91b0]
05C7F: 04 30                    add al, 0x30
05C81: a2 fb 33                 mov byte ptr [0x33fb], al
05C84: be f3 33                 mov si, 0x33f3
05C87: e8 f9 ae                 call 0xb83
05C8A: c3                       ret

; basic_block_05B9B

; basic_block_05B9E

; basic_block_05BA1

; basic_block_05BC0
05BC0: f6 06 59 8f 02           test byte ptr [0x8f59], 2
05BC5: 74 1d                    je 0x5be4

; basic_block_05BA8
05BA8: c6 06 59 8f 00           mov byte ptr [0x8f59], 0
05BAD: c7 06 88 8e 08 00        mov word ptr [0x8e88], 8
05BB3: 58                       pop ax
05BB4: 48                       dec ax
05BB5: 50                       push ax
05BB6: 79 86                    jns 0x5b3e

; basic_block_05E38

; basic_block_05E3B

; basic_block_05E46

; basic_block_05E4E

; basic_block_05E51

; basic_block_0106D
0106D: e8 6c f7                 call 0x7dc
01070: eb c2                    jmp 0x1034

; basic_block_0104C
0104C: 83 3c 0c                 cmp word ptr [si], 0xc
0104F: 74 1c                    je 0x106d

; basic_block_02BE6

; basic_block_02BEC

; basic_block_007C0
007C0: c7 04 04 00              mov word ptr [si], 4
007C4: c7 44 02 2b 0f           mov word ptr [si + 2], 0xf2b
007C9: c7 44 04 61 07           mov word ptr [si + 4], 0x761
007CE: c7 44 06 61 07           mov word ptr [si + 6], 0x761
007D3: c6 44 26 00              mov byte ptr [si + 0x26], 0
007D7: c6 44 4a 00              mov byte ptr [si + 0x4a], 0
007DB: c3                       ret

; basic_block_02BDB

; basic_block_03609
03609: 89 44 02                 mov word ptr [si + 2], ax
0360C: 83 c6 04                 add si, 4
0360F: 83 c7 04                 add di, 4
03612: e2 e7                    loop 0x35fb

; basic_block_03603
03603: 8b 5d 02                 mov bx, word ptr [di + 2]
03606: 8b 47 34                 mov ax, word ptr [bx + 0x34]

; basic_block_03754
03754: e8 32 df                 call 0x1689
03757: 8b f7                    mov si, di
03759: eb e8                    jmp 0x3743

; basic_block_0374E
0374E: 3d 54 00                 cmp ax, 0x54
03751: 74 01                    je 0x3754

; basic_block_0370A
0370A: c3                       ret

; basic_block_03701
03701: ff 74 0a                 push word ptr [si + 0xa]
03704: ff 54 02                 call word ptr [si + 2]
03707: 5e                       pop si
03708: eb f2                    jmp 0x36fc

; basic_block_03719
03719: c3                       ret

; basic_block_03710
03710: ff 74 0a                 push word ptr [si + 0xa]
03713: ff 54 04                 call word ptr [si + 4]
03716: 5e                       pop si
03717: eb f2                    jmp 0x370b

; basic_block_036F2
036F2: c7 04 00 00              mov word ptr [si], 0

; basic_block_036E8
036E8: 3b 45 36                 cmp ax, word ptr [di + 0x36]
036EB: 74 09                    je 0x36f6

; basic_block_0469B
0469B: 83 3e 50 91 00           cmp word ptr [0x9150], 0
046A0: 74 14                    je 0x46b6

; basic_block_04697
04697: ff 06 1e 99              inc word ptr [0x991e]

; basic_block_04683
04683: 83 3e 1e 99 00           cmp word ptr [0x991e], 0
04688: 74 11                    je 0x469b

; basic_block_03681
03681: c3                       ret

; basic_block_03647
03647: 89 0e 92 91              mov word ptr [0x9192], cx
0364B: be 9e da                 mov si, 0xda9e
0364E: 8b 1e 94 91              mov bx, word ptr [0x9194]
03652: 8b 0e 90 91              mov cx, word ptr [0x9190]
03656: 8b 04                    mov ax, word ptr [si]
03658: 85 c0                    test ax, ax
0365A: 78 1d                    js 0x3679

; basic_block_0363E
0363E: 83 c6 0e                 add si, 0xe
03641: eb dd                    jmp 0x3620

; basic_block_0362A
0362A: 3b c8                    cmp cx, ax
0362C: 7f 10                    jg 0x363e

; basic_block_03D81

; basic_block_03E46
03E46: c7 06 a0 91 00 00        mov word ptr [0x91a0], 0
03E4C: a1 96 91                 mov ax, word ptr [0x9196]
03E4F: a3 e6 fc                 mov word ptr [0xfce6], ax
03E52: a1 8e 91                 mov ax, word ptr [0x918e]
03E55: a3 ea fc                 mov word ptr [0xfcea], ax
03E58: a1 90 91                 mov ax, word ptr [0x9190]
03E5B: a3 ee fc                 mov word ptr [0xfcee], ax
03E5E: a1 e2 fc                 mov ax, word ptr [0xfce2]
03E61: 29 06 ee fc              sub word ptr [0xfcee], ax
03E65: a1 a8 91                 mov ax, word ptr [0x91a8]
03E68: 39 06 ee fc              cmp word ptr [0xfcee], ax
03E6C: 7d 14                    jge 0x3e82

; basic_block_03E2F
03E2F: ff 06 a0 91              inc word ptr [0x91a0]
03E33: 83 3e a0 91 23           cmp word ptr [0x91a0], 0x23
03E38: 7c 12                    jl 0x3e4c

; basic_block_0064A
0064A: c7 06 44 30 05 00        mov word ptr [0x3044], 5
00650: eb b3                    jmp 0x605

; basic_block_0062F
0062F: eb d7                    jmp 0x608

; basic_block_002B5

; basic_block_002BD
002BD: aa                       stosb byte ptr es:[di], al
002BE: fe c0                    inc al
002C0: 75 fb                    jne 0x2bd

; basic_block_002F4
002F4: 74 1c                    je 0x312

; basic_block_0034C
0034C: e8 8e 00                 call 0x3dd
0034F: 8b f0                    mov si, ax
00351: 8a 94 72 23              mov dl, byte ptr [si + 0x2372]
00355: b6 00                    mov dh, 0
00357: b1 06                    mov cl, 6
00359: d3 e2                    shl dx, cl
0035B: 52                       push dx
0035C: 8a 8c 72 24              mov cl, byte ptr [si + 0x2472]
00360: b5 00                    mov ch, 0
00362: 83 e9 02                 sub cx, 2
00365: e8 95 00                 call 0x3fd
00368: 0b c6                    or ax, si
0036A: d3 c0                    rol ax, cl
0036C: 25 3f 00                 and ax, 0x3f
0036F: 5a                       pop dx
00370: 03 c2                    add ax, dx
00372: c3                       ret

; basic_block_001E3

; basic_block_00224
00224: 0b 06 00 00              or ax, word ptr [0]
00228: 74 02                    je 0x22c

; basic_block_0021D

; basic_block_060F9

; basic_block_06113
06113: ec                       in al, dx

; basic_block_059AA
059AA: b8 0c 00                 mov ax, 0xc
059AD: be 2b 35                 mov si, 0x352b
059B0: b9 01 00                 mov cx, 1
059B3: e8 a7 ff                 call 0x595d
059B6: b9 55 00                 mov cx, 0x55
059B9: 51                       push cx
059BA: e8 82 b1                 call 0xb3f
059BD: 59                       pop cx
059BE: 80 3e 5b 8f 00           cmp byte ptr [0x8f5b], 0
059C3: 75 02                    jne 0x59c7

; basic_block_05907

; basic_block_0590E
0590E: c7 06 54 37 25 36        mov word ptr [0x3754], 0x3625
05914: eb 8b                    jmp 0x58a1

; basic_block_00B83
00B83: 8b 2e 44 30              mov bp, word ptr [0x3044]
00B87: d1 e5                    shl bp, 1
00B89: d1 e5                    shl bp, 1
00B8B: 2e ff 9e 91 0b           lcall cs:[bp + 0xb91]
00B90: c3                       ret

; basic_block_05C8A

; basic_block_05BE4
05BE4: 80 3e 5b 8f 00           cmp byte ptr [0x8f5b], 0
05BE9: 75 03                    jne 0x5bee

; basic_block_05BC7
05BC7: c6 06 59 8f 00           mov byte ptr [0x8f59], 0
05BCC: c7 06 88 8e 08 00        mov word ptr [0x8e88], 8
05BD2: 58                       pop ax
05BD3: 40                       inc ax
05BD4: 50                       push ax
05BD5: 3d 03 00                 cmp ax, 3
05BD8: 7d 03                    jge 0x5bdd

; basic_block_05B3E

; basic_block_05BB8
05BB8: 58                       pop ax
05BB9: b8 02 00                 mov ax, 2
05BBC: 50                       push ax
05BBD: e9 7e ff                 jmp 0x5b3e

; basic_block_007DC
007DC: 57                       push di
007DD: 53                       push bx
007DE: 8b 7c 08                 mov di, word ptr [si + 8]
007E1: 8b 5c 0a                 mov bx, word ptr [si + 0xa]
007E4: 89 5d 0a                 mov word ptr [di + 0xa], bx
007E7: 89 7f 08                 mov word ptr [bx + 8], di
007EA: 5b                       pop bx
007EB: 5f                       pop di
007EC: c3                       ret

; basic_block_01070

; basic_block_01034

; basic_block_01051
01051: 83 3c 10                 cmp word ptr [si], 0x10
01054: 74 17                    je 0x106d

; basic_block_01689
01689: 8b 7c 0a                 mov di, word ptr [si + 0xa]
0168C: 80 7c 26 00              cmp byte ptr [si + 0x26], 0
01690: 74 16                    je 0x16a8

; basic_block_03757

; basic_block_03743

; basic_block_03753
03753: 41                       inc cx

; basic_block_03707

; basic_block_03716

; basic_block_036ED
036ED: 8b 7d 0a                 mov di, word ptr [di + 0xa]
036F0: eb f1                    jmp 0x36e3

; basic_block_046B6
046B6: 83 3e 84 8e 00           cmp word ptr [0x8e84], 0
046BB: 74 27                    je 0x46e4

; basic_block_046A2
046A2: ff 0e 50 91              dec word ptr [0x9150]
046A6: ba dd 00                 mov dx, 0xdd
046A9: 8b 0e 50 91              mov cx, word ptr [0x9150]
046AD: b8 26 01                 mov ax, 0x126
046B0: bb 08 00                 mov bx, 8
046B3: e8 a6 ff                 call 0x465c

; basic_block_0468A
0468A: ff 0e 1e 99              dec word ptr [0x991e]
0468E: eb 0b                    jmp 0x469b

; basic_block_03679
03679: 3b cb                    cmp cx, bx
0367B: 7d 04                    jge 0x3681

; basic_block_0365C
0365C: 3b d8                    cmp bx, ax
0365E: 7e 14                    jle 0x3674

; basic_block_03620

; basic_block_0362E
0362E: 8b 5c 02                 mov bx, word ptr [si + 2]
03631: 56                       push si
03632: e8 7f d9                 call 0xfb4
03635: 5e                       pop si
03636: 8b 1e 92 91              mov bx, word ptr [0x9192]
0363A: 8b 0e 90 91              mov cx, word ptr [0x9190]

; basic_block_03E82
03E82: a1 aa 91                 mov ax, word ptr [0x91aa]
03E85: 39 06 ee fc              cmp word ptr [0xfcee], ax
03E89: 7e 14                    jle 0x3e9f

; basic_block_03E6E
03E6E: a1 a8 91                 mov ax, word ptr [0x91a8]
03E71: 29 06 ee fc              sub word ptr [0xfcee], ax
03E75: a1 ee fc                 mov ax, word ptr [0xfcee]
03E78: 01 06 e2 fc              add word ptr [0xfce2], ax
03E7C: a1 a8 91                 mov ax, word ptr [0x91a8]
03E7F: a3 ee fc                 mov word ptr [0xfcee], ax

; basic_block_03E4C

; basic_block_03E3A
03E3A: d1 26 e2 fc              shl word ptr [0xfce2], 1
03E3E: a1 e2 fc                 mov ax, word ptr [0xfce2]
03E41: a3 9a 91                 mov word ptr [0x919a], ax
03E44: eb 06                    jmp 0x3e4c

; basic_block_002C2
002C2: fe c8                    dec al
002C4: aa                       stosb byte ptr es:[di], al
002C5: 75 fb                    jne 0x2c2

; basic_block_00312
00312: 56                       push si
00313: 8b 36 6a 21              mov si, word ptr [0x216a]
00317: 81 fe 6c 23              cmp si, 0x236c
0031B: 7c 06                    jl 0x323

; basic_block_002F6
002F6: 81 fe e6 04              cmp si, 0x4e6
002FA: 72 ea                    jb 0x2e6

; basic_block_003DD
003DD: 8b 16 2c 11              mov dx, word ptr [0x112c]
003E1: 80 3e 2e 11 08           cmp byte ptr [0x112e], 8
003E6: 7f 03                    jg 0x3eb

; basic_block_0034F

; basic_block_003FD
003FD: 51                       push cx
003FE: 8b 16 2c 11              mov dx, word ptr [0x112c]
00402: 80 3e 2e 11 08           cmp byte ptr [0x112e], 8
00407: 7f 03                    jg 0x40c

; basic_block_00368

; basic_block_0022A
0022A: eb 86                    jmp 0x1b2

; basic_block_059B6

; basic_block_00B3F
00B3F: 8b 2e 44 30              mov bp, word ptr [0x3044]
00B43: d1 e5                    shl bp, 1
00B45: d1 e5                    shl bp, 1
00B47: 2e ff 9e 4d 0b           lcall cs:[bp + 0xb4d]
00B4C: c3                       ret

; basic_block_059BD

; basic_block_059C7
059C7: c3                       ret

; basic_block_059C5
059C5: e2 f2                    loop 0x59b9

; basic_block_00B90

; basic_block_05BEE
05BEE: c6 06 5b 8f 00           mov byte ptr [0x8f5b], 0
05BF3: c7 06 88 8e 09 00        mov word ptr [0x8e88], 9
05BF9: 58                       pop ax
05BFA: 50                       push ax
05BFB: 3d 02 00                 cmp ax, 2
05BFE: 75 07                    jne 0x5c07

; basic_block_05BEB
05BEB: e9 50 ff                 jmp 0x5b3e

; basic_block_05BDD
05BDD: 58                       pop ax
05BDE: 33 c0                    xor ax, ax
05BE0: 50                       push ax
05BE1: e9 5a ff                 jmp 0x5b3e

; basic_block_05BDA
05BDA: e9 61 ff                 jmp 0x5b3e

; basic_block_01056
01056: 83 3c 00                 cmp word ptr [si], 0
01059: 75 e9                    jne 0x1044

; basic_block_016A8
016A8: c3                       ret

; basic_block_01692
01692: 8b 7c 44                 mov di, word ptr [si + 0x44]
01695: 8b 7d 0a                 mov di, word ptr [di + 0xa]
01698: 83 3d 00                 cmp word ptr [di], 0
0169B: 74 0b                    je 0x16a8

; basic_block_036E3

; basic_block_046E4
046E4: 83 3e 62 91 00           cmp word ptr [0x9162], 0
046E9: 74 1e                    je 0x4709

; basic_block_046BD
046BD: ff 0e 84 8e              dec word ptr [0x8e84]
046C1: ba 88 00                 mov dx, 0x88
046C4: 8b 0e 84 8e              mov cx, word ptr [0x8e84]
046C8: b8 98 00                 mov ax, 0x98
046CB: bb 08 00                 mov bx, 8
046CE: e8 8b ff                 call 0x465c
046D1: 83 3e 84 8e 00           cmp word ptr [0x8e84], 0
046D6: 75 0c                    jne 0x46e4

; basic_block_0465C
0465C: 42                       inc dx
0465D: 50                       push ax
0465E: 52                       push dx
0465F: b8 0a 00                 mov ax, 0xa
04662: f7 e1                    mul cx
04664: 59                       pop cx
04665: f7 f1                    div cx
04667: 8b f0                    mov si, ax
04669: d1 e6                    shl si, 1
0466B: 8b b4 62 32              mov si, word ptr [si + 0x3262]
0466F: 59                       pop cx
04670: 8b d3                    mov dx, bx
04672: e9 00 c2                 jmp 0x875

; basic_block_0367D
0367D: 89 0e 94 91              mov word ptr [0x9194], cx

; basic_block_03674
03674: 83 c6 0e                 add si, 0xe
03677: eb dd                    jmp 0x3656

; basic_block_03660
03660: 3b c8                    cmp cx, ax
03662: 7f 10                    jg 0x3674

; basic_block_00FB4
00FB4: 89 1e 74 8e              mov word ptr [0x8e74], bx
00FB8: 8b 1e 1c 99              mov bx, word ptr [0x991c]
00FBC: d1 e3                    shl bx, 1
00FBE: 2e ff b7 c6 0f           push word ptr cs:[bx + 0xfc6]
00FC3: 8b 1e 74 8e              mov bx, word ptr [0x8e74]
00FC7: c3                       ret

; basic_block_03635

; basic_block_03E9F
03E9F: a1 e2 fc                 mov ax, word ptr [0xfce2]
03EA2: 29 06 e6 fc              sub word ptr [0xfce6], ax
03EA6: 78 13                    js 0x3ebb

; basic_block_03E8B
03E8B: a1 ee fc                 mov ax, word ptr [0xfcee]
03E8E: 01 06 e2 fc              add word ptr [0xfce2], ax
03E92: a1 aa 91                 mov ax, word ptr [0x91aa]
03E95: 29 06 e2 fc              sub word ptr [0xfce2], ax
03E99: a1 aa 91                 mov ax, word ptr [0x91aa]
03E9C: a3 ee fc                 mov word ptr [0xfcee], ax

; basic_block_002C7
002C7: b9 80 00                 mov cx, 0x80
002CA: f3 aa                    rep stosb byte ptr es:[di], al
002CC: b9 80 00                 mov cx, 0x80
002CF: b0 20                    mov al, 0x20
002D1: f3 aa                    rep stosb byte ptr es:[di], al
002D3: c3                       ret

; basic_block_00323
00323: ac                       lodsb al, byte ptr [si]
00324: 32 e4                    xor ah, ah
00326: 89 36 6a 21              mov word ptr [0x216a], si
0032A: 5e                       pop si
0032B: 8a f0                    mov dh, al
0032D: 56                       push si
0032E: 8b 36 6a 21              mov si, word ptr [0x216a]
00332: 81 fe 6c 23              cmp si, 0x236c
00336: 7c 06                    jl 0x33e

; basic_block_0031D
0031D: e8 54 fe                 call 0x174
00320: be 6c 21                 mov si, 0x216c

; basic_block_002E6
002E6: d1 ee                    shr si, 1
002E8: d1 e2                    shl dx, 1
002EA: 83 d6 00                 adc si, 0
002ED: d1 e6                    shl si, 1
002EF: 8b b4 46 0c              mov si, word ptr [si + 0xc46]
002F3: 49                       dec cx

; basic_block_002FC
002FC: 89 16 2c 11              mov word ptr [0x112c], dx
00300: 88 0e 2e 11              mov byte ptr [0x112e], cl
00304: 81 ee e6 04              sub si, 0x4e6
00308: 8b d6                    mov dx, si
0030A: e8 66 00                 call 0x373
0030D: 8b c2                    mov ax, dx
0030F: d1 e8                    shr ax, 1
00311: c3                       ret

; basic_block_003EB
003EB: 86 d6                    xchg dh, dl
003ED: 8b c2                    mov ax, dx
003EF: 32 d2                    xor dl, dl
003F1: 89 16 2c 11              mov word ptr [0x112c], dx
003F5: 80 2e 2e 11 08           sub byte ptr [0x112e], 8
003FA: 32 e4                    xor ah, ah
003FC: c3                       ret

; basic_block_003E8
003E8: e8 de 00                 call 0x4c9

; basic_block_0040C
0040C: 59                       pop cx
0040D: 8b c2                    mov ax, dx
0040F: d3 e2                    shl dx, cl
00411: 89 16 2c 11              mov word ptr [0x112c], dx
00415: 28 0e 2e 11              sub byte ptr [0x112e], cl
00419: ba ff ff                 mov dx, 0xffff
0041C: d3 ea                    shr dx, cl
0041E: f7 d2                    not dx
00420: 23 c2                    and ax, dx
00422: c3                       ret

; basic_block_00409
00409: e8 bd 00                 call 0x4c9

; basic_block_001B2

; basic_block_00B4C

; basic_block_05C07
05C07: 58                       pop ax
05C08: 40                       inc ax
05C09: a3 70 8e                 mov word ptr [0x8e70], ax
05C0C: e9 41 fd                 jmp 0x5950

; basic_block_05C00
05C00: f6 16 54 8f              not byte ptr [0x8f54]
05C04: e9 37 ff                 jmp 0x5b3e

; basic_block_01044

; basic_block_0105B
0105B: 8b 36 a0 90              mov si, word ptr [0x90a0]
0105F: 83 3c 00                 cmp word ptr [si], 0
01062: 75 09                    jne 0x106d

; basic_block_0169D
0169D: 80 7d 26 00              cmp byte ptr [di + 0x26], 0
016A1: 74 05                    je 0x16a8

; basic_block_04709
04709: f6 06 59 8f 80           test byte ptr [0x8f59], 0x80
0470E: 75 07                    jne 0x4717

; basic_block_046EB
046EB: ff 0e 62 91              dec word ptr [0x9162]
046EF: ba aa 00                 mov dx, 0xaa
046F2: 8b 0e 62 91              mov cx, word ptr [0x9162]
046F6: b8 98 00                 mov ax, 0x98
046F9: bb a0 00                 mov bx, 0xa0
046FC: e8 5d ff                 call 0x465c
046FF: 83 3e 62 91 00           cmp word ptr [0x9162], 0
04704: 75 03                    jne 0x4709

; basic_block_046D1

; basic_block_046D8
046D8: c7 06 82 8e ff ff        mov word ptr [0x8e82], 0xffff
046DE: c7 06 88 8e 18 00        mov word ptr [0x8e88], 0x18

; basic_block_00875
00875: 8b 2e 44 30              mov bp, word ptr [0x3044]
00879: d1 e5                    shl bp, 1
0087B: d1 e5                    shl bp, 1
0087D: 2e ff 9e 83 08           lcall cs:[bp + 0x883]
00882: c3                       ret

; basic_block_03656

; basic_block_03664
03664: 8b 5c 02                 mov bx, word ptr [si + 2]
03667: 56                       push si
03668: e8 67 d9                 call 0xfd2
0366B: 5e                       pop si
0366C: 8b 1e 94 91              mov bx, word ptr [0x9194]
03670: 8b 0e 90 91              mov cx, word ptr [0x9190]

; basic_block_03EBB
03EBB: 83 06 e6 fc 10           add word ptr [0xfce6], 0x10
03EC0: 83 2e ea fc 28           sub word ptr [0xfcea], 0x28
03EC5: a1 e2 fc                 mov ax, word ptr [0xfce2]
03EC8: a3 98 91                 mov word ptr [0x9198], ax
03ECB: a1 e6 fc                 mov ax, word ptr [0xfce6]
03ECE: a3 96 91                 mov word ptr [0x9196], ax
03ED1: a1 ea fc                 mov ax, word ptr [0xfcea]
03ED4: a3 8e 91                 mov word ptr [0x918e], ax
03ED7: a1 ee fc                 mov ax, word ptr [0xfcee]
03EDA: a3 90 91                 mov word ptr [0x9190], ax
03EDD: a1 aa 91                 mov ax, word ptr [0x91aa]
03EE0: 39 06 fe fc              cmp word ptr [0xfcfe], ax
03EE4: 75 07                    jne 0x3eed

; basic_block_03EA8
03EA8: 83 3e e6 fc 10           cmp word ptr [0xfce6], 0x10
03EAD: 7c 16                    jl 0x3ec5

; basic_block_0033E
0033E: ac                       lodsb al, byte ptr [si]
0033F: 32 e4                    xor ah, ah
00341: 89 36 6a 21              mov word ptr [0x216a], si
00345: 5e                       pop si
00346: 8a d0                    mov dl, al
00348: b1 10                    mov cl, 0x10
0034A: eb aa                    jmp 0x2f6

; basic_block_00338
00338: e8 39 fe                 call 0x174
0033B: be 6c 21                 mov si, 0x216c

; basic_block_00174
00174: 57                       push di
00175: 53                       push bx
00176: 51                       push cx
00177: 52                       push dx
00178: 33 c0                    xor ax, ax
0017A: bf 6c 21                 mov di, 0x216c
0017D: b9 00 01                 mov cx, 0x100
00180: f3 ab                    rep stosw word ptr es:[di], ax
00182: 8b 1e 70 23              mov bx, word ptr [0x2370]
00186: b9 00 02                 mov cx, 0x200
00189: ba 6c 21                 mov dx, 0x216c
0018C: b4 3f                    mov ah, 0x3f
0018E: cd 21                    int 0x21
00190: 73 03                    jae 0x195

; basic_block_00320

; basic_block_00373
00373: 81 3e e8 04 00 80        cmp word ptr [0x4e8], 0x8000
00379: 72 03                    jb 0x37e

; basic_block_0030D

; basic_block_004C9
004C9: 56                       push si
004CA: 8b 36 6a 21              mov si, word ptr [0x216a]
004CE: 81 fe 6c 23              cmp si, 0x236c
004D2: 7c 06                    jl 0x4da

; basic_block_01064
01064: 8b 36 ec 90              mov si, word ptr [0x90ec]
01068: 83 3c 00                 cmp word ptr [si], 0
0106B: 74 05                    je 0x1072

; basic_block_016A3
016A3: 3b 75 44                 cmp si, word ptr [di + 0x44]
016A6: 74 ed                    je 0x1695

; basic_block_04717
04717: a1 32 91                 mov ax, word ptr [0x9132]
0471A: 29 06 2e 91              sub word ptr [0x912e], ax
0471E: 7f 0c                    jg 0x472c

; basic_block_04710
04710: a1 30 91                 mov ax, word ptr [0x9130]
04713: a3 2e 91                 mov word ptr [0x912e], ax
04716: c3                       ret

; basic_block_046FF

; basic_block_04706
04706: e8 24 00                 call 0x472d

; basic_block_00882

; basic_block_00FD2
00FD2: 89 1e 74 8e              mov word ptr [0x8e74], bx
00FD6: 8b 1e 1c 99              mov bx, word ptr [0x991c]
00FDA: d1 e3                    shl bx, 1
00FDC: 2e ff b7 e4 0f           push word ptr cs:[bx + 0xfe4]
00FE1: 8b 1e 74 8e              mov bx, word ptr [0x8e74]
00FE5: c3                       ret

; basic_block_0366B

; basic_block_03EED
03EED: a1 ae 91                 mov ax, word ptr [0x91ae]
03EF0: 01 06 ee fc              add word ptr [0xfcee], ax
03EF4: a1 aa 91                 mov ax, word ptr [0x91aa]
03EF7: 39 06 ee fc              cmp word ptr [0xfcee], ax
03EFB: 7f 06                    jg 0x3f03

; basic_block_03EE6
03EE6: f6 06 59 8f 02           test byte ptr [0x8f59], 2
03EEB: 75 07                    jne 0x3ef4

; basic_block_03EC5

; basic_block_03EAF
03EAF: 83 2e e6 fc 10           sub word ptr [0xfce6], 0x10
03EB4: 83 06 ea fc 28           add word ptr [0xfcea], 0x28
03EB9: eb 0a                    jmp 0x3ec5

; basic_block_0033B

; basic_block_00195
00195: 5a                       pop dx
00196: 59                       pop cx
00197: 5b                       pop bx
00198: 5f                       pop di
00199: c3                       ret

; basic_block_00192
00192: e9 6f 5c                 jmp 0x5e04

; basic_block_0037E
0037E: 8b b4 d2 09              mov si, word ptr [si + 0x9d2]
00382: 8b 84 04 00              mov ax, word ptr [si + 4]
00386: 40                       inc ax
00387: 89 84 04 00              mov word ptr [si + 4], ax
0038B: 8d 7c 02                 lea di, [si + 2]
0038E: 3b 85 04 00              cmp ax, word ptr [di + 4]
00392: 77 02                    ja 0x396

; basic_block_0037B
0037B: e8 a5 00                 call 0x423

; basic_block_004DA
004DA: ac                       lodsb al, byte ptr [si]
004DB: 32 e4                    xor ah, ah
004DD: 89 36 6a 21              mov word ptr [0x216a], si
004E1: 5e                       pop si
004E2: b1 08                    mov cl, 8
004E4: 2a 0e 2e 11              sub cl, byte ptr [0x112e]
004E8: d3 e0                    shl ax, cl
004EA: 0b d0                    or dx, ax
004EC: 80 06 2e 11 08           add byte ptr [0x112e], 8
004F1: c3                       ret

; basic_block_004D4
004D4: e8 9d fc                 call 0x174
004D7: be 6c 21                 mov si, 0x216c

; basic_block_01072
01072: 8b 36 54 90              mov si, word ptr [0x9054]
01076: 81 3c c8 00              cmp word ptr [si], 0xc8
0107A: 7d f1                    jge 0x106d

; basic_block_01695

; basic_block_0472C
0472C: c3                       ret

; basic_block_04720
04720: a1 30 91                 mov ax, word ptr [0x9130]
04723: 01 06 2e 91              add word ptr [0x912e], ax
04727: c6 06 5b 8f ff           mov byte ptr [0x8f5b], 0xff

; basic_block_0472D
0472D: 56                       push si
0472E: 8b 36 08 90              mov si, word ptr [0x9008]
04732: 83 3c 00                 cmp word ptr [si], 0
04735: 74 09                    je 0x4740

; basic_block_03F03
03F03: e8 29 cb                 call 0xa2f
03F06: e8 78 ce                 call 0xd81
03F09: 80 3e 5c 8f 00           cmp byte ptr [0x8f5c], 0
03F0E: 75 03                    jne 0x3f13

; basic_block_03EFD
03EFD: a1 ee fc                 mov ax, word ptr [0xfcee]
03F00: a3 aa 91                 mov word ptr [0x91aa], ax

; basic_block_03EF4

; basic_block_00396
00396: 47                       inc di
00397: 47                       inc di
00398: 3b 85 04 00              cmp ax, word ptr [di + 4]
0039C: 77 f8                    ja 0x396

; basic_block_00394
00394: eb 3c                    jmp 0x3d2

; basic_block_00423
00423: 56                       push si
00424: 8c d8                    mov ax, ds
00426: 8e c0                    mov es, ax
00428: 33 f6                    xor si, si
0042A: 8b fe                    mov di, si
0042C: 81 bc 46 0c e6 04        cmp word ptr [si + 0xc46], 0x4e6
00432: 72 15                    jb 0x449

; basic_block_004D7

; basic_block_0107C
0107C: 83 3c 04                 cmp word ptr [si], 4
0107F: 74 ec                    je 0x106d

; basic_block_04740
04740: a1 b4 91                 mov ax, word ptr [0x91b4]
04743: a3 08 90                 mov word ptr [0x9008], ax
04746: a1 b6 91                 mov ax, word ptr [0x91b6]
04749: a3 06 90                 mov word ptr [0x9006], ax
0474C: be b8 91                 mov si, 0x91b8
0474F: bf 34 91                 mov di, 0x9134
04752: b9 0e 00                 mov cx, 0xe
04755: f3 a5                    rep movsw word ptr es:[di], word ptr [si]
04757: 5e                       pop si
04758: c3                       ret

; basic_block_04737
04737: ff 74 0a                 push word ptr [si + 0xa]
0473A: e8 6c f0                 call 0x37a9
0473D: 5e                       pop si
0473E: eb f2                    jmp 0x4732

; basic_block_03F06

; basic_block_03F09

; basic_block_03F13
03F13: c6 06 5c 8f 00           mov byte ptr [0x8f5c], 0
03F18: c7 06 32 91 01 00        mov word ptr [0x9132], 1
03F1E: c7 06 86 91 27 00        mov word ptr [0x9186], 0x27
03F24: c6 06 af 8f ff           mov byte ptr [0x8faf], 0xff
03F29: ff 0e 8a 91              dec word ptr [0x918a]
03F2D: e8 61 cf                 call 0xe91
03F30: 83 3e 8a 91 00           cmp word ptr [0x918a], 0
03F35: 75 63                    jne 0x3f9a

; basic_block_03F10
03F10: e9 97 00                 jmp 0x3faa

; basic_block_0039E
0039E: 4f                       dec di
0039F: 4f                       dec di
003A0: 87 85 04 00              xchg word ptr [di + 4], ax
003A4: 89 84 04 00              mov word ptr [si + 4], ax
003A8: 8b 9c 46 0c              mov bx, word ptr [si + 0xc46]
003AC: 89 bf ec 04              mov word ptr [bx + 0x4ec], di
003B0: 81 fb e6 04              cmp bx, 0x4e6
003B4: 73 04                    jae 0x3ba

; basic_block_003D2
003D2: 8b b4 ec 04              mov si, word ptr [si + 0x4ec]
003D6: 0b f6                    or si, si
003D8: 74 02                    je 0x3dc

; basic_block_00449
00449: 46                       inc si
0044A: 46                       inc si
0044B: 81 fe e6 04              cmp si, 0x4e6
0044F: 72 db                    jb 0x42c

; basic_block_00434
00434: 8b 84 04 00              mov ax, word ptr [si + 4]
00438: 40                       inc ax
00439: d1 e8                    shr ax, 1
0043B: 89 85 04 00              mov word ptr [di + 4], ax
0043F: 8b 84 46 0c              mov ax, word ptr [si + 0xc46]
00443: 89 85 46 0c              mov word ptr [di + 0xc46], ax
00447: 47                       inc di
00448: 47                       inc di

; basic_block_01081
01081: 8b 74 0a                 mov si, word ptr [si + 0xa]
01084: 83 3c 00                 cmp word ptr [si], 0
01087: 75 ed                    jne 0x1076

; basic_block_037A9
037A9: 57                       push di
037AA: 83 3c 34                 cmp word ptr [si], 0x34
037AD: 75 0f                    jne 0x37be

; basic_block_0473D

; basic_block_04732

; basic_block_03F30

; basic_block_03F9A
03F9A: e8 c5 da                 call 0x1a62
03F9D: 80 3e 54 8f 00           cmp byte ptr [0x8f54], 0
03FA2: 74 06                    je 0x3faa

; basic_block_03F37
03F37: e8 25 ce                 call 0xd5f
03F3A: e8 8b 1a                 call 0x59c8
03F3D: e8 1f ce                 call 0xd5f
03F40: ff 0e b0 91              dec word ptr [0x91b0]
03F44: 74 35                    je 0x3f7b

; basic_block_03FAA
03FAA: 83 3e 64 91 00           cmp word ptr [0x9164], 0
03FAF: 74 03                    je 0x3fb4

; basic_block_003BA
003BA: 87 9d 46 0c              xchg word ptr [di + 0xc46], bx
003BE: 89 b7 ec 04              mov word ptr [bx + 0x4ec], si
003C2: 81 fb e6 04              cmp bx, 0x4e6
003C6: 73 04                    jae 0x3cc

; basic_block_003B6
003B6: 89 bf ee 04              mov word ptr [bx + 0x4ee], di

; basic_block_003DC
003DC: c3                       ret

; basic_block_003DA
003DA: eb a6                    jmp 0x382

; basic_block_0042C

; basic_block_00451
00451: 33 f6                    xor si, si
00453: bf 74 02                 mov di, 0x274
00456: 8b de                    mov bx, si
00458: 43                       inc bx
00459: 43                       inc bx
0045A: 8b 84 04 00              mov ax, word ptr [si + 4]
0045E: 03 87 04 00              add ax, word ptr [bx + 4]
00462: 89 85 04 00              mov word ptr [di + 4], ax
00466: 8b df                    mov bx, di
00468: 4b                       dec bx
00469: 4b                       dec bx
0046A: 3b 87 04 00              cmp ax, word ptr [bx + 4]
0046E: 72 f8                    jb 0x468

; basic_block_01076

; basic_block_01089
01089: 8b 36 54 90              mov si, word ptr [0x9054]
0108D: eb de                    jmp 0x106d

; basic_block_037BE
037BE: 8b 7c 06                 mov di, word ptr [si + 6]
037C1: c7 05 00 00              mov word ptr [di], 0
037C5: e8 d8 cf                 call 0x7a0
037C8: 5f                       pop di
037C9: c3                       ret

; basic_block_037AF
037AF: e8 bd ff                 call 0x376f
037B2: 83 3d 00                 cmp word ptr [di], 0
037B5: 74 07                    je 0x37be

; basic_block_01A62
01A62: e8 90 fe                 call 0x18f5
01A65: 8b 1e 7a 8e              mov bx, word ptr [0x8e7a]
01A69: 80 bf 5d 8f 00           cmp byte ptr [bx - 0x70a3], 0
01A6E: 74 1e                    je 0x1a8e

; basic_block_03F9D

; basic_block_03FA4
03FA4: b4 02                    mov ah, 2
03FA6: b0 00                    mov al, 0
03FA8: cd 80                    int 0x80

; basic_block_03F3A

; basic_block_059C8
059C8: a1 52 91                 mov ax, word ptr [0x9152]
059CB: 8b 16 54 91              mov dx, word ptr [0x9154]
059CF: 3b 16 8d 35              cmp dx, word ptr [0x358d]
059D3: 7d 03                    jge 0x59d8

; basic_block_03F3D

; basic_block_03F40

; basic_block_03F7B
03F7B: be 29 37                 mov si, 0x3729
03F7E: b9 1e 00                 mov cx, 0x1e
03F81: e8 a2 19                 call 0x5926
03F84: 8b 1e 7a 8e              mov bx, word ptr [0x8e7a]
03F88: c6 87 5d 8f 00           mov byte ptr [bx - 0x70a3], 0
03F8D: 83 f3 01                 xor bx, 1
03F90: 80 bf 5d 8f 00           cmp byte ptr [bx - 0x70a3], 0
03F95: 75 03                    jne 0x3f9a

; basic_block_03F46
03F46: e8 c6 1c                 call 0x5c0f
03F49: 74 30                    je 0x3f7b

; basic_block_03FB4
03FB4: 80 3e b0 8f 00           cmp byte ptr [0x8fb0], 0
03FB9: 75 0d                    jne 0x3fc8

; basic_block_03FB1
03FB1: e9 72 fd                 jmp 0x3d26

; basic_block_003CC
003CC: 89 9c 46 0c              mov word ptr [si + 0xc46], bx
003D0: 8b f7                    mov si, di

; basic_block_003C8
003C8: 89 b7 ee 04              mov word ptr [bx + 0x4ee], si

; basic_block_00382

; basic_block_00468

; basic_block_00470
00470: 43                       inc bx
00471: 43                       inc bx
00472: 8b cf                    mov cx, di
00474: 2b cb                    sub cx, bx
00476: d1 e9                    shr cx, 1
00478: fd                       std
00479: 51                       push cx
0047A: 56                       push si
0047B: 57                       push di
0047C: 8d b5 04 00              lea si, [di + 4]
00480: 8b fe                    mov di, si
00482: 4e                       dec si
00483: 4e                       dec si
00484: f3 a5                    rep movsw word ptr es:[di], word ptr [si]
00486: 89 87 04 00              mov word ptr [bx + 4], ax
0048A: 5f                       pop di
0048B: 5e                       pop si
0048C: 59                       pop cx
0048D: 56                       push si
0048E: 57                       push di
0048F: 8d b5 46 0c              lea si, [di + 0xc46]
00493: 8b fe                    mov di, si
00495: 4e                       dec si
00496: 4e                       dec si
00497: f3 a5                    rep movsw word ptr es:[di], word ptr [si]
00499: 5f                       pop di
0049A: 5e                       pop si
0049B: 89 b7 46 0c              mov word ptr [bx + 0xc46], si
0049F: 83 c6 04                 add si, 4
004A2: 83 c7 02                 add di, 2
004A5: 81 ff e6 04              cmp di, 0x4e6
004A9: 72 ab                    jb 0x456

; basic_block_007A0
007A0: 57                       push di
007A1: 53                       push bx
007A2: 8b 7c 08                 mov di, word ptr [si + 8]
007A5: 8b 5c 0a                 mov bx, word ptr [si + 0xa]
007A8: 89 5d 0a                 mov word ptr [di + 0xa], bx
007AB: 89 7f 08                 mov word ptr [bx + 8], di
007AE: 8b 1e 7c 8e              mov bx, word ptr [0x8e7c]
007B2: 89 5c 08                 mov word ptr [si + 8], bx
007B5: 89 36 7c 8e              mov word ptr [0x8e7c], si
007B9: c7 04 00 00              mov word ptr [si], 0
007BD: 5b                       pop bx
007BE: 5f                       pop di
007BF: c3                       ret

; basic_block_037C8

; basic_block_0376F
0376F: 8b 3e a0 90              mov di, word ptr [0x90a0]
03773: 83 3d 00                 cmp word ptr [di], 0
03776: 74 0f                    je 0x3787

; basic_block_037B2

; basic_block_037B7
037B7: 56                       push si
037B8: 8b f7                    mov si, di
037BA: e8 e3 cf                 call 0x7a0
037BD: 5e                       pop si

; basic_block_018F5
018F5: b4 01                    mov ah, 1
018F7: cd 80                    int 0x80
018F9: 83 3e 62 91 00           cmp word ptr [0x9162], 0
018FE: 74 03                    je 0x1903

; basic_block_01A65

; basic_block_01A8E
01A8E: e8 88 ff                 call 0x1a19
01A91: 8b 1e 7a 8e              mov bx, word ptr [0x8e7a]
01A95: 80 bf 5f 8f 00           cmp byte ptr [bx - 0x70a1], 0
01A9A: 74 e8                    je 0x1a84

; basic_block_01A70
01A70: 83 f3 01                 xor bx, 1
01A73: 80 bf 5d 8f 00           cmp byte ptr [bx - 0x70a3], 0
01A78: 74 0a                    je 0x1a84

; basic_block_059D8
059D8: 75 09                    jne 0x59e3

; basic_block_059D5
059D5: e9 32 01                 jmp 0x5b0a

; basic_block_03F84

; basic_block_03F97
03F97: e9 03 fd                 jmp 0x3c9d

; basic_block_05C0F
05C0F: e8 23 fd                 call 0x5935
05C12: b8 50 00                 mov ax, 0x50
05C15: be 4f 34                 mov si, 0x344f
05C18: b9 01 00                 mov cx, 1
05C1B: e8 3f fd                 call 0x595d
05C1E: c6 06 5b 8f 00           mov byte ptr [0x8f5b], 0
05C23: b8 4f 00                 mov ax, 0x4f
05C26: 50                       push ax
05C27: e8 c1 ad                 call 0x9eb
05C2A: c7 06 52 37 50 00        mov word ptr [0x3752], 0x50
05C30: be 4f 34                 mov si, 0x344f
05C33: e8 c5 ae                 call 0xafb
05C36: 58                       pop ax
05C37: 50                       push ax
05C38: d1 e8                    shr ax, 1
05C3A: d1 e8                    shr ax, 1
05C3C: d1 e8                    shr ax, 1
05C3E: 04 30                    add al, 0x30
05C40: a2 6c 34                 mov byte ptr [0x346c], al
05C43: c7 06 52 37 78 00        mov word ptr [0x3752], 0x78
05C49: be 63 34                 mov si, 0x3463
05C4C: e8 ac ae                 call 0xafb
05C4F: e8 2a 00                 call 0x5c7c
05C52: e8 dc ab                 call 0x831
05C55: e8 f9 ad                 call 0xa51
05C58: 80 3e 5b 8f 00           cmp byte ptr [0x8f5b], 0
05C5D: 75 0e                    jne 0x5c6d

; basic_block_03F49

; basic_block_03F4B
03F4B: c7 06 8a 91 03 00        mov word ptr [0x918a], 3
03F51: e8 3d cf                 call 0xe91
03F54: c7 06 52 91 00 00        mov word ptr [0x9152], 0
03F5A: c7 06 54 91 00 00        mov word ptr [0x9154], 0
03F60: bf 1c 92                 mov di, 0x921c
03F63: b9 07 00                 mov cx, 7
03F66: 32 c0                    xor al, al
03F68: f3 aa                    rep stosb byte ptr es:[di], al
03F6A: c7 06 56 91 00 00        mov word ptr [0x9156], 0
03F70: c7 06 58 91 00 00        mov word ptr [0x9158], 0
03F76: e8 f6 ce                 call 0xe6f
03F79: eb 1f                    jmp 0x3f9a

; basic_block_03FC8
03FC8: b4 01                    mov ah, 1
03FCA: cd 80                    int 0x80
03FCC: 81 3e 90 91 e0 01        cmp word ptr [0x9190], 0x1e0
03FD2: 7f 39                    jg 0x400d

; basic_block_03FBB
03FBB: 80 3e 61 8f 00           cmp byte ptr [0x8f61], 0
03FC0: 74 03                    je 0x3fc5

; basic_block_03D26

; basic_block_00456

; basic_block_004AB
004AB: 33 f6                    xor si, si
004AD: 8b bc 46 0c              mov di, word ptr [si + 0xc46]
004B1: 89 b5 ec 04              mov word ptr [di + 0x4ec], si
004B5: 81 ff e6 04              cmp di, 0x4e6
004B9: 73 04                    jae 0x4bf

; basic_block_03787
03787: c3                       ret

; basic_block_03778
03778: 83 3d 40                 cmp word ptr [di], 0x40
0377B: 75 05                    jne 0x3782

; basic_block_037BD

; basic_block_01903
01903: a1 a6 91                 mov ax, word ptr [0x91a6]
01906: 2b 06 90 91              sub ax, word ptr [0x9190]
0190A: a3 fe fc                 mov word ptr [0xfcfe], ax
0190D: 8b 36 ec 90              mov si, word ptr [0x90ec]
01911: e8 06 1e                 call 0x371a
01914: 8b 36 a0 90              mov si, word ptr [0x90a0]
01918: e8 ff 1d                 call 0x371a
0191B: 8b 36 54 90              mov si, word ptr [0x9054]
0191F: e8 f8 1d                 call 0x371a
01922: 8b 36 08 90              mov si, word ptr [0x9008]
01926: 83 3c 00                 cmp word ptr [si], 0
01929: 74 05                    je 0x1930

; basic_block_01900
01900: e8 2a 2e                 call 0x472d

; basic_block_01A91

; basic_block_01A84
01A84: e8 d4 fe                 call 0x195b
01A87: c7 06 1e 99 08 00        mov word ptr [0x991e], 8
01A8D: c3                       ret

; basic_block_01A9C
01A9C: c6 06 61 8f ff           mov byte ptr [0x8f61], 0xff
01AA1: 83 3e 1c 99 05           cmp word ptr [0x991c], 5
01AA6: 75 dc                    jne 0x1a84

; basic_block_01A7A
01A7A: 80 bf 5f 8f 00           cmp byte ptr [bx - 0x70a1], 0
01A7F: 75 03                    jne 0x1a84

; basic_block_059E3
059E3: e8 25 01                 call 0x5b0b
059E6: be 8b 35                 mov si, 0x358b
059E9: bf 16 36                 mov di, 0x3616
059EC: a1 52 91                 mov ax, word ptr [0x9152]
059EF: 8b 16 54 91              mov dx, word ptr [0x9154]
059F3: 3b 54 fe                 cmp dx, word ptr [si - 2]
059F6: 7c 29                    jl 0x5a21

; basic_block_059DA
059DA: 3b 06 8b 35              cmp ax, word ptr [0x358b]
059DE: 7f 03                    jg 0x59e3

; basic_block_05B0A
05B0A: c3                       ret

; basic_block_03C9D

; basic_block_05C12

; basic_block_05C1E

; basic_block_05C2A

; basic_block_05C36

; basic_block_05C4F

; basic_block_05C52

; basic_block_05C55

; basic_block_05C58

; basic_block_05C6D
05C6D: 83 c4 02                 add sp, 2
05C70: e8 dd fc                 call 0x5950
05C73: c6 06 5b 8f 00           mov byte ptr [0x8f5b], 0
05C78: 33 c0                    xor ax, ax
05C7A: 48                       dec ax
05C7B: c3                       ret

; basic_block_05C5F
05C5F: 58                       pop ax
05C60: 48                       dec ax
05C61: 50                       push ax
05C62: 75 c3                    jne 0x5c27

; basic_block_03F54

; basic_block_03F79

; basic_block_0400D
0400D: a1 ae 8e                 mov ax, word ptr [0x8eae]
04010: a3 e6 fc                 mov word ptr [0xfce6], ax
04013: a1 e6 fc                 mov ax, word ptr [0xfce6]
04016: a3 4a 8f                 mov word ptr [0x8f4a], ax
04019: 83 3e 5c 91 00           cmp word ptr [0x915c], 0
0401E: 75 1e                    jne 0x403e

; basic_block_03FD4
03FD4: a1 ac 8e                 mov ax, word ptr [0x8eac]
03FD7: a3 e6 fc                 mov word ptr [0xfce6], ax
03FDA: a1 e6 fc                 mov ax, word ptr [0xfce6]
03FDD: a3 4a 8f                 mov word ptr [0x8f4a], ax
03FE0: 81 06 e6 fc 90 01        add word ptr [0xfce6], 0x190
03FE6: 83 3e 5c 91 00           cmp word ptr [0x915c], 0
03FEB: 75 51                    jne 0x403e

; basic_block_03FC5
03FC5: e9 5e fd                 jmp 0x3d26

; basic_block_03FC2
03FC2: e9 e2 00                 jmp 0x40a7

; basic_block_004BF
004BF: 46                       inc si
004C0: 46                       inc si
004C1: 81 fe e6 04              cmp si, 0x4e6
004C5: 72 e6                    jb 0x4ad

; basic_block_004BB
004BB: 89 b5 ee 04              mov word ptr [di + 0x4ee], si

; basic_block_03782
03782: 8b 7d 0a                 mov di, word ptr [di + 0xa]
03785: eb ec                    jmp 0x3773

; basic_block_0377D
0377D: 3b 75 1c                 cmp si, word ptr [di + 0x1c]
03780: 74 05                    je 0x3787

; basic_block_0371A
0371A: 83 3c 00                 cmp word ptr [si], 0
0371D: 74 1d                    je 0x373c

; basic_block_01914

; basic_block_0191B

; basic_block_01922

; basic_block_01930
01930: bf 80 9c                 mov di, 0x9c80
01933: b8 ff ff                 mov ax, 0xffff
01936: b9 40 01                 mov cx, 0x140
01939: f3 ab                    rep stosw word ptr es:[di], ax
0193B: c3                       ret

; basic_block_0192B
0192B: e8 7b 1e                 call 0x37a9
0192E: eb f2                    jmp 0x1922

; basic_block_0195B
0195B: be 00 9f                 mov si, 0x9f00
0195E: c6 06 24 92 00           mov byte ptr [0x9224], 0
01963: a1 a2 91                 mov ax, word ptr [0x91a2]
01966: 89 44 12                 mov word ptr [si + 0x12], ax
01969: c7 44 16 b0 00           mov word ptr [si + 0x16], 0xb0
0196E: a1 a6 91                 mov ax, word ptr [0x91a6]
01971: a3 90 91                 mov word ptr [0x9190], ax
01974: a3 aa 91                 mov word ptr [0x91aa], ax
01977: 40                       inc ax
01978: a3 92 91                 mov word ptr [0x9192], ax
0197B: 05 bf 00                 add ax, 0xbf
0197E: a3 94 91                 mov word ptr [0x9194], ax
01981: a1 a6 91                 mov ax, word ptr [0x91a6]
01984: 25 0f 00                 and ax, 0xf
01987: a3 96 91                 mov word ptr [0x9196], ax
0198A: a1 a6 91                 mov ax, word ptr [0x91a6]
0198D: d1 e8                    shr ax, 1
0198F: d1 e8                    shr ax, 1
01991: d1 e8                    shr ax, 1
01993: d1 e8                    shr ax, 1
01995: ba 28 00                 mov dx, 0x28
01998: f7 e2                    mul dx
0199A: a3 8e 91                 mov word ptr [0x918e], ax
0199D: e8 9c ff                 call 0x193c
019A0: a1 66 91                 mov ax, word ptr [0x9166]
019A3: a3 5a 91                 mov word ptr [0x915a], ax
019A6: a1 68 91                 mov ax, word ptr [0x9168]
019A9: a3 5c 91                 mov word ptr [0x915c], ax
019AC: bf 8c 8e                 mov di, 0x8e8c
019AF: b9 10 00                 mov cx, 0x10
019B2: 33 c0                    xor ax, ax
019B4: f3 ab                    rep stosw word ptr es:[di], ax
019B6: c7 06 80 8e 00 00        mov word ptr [0x8e80], 0
019BC: c7 06 7e 8e 00 00        mov word ptr [0x8e7e], 0
019C2: c6 06 af 8f ff           mov byte ptr [0x8faf], 0xff
019C7: c7 06 9e 91 00 00        mov word ptr [0x919e], 0
019CD: bf bc 8e                 mov di, 0x8ebc
019D0: b9 04 00                 mov cx, 4
019D3: 8b 44 12                 mov ax, word ptr [si + 0x12]
019D6: ab                       stosw word ptr es:[di], ax
019D7: 8b 44 16                 mov ax, word ptr [si + 0x16]
019DA: ab                       stosw word ptr es:[di], ax
019DB: e2 f6                    loop 0x19d3
019DD: bf cc 8e                 mov di, 0x8ecc
019E0: b9 11 00                 mov cx, 0x11
019E3: a1 90 91                 mov ax, word ptr [0x9190]
019E6: ab                       stosw word ptr es:[di], ax
019E7: 8b 44 12                 mov ax, word ptr [si + 0x12]
019EA: ab                       stosw word ptr es:[di], ax
019EB: 8b 44 16                 mov ax, word ptr [si + 0x16]
019EE: ab                       stosw word ptr es:[di], ax
019EF: e2 f2                    loop 0x19e3
019F1: 56                       push si
019F2: a1 7a 8e                 mov ax, word ptr [0x8e7a]
019F5: 04 31                    add al, 0x31
019F7: a2 27 37                 mov byte ptr [0x3727], al
019FA: be 15 37                 mov si, 0x3715
019FD: c6 06 4e 37 ff           mov byte ptr [0x374e], 0xff
01A02: e8 21 3f                 call 0x5926
01A05: c6 06 4e 37 00           mov byte ptr [0x374e], 0
01A0A: e8 52 f3                 call 0xd5f
01A0D: 5e                       pop si
01A0E: 83 3e 62 91 00           cmp word ptr [0x9162], 0
01A13: 74 03                    je 0x1a18

; basic_block_01A87

; basic_block_01AA8
01AA8: c6 06 b0 8f ff           mov byte ptr [0x8fb0], 0xff
01AAD: eb d5                    jmp 0x1a84

; basic_block_01A81
01A81: e8 95 ff                 call 0x1a19

; basic_block_05B0B
05B0B: be 2b 35                 mov si, 0x352b
05B0E: eb 03                    jmp 0x5b13

; basic_block_059E6

; basic_block_05A21
05A21: a1 52 91                 mov ax, word ptr [0x9152]
05A24: 89 04                    mov word ptr [si], ax
05A26: a1 54 91                 mov ax, word ptr [0x9154]
05A29: 89 44 02                 mov word ptr [si + 2], ax
05A2C: c6 45 0c 3a              mov byte ptr [di + 0xc], 0x3a
05A30: c6 45 0d 3a              mov byte ptr [di + 0xd], 0x3a
05A34: c6 45 0e 3a              mov byte ptr [di + 0xe], 0x3a
05A38: 8d 6d 04                 lea bp, [di + 4]
05A3B: bb 56 37                 mov bx, 0x3756
05A3E: a1 52 91                 mov ax, word ptr [0x9152]
05A41: a3 e2 fc                 mov word ptr [0xfce2], ax
05A44: a1 54 91                 mov ax, word ptr [0x9154]
05A47: a3 e4 fc                 mov word ptr [0xfce4], ax
05A4A: 83 3f 00                 cmp word ptr [bx], 0
05A4D: 74 2d                    je 0x5a7c

; basic_block_059F8
059F8: 75 05                    jne 0x59ff

; basic_block_059E0
059E0: e9 27 01                 jmp 0x5b0a

; basic_block_05C73

; basic_block_05C27

; basic_block_05C64
05C64: 83 c4 02                 add sp, 2
05C67: e8 e6 fc                 call 0x5950
05C6A: 33 c0                    xor ax, ax
05C6C: c3                       ret

; basic_block_0403E
0403E: c6 06 23 92 00           mov byte ptr [0x9223], 0
04043: c6 06 b1 8f 00           mov byte ptr [0x8fb1], 0
04048: 81 3e 90 91 c0 03        cmp word ptr [0x9190], 0x3c0
0404E: 7f 28                    jg 0x4078

; basic_block_04020
04020: a1 5a 91                 mov ax, word ptr [0x915a]
04023: 39 06 e6 fc              cmp word ptr [0xfce6], ax
04027: 7e 15                    jle 0x403e

; basic_block_03FED
03FED: a1 5a 91                 mov ax, word ptr [0x915a]
03FF0: 39 06 e6 fc              cmp word ptr [0xfce6], ax
03FF4: 7e 48                    jle 0x403e

; basic_block_040A7
040A7: c6 06 61 8f 00           mov byte ptr [0x8f61], 0
040AC: 83 3e 1c 99 05           cmp word ptr [0x991c], 5
040B1: 75 18                    jne 0x40cb

; basic_block_004AD

; basic_block_004C7
004C7: 5e                       pop si
004C8: c3                       ret

; basic_block_03773

; basic_block_0373C
0373C: c3                       ret

; basic_block_0371F
0371F: ff 74 0a                 push word ptr [si + 0xa]
03722: 80 7c 4a 00              cmp byte ptr [si + 0x4a], 0
03726: 75 05                    jne 0x372d

; basic_block_0192E

; basic_block_0193C
0193C: be 6a 91                 mov si, 0x916a
0193F: b9 07 00                 mov cx, 7
01942: ad                       lodsw ax, word ptr [si]
01943: 8b d8                    mov bx, ax
01945: ad                       lodsw ax, word ptr [si]
01946: 85 db                    test bx, bx
01948: 74 0e                    je 0x1958

; basic_block_019A0

; basic_block_01A05

; basic_block_01A0D

; basic_block_01A18
01A18: c3                       ret

; basic_block_01A15
01A15: e8 0a 11                 call 0x2b22

; basic_block_05B13

; basic_block_05A7C
05A7C: c6 06 5b 8f 00           mov byte ptr [0x8f5b], 0
05A81: 8d 6d 0c                 lea bp, [di + 0xc]
05A84: bb ca 33                 mov bx, 0x33ca
05A87: 33 ff                    xor di, di
05A89: 8a 01                    mov al, byte ptr [bx + di]
05A8B: 3e 88 46 00              mov byte ptr ds:[bp], al
05A8F: 55                       push bp
05A90: 53                       push bx
05A91: 57                       push di
05A92: e8 aa b0                 call 0xb3f
05A95: 5f                       pop di
05A96: 5b                       pop bx
05A97: 5d                       pop bp
05A98: 80 3e 5b 8f 00           cmp byte ptr [0x8f5b], 0
05A9D: 75 51                    jne 0x5af0

; basic_block_05A4F
05A4F: 3e c6 46 00 30           mov byte ptr ds:[bp], 0x30
05A54: 8b 07                    mov ax, word ptr [bx]
05A56: 29 06 e2 fc              sub word ptr [0xfce2], ax
05A5A: 8b 47 02                 mov ax, word ptr [bx + 2]
05A5D: 19 06 e4 fc              sbb word ptr [0xfce4], ax
05A61: 78 06                    js 0x5a69

; basic_block_059FF
059FF: 83 ee 04                 sub si, 4
05A02: 8b 04                    mov ax, word ptr [si]
05A04: 89 44 04                 mov word ptr [si + 4], ax
05A07: 8b 44 02                 mov ax, word ptr [si + 2]
05A0A: 89 44 06                 mov word ptr [si + 6], ax
05A0D: b9 0b 00                 mov cx, 0xb
05A10: 4f                       dec di
05A11: 8a 05                    mov al, byte ptr [di]
05A13: 88 45 0f                 mov byte ptr [di + 0xf], al
05A16: e2 f8                    loop 0x5a10
05A18: 83 ef 04                 sub di, 4
05A1B: 81 fe 67 35              cmp si, 0x3567
05A1F: 7f cb                    jg 0x59ec

; basic_block_059FA
059FA: 3b 44 fc                 cmp ax, word ptr [si - 4]
059FD: 76 22                    jbe 0x5a21

; basic_block_05C6A

; basic_block_04078
04078: e8 ee 09                 call 0x4a69
0407B: e8 13 ce                 call 0xe91
0407E: c6 06 b0 8f 00           mov byte ptr [0x8fb0], 0
04083: 83 3e 62 91 00           cmp word ptr [0x9162], 0
04088: 74 03                    je 0x408d

; basic_block_04050
04050: 83 3e 1c 99 05           cmp word ptr [0x991c], 5
04055: 75 21                    jne 0x4078

; basic_block_04029
04029: e8 65 01                 call 0x4191
0402C: 25 03 00                 and ax, 3
0402F: ba 32 00                 mov dx, 0x32
04032: f7 e2                    mul dx
04034: 01 06 e6 fc              add word ptr [0xfce6], ax
04038: a1 e6 fc                 mov ax, word ptr [0xfce6]
0403B: a3 5a 91                 mov word ptr [0x915a], ax

; basic_block_03FF6
03FF6: e8 98 01                 call 0x4191
03FF9: 25 03 00                 and ax, 3
03FFC: ba 32 00                 mov dx, 0x32
03FFF: f7 e2                    mul dx
04001: 01 06 e6 fc              add word ptr [0xfce6], ax
04005: a1 e6 fc                 mov ax, word ptr [0xfce6]
04008: a3 5a 91                 mov word ptr [0x915a], ax
0400B: eb 31                    jmp 0x403e

; basic_block_040CB
040CB: 8b 1e 7a 8e              mov bx, word ptr [0x8e7a]
040CF: 83 f3 01                 xor bx, 1
040D2: 80 bf 5d 8f 00           cmp byte ptr [bx - 0x70a3], 0
040D7: 74 3d                    je 0x4116

; basic_block_040B3
040B3: 8b 36 08 90              mov si, word ptr [0x9008]
040B7: 83 3c 00                 cmp word ptr [si], 0
040BA: 74 05                    je 0x40c1

; basic_block_0372D
0372D: 80 7c 4b 00              cmp byte ptr [si + 0x4b], 0
03731: 75 06                    jne 0x3739

; basic_block_03728
03728: e8 75 d0                 call 0x7a0
0372B: eb 0c                    jmp 0x3739

; basic_block_01958
01958: e2 e8                    loop 0x1942
0195A: c3                       ret

; basic_block_0194A
0194A: 56                       push si
0194B: 51                       push cx
0194C: 50                       push ax
0194D: 8b c3                    mov ax, bx
0194F: e8 85 10                 call 0x29d7
01952: 58                       pop ax
01953: 89 45 34                 mov word ptr [di + 0x34], ax
01956: 59                       pop cx
01957: 5e                       pop si

; basic_block_02B22
02B22: a1 08 90                 mov ax, word ptr [0x9008]
02B25: a3 b4 91                 mov word ptr [0x91b4], ax
02B28: a1 06 90                 mov ax, word ptr [0x9006]
02B2B: a3 b6 91                 mov word ptr [0x91b6], ax
02B2E: bf 34 91                 mov di, 0x9134
02B31: bb b8 91                 mov bx, 0x91b8
02B34: b9 0e 00                 mov cx, 0xe
02B37: 8b 05                    mov ax, word ptr [di]
02B39: 89 07                    mov word ptr [bx], ax
02B3B: 83 c3 02                 add bx, 2
02B3E: c7 05 00 00              mov word ptr [di], 0
02B42: 83 c7 02                 add di, 2
02B45: e2 f0                    loop 0x2b37
02B47: be fe 8f                 mov si, 0x8ffe
02B4A: e8 15 dc                 call 0x762
02B4D: e8 7c 00                 call 0x2bcc
02B50: e8 f3 06                 call 0x3246
02B53: e8 f0 06                 call 0x3246
02B56: e8 5d 06                 call 0x31b6
02B59: c7 45 34 02 00           mov word ptr [di + 0x34], 2
02B5E: e8 55 06                 call 0x31b6
02B61: c7 45 34 02 00           mov word ptr [di + 0x34], 2
02B66: e8 1b 03                 call 0x2e84
02B69: c7 45 34 02 00           mov word ptr [di + 0x34], 2
02B6E: e8 35 01                 call 0x2ca6
02B71: c7 45 34 02 00           mov word ptr [di + 0x34], 2
02B76: e8 b9 00                 call 0x2c32
02B79: c7 45 34 02 00           mov word ptr [di + 0x34], 2
02B7E: c3                       ret

; basic_block_05A95

; basic_block_05AF0
05AF0: c6 06 5b 8f 00           mov byte ptr [0x8f5b], 0
05AF5: 45                       inc bp
05AF6: 3e 80 7e 00 3a           cmp byte ptr ds:[bp], 0x3a
05AFB: 74 8c                    je 0x5a89

; basic_block_05A9F
05A9F: 8a 26 59 8f              mov ah, byte ptr [0x8f59]
05AA3: 80 e4 0c                 and ah, 0xc
05AA6: ba ff ff                 mov dx, 0xffff
05AA9: f6 c4 04                 test ah, 4
05AAC: 75 08                    jne 0x5ab6

; basic_block_05A69
05A69: 8b 07                    mov ax, word ptr [bx]
05A6B: 01 06 e2 fc              add word ptr [0xfce2], ax
05A6F: 8b 47 02                 mov ax, word ptr [bx + 2]
05A72: 11 06 e4 fc              adc word ptr [0xfce4], ax
05A76: 83 c3 04                 add bx, 4
05A79: 45                       inc bp
05A7A: eb ce                    jmp 0x5a4a

; basic_block_05A63
05A63: 3e fe 46 00              inc byte ptr ds:[bp]
05A67: eb eb                    jmp 0x5a54

; basic_block_059EC

; basic_block_04A69
04A69: 36 c7 06 10 00 c7 00     mov word ptr ss:[0x10], 0xc7
04A70: e8 54 c1                 call 0xbc7
04A73: e8 e9 c2                 call 0xd5f
04A76: e8 92 c1                 call 0xc0b
04A79: c6 06 de 3a ff           mov byte ptr [0x3ade], 0xff
04A7E: c6 06 df 3a ff           mov byte ptr [0x3adf], 0xff
04A83: c6 06 e0 3a 00           mov byte ptr [0x3ae0], 0
04A88: c7 06 16 38 00 00        mov word ptr [0x3816], 0
04A8E: be b6 3c                 mov si, 0x3cb6
04A91: b9 14 00                 mov cx, 0x14
04A94: c7 04 f7 ff              mov word ptr [si], 0xfff7
04A98: 83 c6 0c                 add si, 0xc
04A9B: e2 f7                    loop 0x4a94
04A9D: c7 06 3c 8f 30 00        mov word ptr [0x8f3c], 0x30
04AA3: c7 06 3e 8f 44 00        mov word ptr [0x8f3e], 0x44
04AA9: c7 06 40 8f 00 00        mov word ptr [0x8f40], 0
04AAF: c7 06 42 8f 00 00        mov word ptr [0x8f42], 0
04AB5: c7 06 44 8f 04 00        mov word ptr [0x8f44], 4
04ABB: e8 ca 09                 call 0x5488
04ABE: c7 06 42 8f 01 00        mov word ptr [0x8f42], 1
04AC4: c7 06 44 8f 04 00        mov word ptr [0x8f44], 4
04ACA: e8 bb 09                 call 0x5488
04ACD: e8 ad 0c                 call 0x577d
04AD0: e8 3f 0b                 call 0x5612
04AD3: e8 7b bf                 call 0xa51
04AD6: e8 39 0b                 call 0x5612
04AD9: e8 2d c3                 call 0xe09
04ADC: e8 a2 c2                 call 0xd81
04ADF: c7 06 88 8e 00 00        mov word ptr [0x8e88], 0
04AE5: e8 df 00                 call 0x4bc7
04AE8: c7 06 88 8e 07 00        mov word ptr [0x8e88], 7
04AEE: e8 68 01                 call 0x4c59
04AF1: 80 3e b1 8f 00           cmp byte ptr [0x8fb1], 0
04AF6: 74 05                    je 0x4afd

; basic_block_0407B

; basic_block_0407E

; basic_block_0408D
0408D: 80 3e 61 8f 00           cmp byte ptr [0x8f61], 0
04092: 75 13                    jne 0x40a7

; basic_block_0408A
0408A: e8 95 ea                 call 0x2b22

; basic_block_04057
04057: c6 06 b1 8f ff           mov byte ptr [0x8fb1], 0xff
0405C: 83 3e 70 8e 02           cmp word ptr [0x8e70], 2
04061: 75 15                    jne 0x4078

; basic_block_0402C

; basic_block_03FF9

; basic_block_04116
04116: e8 46 cc                 call 0xd5f
04119: e8 d9 d7                 call 0x18f5
0411C: 8b 36 54 90              mov si, word ptr [0x9054]
04120: e8 3d f6                 call 0x3760
04123: 8b 36 ec 90              mov si, word ptr [0x90ec]
04127: e8 36 f6                 call 0x3760
0412A: 8b 36 a0 90              mov si, word ptr [0x90a0]
0412E: e8 2f f6                 call 0x3760
04131: ff 06 1c 99              inc word ptr [0x991c]
04135: 83 3e 1c 99 06           cmp word ptr [0x991c], 6
0413A: 7c 0a                    jl 0x4146

; basic_block_040D9
040D9: 80 bf 5f 8f 00           cmp byte ptr [bx - 0x70a1], 0
040DE: 75 36                    jne 0x4116

; basic_block_040C1
040C1: e8 55 f2                 call 0x3319
040C4: e8 24 f5                 call 0x35eb
040C7: ff 06 b0 91              inc word ptr [0x91b0]

; basic_block_040BC
040BC: e8 ea f6                 call 0x37a9
040BF: eb f2                    jmp 0x40b3

; basic_block_03739
03739: 5e                       pop si
0373A: eb de                    jmp 0x371a

; basic_block_03733
03733: a1 fe fc                 mov ax, word ptr [0xfcfe]
03736: 29 44 16                 sub word ptr [si + 0x16], ax

; basic_block_0372B

; basic_block_029D7
029D7: 3d 44 00                 cmp ax, 0x44
029DA: 75 03                    jne 0x29df

; basic_block_01952

; basic_block_02B4D

; basic_block_02B50

; basic_block_03246
03246: b8 34 00                 mov ax, 0x34
03249: e8 cb fe                 call 0x3117
0324C: 75 03                    jne 0x3251

; basic_block_02B53

; basic_block_02B56

; basic_block_031B6
031B6: b8 20 00                 mov ax, 0x20
031B9: e8 5b ff                 call 0x3117
031BC: 75 03                    jne 0x31c1

; basic_block_02B59

; basic_block_02B61

; basic_block_02E84
02E84: 83 3e 48 91 2c           cmp word ptr [0x9148], 0x2c
02E89: 74 6d                    je 0x2ef8

; basic_block_02B69

; basic_block_02CA6
02CA6: 81 3e 4c 91 98 00        cmp word ptr [0x914c], 0x98
02CAC: 74 6b                    je 0x2d19

; basic_block_02B71

; basic_block_02C32
02C32: 81 3e 34 91 c0 00        cmp word ptr [0x9134], 0xc0
02C38: 74 e7                    je 0x2c21

; basic_block_02B79

; basic_block_05A89

; basic_block_05AFD
05AFD: b9 12 00                 mov cx, 0x12
05B00: 51                       push cx
05B01: e8 3b b0                 call 0xb3f
05B04: 59                       pop cx
05B05: e2 f9                    loop 0x5b00
05B07: e8 46 fe                 call 0x5950

; basic_block_05AB6
05AB6: b9 04 00                 mov cx, 4
05AB9: 03 fa                    add di, dx
05ABB: 79 03                    jns 0x5ac0

; basic_block_05AAE
05AAE: ba 01 00                 mov dx, 1
05AB1: f6 c4 08                 test ah, 8
05AB4: 74 d9                    je 0x5a8f

; basic_block_05A4A

; basic_block_05A54

; basic_block_04A73

; basic_block_04A76

; basic_block_00C0B
00C0B: 8b 2e 44 30              mov bp, word ptr [0x3044]
00C0F: d1 e5                    shl bp, 1
00C11: d1 e5                    shl bp, 1
00C13: 2e ff 9e 19 0c           lcall cs:[bp + 0xc19]
00C18: c3                       ret

; basic_block_04A79

; basic_block_05488
05488: 8b 1e 44 8f              mov bx, word ptr [0x8f44]
0548C: 83 fb 04                 cmp bx, 4
0548F: 74 27                    je 0x54b8

; basic_block_04ABE

; basic_block_04ACD

; basic_block_0577D
0577D: a1 5a 91                 mov ax, word ptr [0x915a]
05780: 8b 16 5c 91              mov dx, word ptr [0x915c]
05784: e9 96 b3                 jmp 0xb1d

; basic_block_04AD0

; basic_block_05612
05612: e8 a3 00                 call 0x56b8
05615: e8 7b b6                 call 0xc93
05618: e8 9a b6                 call 0xcb5
0561B: c3                       ret

; basic_block_04AD3

; basic_block_04AD6

; basic_block_04AD9

; basic_block_00E09
00E09: 8b 2e 44 30              mov bp, word ptr [0x3044]
00E0D: d1 e5                    shl bp, 1
00E0F: d1 e5                    shl bp, 1
00E11: 2e ff 9e 17 0e           lcall cs:[bp + 0xe17]
00E16: c3                       ret

; basic_block_04ADC

; basic_block_04ADF

; basic_block_04BC7
04BC7: a1 46 30                 mov ax, word ptr [0x3046]
04BCA: 05 09 00                 add ax, 9
04BCD: 3b 06 46 30              cmp ax, word ptr [0x3046]
04BD1: 75 fa                    jne 0x4bcd

; basic_block_04AE8

; basic_block_04C59
04C59: e8 f5 bd                 call 0xa51
04C5C: 83 3e 3c 8f 00           cmp word ptr [0x8f3c], 0
04C61: 74 19                    je 0x4c7c

; basic_block_04AF1

; basic_block_04AFD
04AFD: e8 19 06                 call 0x5119
04B00: e8 8b 0a                 call 0x558e
04B03: e8 0a 0a                 call 0x5510
04B06: e8 64 0c                 call 0x576d
04B09: 80 3e b1 8f 00           cmp byte ptr [0x8fb1], 0
04B0E: 74 03                    je 0x4b13

; basic_block_04AF8
04AF8: e8 17 03                 call 0x4e12
04AFB: eb 03                    jmp 0x4b00

; basic_block_04094
04094: 80 3e 54 8f 00           cmp byte ptr [0x8f54], 0
04099: 75 03                    jne 0x409e

; basic_block_04063
04063: 8b 1e 7a 8e              mov bx, word ptr [0x8e7a]
04067: 83 f3 01                 xor bx, 1
0406A: 80 bf 5d 8f 00           cmp byte ptr [bx - 0x70a3], 0
0406F: 74 07                    je 0x4078

; basic_block_04119

; basic_block_0411C

; basic_block_03760
03760: 83 3c 00                 cmp word ptr [si], 0
03763: 74 09                    je 0x376e

; basic_block_04123

; basic_block_0412A

; basic_block_04131

; basic_block_04146
04146: a1 1c 99                 mov ax, word ptr [0x991c]
04149: 05 30 00                 add ax, 0x30
0414C: a2 50 35                 mov byte ptr [0x3550], al
0414F: e8 73 1b                 call 0x5cc5
04152: e8 e7 d7                 call 0x193c
04155: 83 3e 62 91 00           cmp word ptr [0x9162], 0
0415A: 74 03                    je 0x415f

; basic_block_0413C
0413C: c7 06 1c 99 01 00        mov word ptr [0x991c], 1
04142: ff 06 1a 99              inc word ptr [0x991a]

; basic_block_040E0
040E0: 83 f3 01                 xor bx, 1
040E3: c6 87 5f 8f ff           mov byte ptr [bx - 0x70a1], 0xff
040E8: e8 0a d8                 call 0x18f5
040EB: 8b 36 54 90              mov si, word ptr [0x9054]
040EF: e8 6e f6                 call 0x3760
040F2: 8b 36 ec 90              mov si, word ptr [0x90ec]
040F6: e8 67 f6                 call 0x3760
040F9: 8b 36 a0 90              mov si, word ptr [0x90a0]
040FD: e8 60 f6                 call 0x3760
04100: e8 62 d9                 call 0x1a65
04103: 80 3e 54 8f 00           cmp byte ptr [0x8f54], 0
04108: 75 03                    jne 0x410d

; basic_block_03319
03319: 83 3e 34 91 00           cmp word ptr [0x9134], 0
0331E: 75 05                    jne 0x3325

; basic_block_040C4

; basic_block_040C7

; basic_block_040BF

; basic_block_029DF
029DF: 3d 98 00                 cmp ax, 0x98
029E2: 75 03                    jne 0x29e7

; basic_block_029DC
029DC: e9 ad 06                 jmp 0x308c

; basic_block_03117
03117: e8 f4 de                 call 0x100e
0311A: 75 06                    jne 0x3122

; basic_block_0324C

; basic_block_03251
03251: 56                       push si
03252: e8 cd dd                 call 0x1022
03255: bf fe 8f                 mov di, 0x8ffe
03258: e8 21 d5                 call 0x77c
0325B: 8b fe                    mov di, si
0325D: 5e                       pop si
0325E: 3e c7 46 00 34 00        mov word ptr ds:[bp], 0x34
03264: 3e 89 7e 02              mov word ptr ds:[bp + 2], di
03268: c7 05 34 00              mov word ptr [di], 0x34
0326C: c7 45 02 6d 24           mov word ptr [di + 2], 0x246d
03271: c7 45 04 53 08           mov word ptr [di + 4], 0x853
03276: 89 6d 06                 mov word ptr [di + 6], bp
03279: 49                       dec cx
0327A: d1 e1                    shl cx, 1
0327C: d1 e1                    shl cx, 1
0327E: bd a8 30                 mov bp, 0x30a8
03281: 03 e9                    add bp, cx
03283: 3e 8b 46 00              mov ax, word ptr ds:[bp]
03287: 89 45 30                 mov word ptr [di + 0x30], ax
0328A: 3e 8b 46 02              mov ax, word ptr ds:[bp + 2]
0328E: 89 45 32                 mov word ptr [di + 0x32], ax
03291: bd da 12                 mov bp, 0x12da
03294: 2e 8b 46 00              mov ax, word ptr cs:[bp]
03298: 89 45 0c                 mov word ptr [di + 0xc], ax
0329B: 2e 8b 46 02              mov ax, word ptr cs:[bp + 2]
0329F: 89 45 0e                 mov word ptr [di + 0xe], ax
032A2: 83 c5 04                 add bp, 4
032A5: 89 6d 10                 mov word ptr [di + 0x10], bp
032A8: a1 12 9f                 mov ax, word ptr [0x9f12]
032AB: 03 45 30                 add ax, word ptr [di + 0x30]
032AE: 89 45 12                 mov word ptr [di + 0x12], ax
032B1: a1 16 9f                 mov ax, word ptr [0x9f16]
032B4: 03 45 32                 add ax, word ptr [di + 0x32]
032B7: 89 45 16                 mov word ptr [di + 0x16], ax
032BA: c7 45 34 00 00           mov word ptr [di + 0x34], 0
032BF: c7 45 24 00 00           mov word ptr [di + 0x24], 0
032C4: c7 45 36 0f 00           mov word ptr [di + 0x36], 0xf
032C9: c7 45 48 ff ff           mov word ptr [di + 0x48], 0xffff
032CE: 83 7d 30 00              cmp word ptr [di + 0x30], 0
032D2: 74 45                    je 0x3319

; basic_block_0324E
0324E: e9 c8 00                 jmp 0x3319

; basic_block_031BC

; basic_block_031C1
031C1: 56                       push si
031C2: e8 5d de                 call 0x1022
031C5: bf fe 8f                 mov di, 0x8ffe
031C8: e8 b1 d5                 call 0x77c
031CB: 8b fe                    mov di, si
031CD: 5e                       pop si
031CE: 3e c7 46 00 20 00        mov word ptr ds:[bp], 0x20
031D4: 3e 89 7e 02              mov word ptr ds:[bp + 2], di
031D8: c7 05 20 00              mov word ptr [di], 0x20
031DC: c7 45 02 7e 23           mov word ptr [di + 2], 0x237e
031E1: c7 45 04 53 08           mov word ptr [di + 4], 0x853
031E6: 89 6d 06                 mov word ptr [di + 6], bp
031E9: 49                       dec cx
031EA: d1 e1                    shl cx, 1
031EC: d1 e1                    shl cx, 1
031EE: bd a8 30                 mov bp, 0x30a8
031F1: 03 e9                    add bp, cx
031F3: 3e 8b 46 00              mov ax, word ptr ds:[bp]
031F7: 89 45 30                 mov word ptr [di + 0x30], ax
031FA: 3e 8b 46 02              mov ax, word ptr ds:[bp + 2]
031FE: 89 45 32                 mov word ptr [di + 0x32], ax
03201: bd 8e 11                 mov bp, 0x118e
03204: 2e 8b 46 00              mov ax, word ptr cs:[bp]
03208: 89 45 0c                 mov word ptr [di + 0xc], ax
0320B: 2e 8b 46 02              mov ax, word ptr cs:[bp + 2]
0320F: 89 45 0e                 mov word ptr [di + 0xe], ax
03212: 83 c5 04                 add bp, 4
03215: 89 6d 10                 mov word ptr [di + 0x10], bp
03218: a1 12 9f                 mov ax, word ptr [0x9f12]
0321B: 03 45 30                 add ax, word ptr [di + 0x30]
0321E: 89 45 12                 mov word ptr [di + 0x12], ax
03221: a1 16 9f                 mov ax, word ptr [0x9f16]
03224: 03 45 32                 add ax, word ptr [di + 0x32]
03227: 89 45 16                 mov word ptr [di + 0x16], ax
0322A: c7 45 1a 00 00           mov word ptr [di + 0x1a], 0
0322F: c7 45 34 00 00           mov word ptr [di + 0x34], 0
03234: c7 45 24 02 00           mov word ptr [di + 0x24], 2
03239: c7 45 36 12 00           mov word ptr [di + 0x36], 0x12
0323E: c7 45 48 ff ff           mov word ptr [di + 0x48], 0xffff
03243: e9 d3 00                 jmp 0x3319

; basic_block_031BE
031BE: e9 82 00                 jmp 0x3243

; basic_block_02EF8
02EF8: 8b 3e 4a 91              mov di, word ptr [0x914a]
02EFC: 8b 45 24                 mov ax, word ptr [di + 0x24]
02EFF: 3b 45 34                 cmp ax, word ptr [di + 0x34]
02F02: 7e 03                    jle 0x2f07

; basic_block_02E8B
02E8B: e8 e5 ff                 call 0x2e73
02E8E: 56                       push si
02E8F: e8 90 e1                 call 0x1022
02E92: bf fe 8f                 mov di, 0x8ffe
02E95: e8 e4 d8                 call 0x77c
02E98: 8b fe                    mov di, si
02E9A: 5e                       pop si
02E9B: c7 06 48 91 2c 00        mov word ptr [0x9148], 0x2c
02EA1: 89 3e 4a 91              mov word ptr [0x914a], di
02EA5: c7 05 2c 00              mov word ptr [di], 0x2c
02EA9: c7 45 02 1a 22           mov word ptr [di + 2], 0x221a
02EAE: c7 45 04 53 08           mov word ptr [di + 4], 0x853
02EB3: c7 45 06 48 91           mov word ptr [di + 6], 0x9148
02EB8: bd 5a 11                 mov bp, 0x115a
02EBB: 2e 8b 46 00              mov ax, word ptr cs:[bp]
02EBF: 89 45 0c                 mov word ptr [di + 0xc], ax
02EC2: 2e 8b 46 02              mov ax, word ptr cs:[bp + 2]
02EC6: 89 45 0e                 mov word ptr [di + 0xe], ax
02EC9: 83 c5 04                 add bp, 4
02ECC: 89 6d 10                 mov word ptr [di + 0x10], bp
02ECF: a1 12 9f                 mov ax, word ptr [0x9f12]
02ED2: 89 45 12                 mov word ptr [di + 0x12], ax
02ED5: a1 16 9f                 mov ax, word ptr [0x9f16]
02ED8: 05 19 00                 add ax, 0x19
02EDB: 89 45 16                 mov word ptr [di + 0x16], ax
02EDE: c7 45 1a 00 00           mov word ptr [di + 0x1a], 0
02EE3: c7 45 34 00 00           mov word ptr [di + 0x34], 0
02EE8: c7 45 24 02 00           mov word ptr [di + 0x24], 2
02EED: c7 45 36 13 00           mov word ptr [di + 0x36], 0x13
02EF2: c7 45 48 ff ff           mov word ptr [di + 0x48], 0xffff
02EF7: c3                       ret

; basic_block_02D19
02D19: 8b 3e 4e 91              mov di, word ptr [0x914e]
02D1D: 8b 45 24                 mov ax, word ptr [di + 0x24]
02D20: 3b 45 34                 cmp ax, word ptr [di + 0x34]
02D23: 7e 03                    jle 0x2d28

; basic_block_02CAE
02CAE: 83 3e 4c 91 00           cmp word ptr [0x914c], 0
02CB3: 74 09                    je 0x2cbe

; basic_block_02C21
02C21: 8b 3e 36 91              mov di, word ptr [0x9136]
02C25: 8b 45 24                 mov ax, word ptr [di + 0x24]
02C28: 3b 45 34                 cmp ax, word ptr [di + 0x34]
02C2B: 7e 03                    jle 0x2c30

; basic_block_02C3A
02C3A: 83 3e 34 91 00           cmp word ptr [0x9134], 0
02C3F: 74 09                    je 0x2c4a

; basic_block_05B04

; basic_block_05AC0
05AC0: 83 ff 28                 cmp di, 0x28
05AC3: 7c 02                    jl 0x5ac7

; basic_block_05ABD
05ABD: bf 27 00                 mov di, 0x27

; basic_block_05A8F

; basic_block_00C18

; basic_block_054B8
054B8: b9 04 00                 mov cx, 4
054BB: be ec e3                 mov si, 0xe3ec
054BE: 83 3e 42 8f 00           cmp word ptr [0x8f42], 0
054C3: 74 10                    je 0x54d5

; basic_block_05491
05491: 8b c3                    mov ax, bx
05493: d1 e3                    shl bx, 1
05495: d1 e3                    shl bx, 1
05497: 03 d8                    add bx, ax
05499: 03 1e 42 8f              add bx, word ptr [0x8f42]
0549D: b8 0c 00                 mov ax, 0xc
054A0: f7 e3                    mul bx
054A2: 8b d8                    mov bx, ax
054A4: 8b 8f b8 3c              mov cx, word ptr [bx + 0x3cb8]
054A8: 8b 97 ba 3c              mov dx, word ptr [bx + 0x3cba]
054AC: 83 c1 0a                 add cx, 0xa
054AF: 83 c2 1f                 add dx, 0x1f
054B2: be 18 b2                 mov si, 0xb218
054B5: e9 75 b7                 jmp 0xc2d

; basic_block_00B1D
00B1D: 8b 2e 44 30              mov bp, word ptr [0x3044]
00B21: d1 e5                    shl bp, 1
00B23: d1 e5                    shl bp, 1
00B25: 2e ff 9e 2b 0b           lcall cs:[bp + 0xb2b]
00B2A: c3                       ret

; basic_block_056B8
056B8: bf b6 3c                 mov di, 0x3cb6
056BB: b9 14 00                 mov cx, 0x14
056BE: 51                       push cx
056BF: 83 3d 00                 cmp word ptr [di], 0
056C2: 7f 28                    jg 0x56ec

; basic_block_05615

; basic_block_00C93
00C93: 8b 2e 44 30              mov bp, word ptr [0x3044]
00C97: d1 e5                    shl bp, 1
00C99: d1 e5                    shl bp, 1
00C9B: 2e ff 9e a1 0c           lcall cs:[bp + 0xca1]
00CA0: c3                       ret

; basic_block_05618

; basic_block_00CB5
00CB5: 8b 2e 44 30              mov bp, word ptr [0x3044]
00CB9: d1 e5                    shl bp, 1
00CBB: d1 e5                    shl bp, 1
00CBD: 2e ff 9e c3 0c           lcall cs:[bp + 0xcc3]
00CC2: c3                       ret

; basic_block_0561B

; basic_block_00E16

; basic_block_04BCD

; basic_block_04BD3
04BD3: c3                       ret

; basic_block_04C5C

; basic_block_04C7C
04C7C: 83 3e 3e 8f 00           cmp word ptr [0x8f3e], 0
04C81: 74 0f                    je 0x4c92

; basic_block_04C63
04C63: 83 2e 3c 8f 04           sub word ptr [0x8f3c], 4
04C68: 78 02                    js 0x4c6c

; basic_block_05119
05119: be b6 3c                 mov si, 0x3cb6
0511C: 8b 3e 08 90              mov di, word ptr [0x9008]
05120: 83 3d 00                 cmp word ptr [di], 0
05123: 74 20                    je 0x5145

; basic_block_04B00

; basic_block_0558E
0558E: e8 c0 b4                 call 0xa51
05591: be b6 3c                 mov si, 0x3cb6
05594: b9 14 00                 mov cx, 0x14
05597: ff 04                    inc word ptr [si]
05599: 83 c6 0c                 add si, 0xc
0559C: e2 f9                    loop 0x5597
0559E: 83 3e b6 3c 00           cmp word ptr [0x3cb6], 0
055A3: 74 08                    je 0x55ad

; basic_block_04B03

; basic_block_05510
05510: c7 06 9a 3c 06 01        mov word ptr [0x3c9a], 0x106
05516: c7 06 9c 3c 88 00        mov word ptr [0x3c9c], 0x88
0551C: c7 06 9e 3c 00 f7        mov word ptr [0x3c9e], 0xf700
05522: e8 2c b5                 call 0xa51
05525: e8 69 01                 call 0x5691
05528: e8 8d 01                 call 0x56b8
0552B: e8 65 b7                 call 0xc93
0552E: e8 aa ff                 call 0x54db
05531: 81 3e 9a 3c 1c 01        cmp word ptr [0x3c9a], 0x11c
05537: 74 0c                    je 0x5545

; basic_block_04B06

; basic_block_0576D
0576D: e8 01 b5                 call 0xc71
05770: c7 06 46 8f 37 00        mov word ptr [0x8f46], 0x37
05776: c7 06 48 8f 76 00        mov word ptr [0x8f48], 0x76
0577C: c3                       ret

; basic_block_04B09

; basic_block_04B13
04B13: be a6 3d                 mov si, 0x3da6
04B16: 83 3e 1c 99 05           cmp word ptr [0x991c], 5
04B1B: 75 21                    jne 0x4b3e

; basic_block_04B10
04B10: e9 c1 00                 jmp 0x4bd4

; basic_block_04E12
04E12: be b6 3c                 mov si, 0x3cb6
04E15: c7 44 06 1a 00           mov word ptr [si + 6], 0x1a
04E1A: c7 44 08 e8 3a           mov word ptr [si + 8], 0x3ae8
04E1F: 83 c6 0c                 add si, 0xc
04E22: 81 fe 9a 3d              cmp si, 0x3d9a
04E26: 7c ed                    jl 0x4e15

; basic_block_04AFB

; basic_block_0409E
0409E: b4 02                    mov ah, 2
040A0: b0 00                    mov al, 0
040A2: cd 80                    int 0x80
040A4: e9 7f fc                 jmp 0x3d26

; basic_block_0409B
0409B: e9 88 fc                 jmp 0x3d26

; basic_block_04071
04071: 80 bf 5f 8f 00           cmp byte ptr [bx - 0x70a1], 0
04076: 74 06                    je 0x407e

; basic_block_0376E
0376E: c3                       ret

; basic_block_03765
03765: ff 74 0a                 push word ptr [si + 0xa]
03768: e8 35 d0                 call 0x7a0
0376B: 5e                       pop si
0376C: eb f2                    jmp 0x3760

; basic_block_04152

; basic_block_04155

; basic_block_0415F
0415F: e8 e1 d9                 call 0x1b43
04162: c6 06 5f 8f 00           mov byte ptr [0x8f5f], 0
04167: c6 06 60 8f 00           mov byte ptr [0x8f60], 0
0416C: e8 f3 d8                 call 0x1a62
0416F: e8 13 c8                 call 0x985
04172: e8 9a c6                 call 0x80f
04175: e8 b7 c8                 call 0xa2f
04178: e8 b0 cc                 call 0xe2b
0417B: e8 03 cc                 call 0xd81
0417E: 80 3e 54 8f 00           cmp byte ptr [0x8f54], 0
04183: 75 03                    jne 0x4188

; basic_block_0415C
0415C: e8 c3 e9                 call 0x2b22

; basic_block_040EB

; basic_block_040F2

; basic_block_040F9

; basic_block_04100

; basic_block_04103

; basic_block_0410D
0410D: b4 02                    mov ah, 2
0410F: b0 00                    mov al, 0
04111: cd 80                    int 0x80
04113: e9 10 fc                 jmp 0x3d26

; basic_block_0410A
0410A: e9 19 fc                 jmp 0x3d26

; basic_block_03325
03325: c3                       ret

; basic_block_03320
03320: 57                       push di
03321: e8 a8 f8                 call 0x2bcc
03324: 5f                       pop di

; basic_block_029E7
029E7: 3d 34 00                 cmp ax, 0x34
029EA: 75 03                    jne 0x29ef

; basic_block_029E4
029E4: e9 bf 02                 jmp 0x2ca6

; basic_block_0308C
0308C: 83 3e 48 91 44           cmp word ptr [0x9148], 0x44
03091: 75 03                    jne 0x3096

; basic_block_0100E
0100E: bd 38 91                 mov bp, 0x9138
01011: b9 04 00                 mov cx, 4
01014: 3e 83 7e 00 00           cmp word ptr ds:[bp], 0
01019: 74 06                    je 0x1021

; basic_block_0311A

; basic_block_03122
03122: 33 c0                    xor ax, ax
03124: c3                       ret

; basic_block_0311C
0311C: b8 ff ff                 mov ax, 0xffff
0311F: 85 c0                    test ax, ax
03121: c3                       ret

; basic_block_03255

; basic_block_0325B

; basic_block_032D4
032D4: 56                       push si
032D5: e8 4a dd                 call 0x1022
032D8: 57                       push di
032D9: bf 96 90                 mov di, 0x9096
032DC: e8 af d4                 call 0x78e
032DF: 5f                       pop di
032E0: c7 04 40 00              mov word ptr [si], 0x40
032E4: c7 44 02 e9 21           mov word ptr [si + 2], 0x21e9
032E9: c7 44 04 53 08           mov word ptr [si + 4], 0x853
032EE: c6 44 4a ff              mov byte ptr [si + 0x4a], 0xff
032F2: bd 66 13                 mov bp, 0x1366
032F5: 2e 8b 46 00              mov ax, word ptr cs:[bp]
032F9: 89 44 0c                 mov word ptr [si + 0xc], ax
032FC: 2e 8b 46 02              mov ax, word ptr cs:[bp + 2]
03300: 89 44 0e                 mov word ptr [si + 0xe], ax
03303: 83 c5 04                 add bp, 4
03306: 89 6c 10                 mov word ptr [si + 0x10], bp
03309: 89 7c 1c                 mov word ptr [si + 0x1c], di
0330C: 8b 45 12                 mov ax, word ptr [di + 0x12]
0330F: 89 44 12                 mov word ptr [si + 0x12], ax
03312: 8b 45 16                 mov ax, word ptr [di + 0x16]
03315: 89 44 16                 mov word ptr [si + 0x16], ax
03318: 5e                       pop si

; basic_block_031C5

; basic_block_031CB

; basic_block_03243

; basic_block_02F07
02F07: c3                       ret

; basic_block_02F04
02F04: ff 45 34                 inc word ptr [di + 0x34]

; basic_block_02E73
02E73: 83 3e 48 91 00           cmp word ptr [0x9148], 0
02E78: 74 09                    je 0x2e83

; basic_block_02E8E

; basic_block_02E92

; basic_block_02E98

; basic_block_02D28
02D28: c3                       ret

; basic_block_02D25
02D25: ff 45 34                 inc word ptr [di + 0x34]

; basic_block_02CBE
02CBE: 83 3e 48 91 44           cmp word ptr [0x9148], 0x44
02CC3: 75 0f                    jne 0x2cd4

; basic_block_02CB5
02CB5: 56                       push si
02CB6: 8b 36 4e 91              mov si, word ptr [0x914e]
02CBA: e8 03 db                 call 0x7c0
02CBD: 5e                       pop si

; basic_block_02C30
02C30: c3                       ret

; basic_block_02C2D
02C2D: ff 45 34                 inc word ptr [di + 0x34]

; basic_block_02C4A
02C4A: c7 06 34 91 c0 00        mov word ptr [0x9134], 0xc0
02C50: 56                       push si
02C51: e8 ce e3                 call 0x1022
02C54: bf fe 8f                 mov di, 0x8ffe
02C57: e8 22 db                 call 0x77c
02C5A: 89 36 36 91              mov word ptr [0x9136], si
02C5E: c7 04 c0 00              mov word ptr [si], 0xc0
02C62: c7 44 02 f7 20           mov word ptr [si + 2], 0x20f7
02C67: c7 44 04 53 08           mov word ptr [si + 4], 0x853
02C6C: c7 44 06 34 91           mov word ptr [si + 6], 0x9134
02C71: c7 44 0c 58 a6           mov word ptr [si + 0xc], 0xa658
02C76: c7 44 0e 00 00           mov word ptr [si + 0xe], 0
02C7B: a1 12 9f                 mov ax, word ptr [0x9f12]
02C7E: 89 44 12                 mov word ptr [si + 0x12], ax
02C81: a1 16 9f                 mov ax, word ptr [0x9f16]
02C84: 89 44 16                 mov word ptr [si + 0x16], ax
02C87: c7 44 34 00 00           mov word ptr [si + 0x34], 0
02C8C: c7 44 24 02 00           mov word ptr [si + 0x24], 2
02C91: c7 44 36 0e 00           mov word ptr [si + 0x36], 0xe
02C96: c7 44 48 ff ff           mov word ptr [si + 0x48], 0xffff
02C9B: 8b fe                    mov di, si
02C9D: 5e                       pop si
02C9E: c7 06 30 91 08 00        mov word ptr [0x9130], 8
02CA4: c3                       ret

; basic_block_02C41
02C41: 56                       push si
02C42: 8b 36 36 91              mov si, word ptr [0x9136]
02C46: e8 77 db                 call 0x7c0
02C49: 5e                       pop si

; basic_block_05AC7
05AC7: 8a 01                    mov al, byte ptr [bx + di]
05AC9: 3e 88 46 00              mov byte ptr ds:[bp], al
05ACD: 53                       push bx
05ACE: 55                       push bp
05ACF: 57                       push di
05AD0: 52                       push dx
05AD1: 51                       push cx
05AD2: 50                       push ax
05AD3: e8 69 b0                 call 0xb3f
05AD6: 58                       pop ax
05AD7: 59                       pop cx
05AD8: 5a                       pop dx
05AD9: 5f                       pop di
05ADA: 5d                       pop bp
05ADB: 5b                       pop bx
05ADC: 80 3e 5b 8f 00           cmp byte ptr [0x8f5b], 0
05AE1: 75 0d                    jne 0x5af0

; basic_block_05AC5
05AC5: 33 ff                    xor di, di

; basic_block_054D5
054D5: ba a8 00                 mov dx, 0xa8
054D8: e9 52 b7                 jmp 0xc2d

; basic_block_054C5
054C5: b9 2d 00                 mov cx, 0x2d
054C8: be f4 e7                 mov si, 0xe7f4
054CB: 80 3e de 3a 00           cmp byte ptr [0x3ade], 0
054D0: 75 03                    jne 0x54d5

; basic_block_00C2D
00C2D: 8b 2e 44 30              mov bp, word ptr [0x3044]
00C31: d1 e5                    shl bp, 1
00C33: d1 e5                    shl bp, 1
00C35: 2e ff 9e 3b 0c           lcall cs:[bp + 0xc3b]
00C3A: c3                       ret

; basic_block_00B2A

; basic_block_056EC
056EC: 83 3d 02                 cmp word ptr [di], 2
056EF: 7f 14                    jg 0x5705

; basic_block_056C4
056C4: 83 3d f8                 cmp word ptr [di], -8
056C7: 74 0b                    je 0x56d4

; basic_block_00CA0

; basic_block_00CC2

; basic_block_04C92
04C92: e8 7d 09                 call 0x5612
04C95: e8 62 00                 call 0x4cfa
04C98: e8 72 00                 call 0x4d0d
04C9B: 83 3e 3c 8f 00           cmp word ptr [0x8f3c], 0
04CA0: 75 b7                    jne 0x4c59

; basic_block_04C83
04C83: 83 2e 3e 8f 04           sub word ptr [0x8f3e], 4
04C88: 74 08                    je 0x4c92

; basic_block_04C6C
04C6C: b4 01                    mov ah, 1
04C6E: cd 80                    int 0x80
04C70: b4 02                    mov ah, 2
04C72: b0 01                    mov al, 1
04C74: cd 80                    int 0x80
04C76: c7 06 3c 8f 00 00        mov word ptr [0x8f3c], 0

; basic_block_04C6A
04C6A: 75 10                    jne 0x4c7c

; basic_block_05145
05145: c7 44 06 00 00           mov word ptr [si + 6], 0
0514A: 83 c6 0c                 add si, 0xc
0514D: 81 fe 9a 3d              cmp si, 0x3d9a
05151: 7e f2                    jle 0x5145

; basic_block_05125
05125: 81 3d 94 00              cmp word ptr [di], 0x94
05129: 74 15                    je 0x5140

; basic_block_05591

; basic_block_055AD
055AD: be b6 3c                 mov si, 0x3cb6
055B0: b9 14 00                 mov cx, 0x14
055B3: c7 04 01 00              mov word ptr [si], 1
055B7: 83 c6 0c                 add si, 0xc
055BA: e2 f7                    loop 0x55b3
055BC: b9 05 00                 mov cx, 5
055BF: 51                       push cx
055C0: eb 04                    jmp 0x55c6

; basic_block_055A5
055A5: e8 10 01                 call 0x56b8
055A8: e8 e8 b6                 call 0xc93
055AB: eb e1                    jmp 0x558e

; basic_block_05525

; basic_block_05691
05691: be b6 3c                 mov si, 0x3cb6
05694: b9 14 00                 mov cx, 0x14
05697: 83 7c 06 00              cmp word ptr [si + 6], 0
0569B: 75 06                    jne 0x56a3

; basic_block_05528

; basic_block_0552B

; basic_block_0552E

; basic_block_054DB
054DB: 36 ff 36 10 00           push word ptr ss:[0x10]
054E0: 36 c7 06 10 00 68 00     mov word ptr ss:[0x10], 0x68
054E7: 8b 0e 9a 3c              mov cx, word ptr [0x3c9a]
054EB: 8b 16 9c 3c              mov dx, word ptr [0x3c9c]
054EF: 8b 36 9e 3c              mov si, word ptr [0x3c9e]
054F3: e8 7f b3                 call 0x875
054F6: 36 8f 06 10 00           pop word ptr ss:[0x10]
054FB: c3                       ret

; basic_block_05531

; basic_block_05545
05545: c7 06 9e 3c 90 f9        mov word ptr [0x3c9e], 0xf990
0554B: b9 06 00                 mov cx, 6
0554E: e8 ab ff                 call 0x54fc
05551: b4 01                    mov ah, 1
05553: cd 80                    int 0x80
05555: c7 06 88 8e 08 00        mov word ptr [0x8e88], 8
0555B: c6 06 df 3a 00           mov byte ptr [0x3adf], 0
05560: c7 06 9e 3c 00 f7        mov word ptr [0x3c9e], 0xf700
05566: b9 06 00                 mov cx, 6
05569: e8 90 ff                 call 0x54fc
0556C: e8 e2 b4                 call 0xa51
0556F: e8 1f 01                 call 0x5691
05572: e8 43 01                 call 0x56b8
05575: e8 1b b7                 call 0xc93
05578: e8 60 ff                 call 0x54db
0557B: 83 2e 9a 3c 02           sub word ptr [0x3c9a], 2
05580: 83 06 9c 3c 02           add word ptr [0x3c9c], 2
05585: 81 3e 9a 3c 06 01        cmp word ptr [0x3c9a], 0x106
0558B: 7f df                    jg 0x556c

; basic_block_05539
05539: 83 06 9a 3c 02           add word ptr [0x3c9a], 2
0553E: 83 2e 9c 3c 02           sub word ptr [0x3c9c], 2
05543: eb dd                    jmp 0x5522

; basic_block_00C71
00C71: 8b 2e 44 30              mov bp, word ptr [0x3044]
00C75: d1 e5                    shl bp, 1
00C77: d1 e5                    shl bp, 1
00C79: 2e ff 9e 7f 0c           lcall cs:[bp + 0xc7f]
00C7E: c3                       ret

; basic_block_05770

; basic_block_04B3E
04B3E: e8 46 0c                 call 0x5787
04B41: e8 10 06                 call 0x5154
04B44: e8 89 0a                 call 0x55d0
04B47: c6 06 de 3a 00           mov byte ptr [0x3ade], 0
04B4C: c7 06 42 8f 01 00        mov word ptr [0x8f42], 1
04B52: c7 06 44 8f 04 00        mov word ptr [0x8f44], 4
04B58: e8 2d 09                 call 0x5488
04B5B: e8 da 01                 call 0x4d38
04B5E: e8 2d 0a                 call 0x558e
04B61: e8 09 0c                 call 0x576d
04B64: be c4 3d                 mov si, 0x3dc4
04B67: e8 1d 0c                 call 0x5787
04B6A: e8 0b 03                 call 0x4e78
04B6D: e8 60 0a                 call 0x55d0
04B70: c7 06 88 8e 07 00        mov word ptr [0x8e88], 7
04B76: e8 34 01                 call 0x4cad
04B79: c7 06 88 8e 00 00        mov word ptr [0x8e88], 0
04B7F: e8 cf be                 call 0xa51
04B82: e8 42 00                 call 0x4bc7
04B85: e8 8a 0a                 call 0x5612
04B88: e8 c6 be                 call 0xa51
04B8B: e8 84 0a                 call 0x5612
04B8E: e8 ce c1                 call 0xd5f
04B91: e8 55 c0                 call 0xbe9
04B94: 36 c7 06 10 00 bf 00     mov word ptr ss:[0x10], 0xbf
04B9B: e8 7b e7                 call 0x3319
04B9E: e8 51 ea                 call 0x35f2
04BA1: 80 3e 61 8f 00           cmp byte ptr [0x8f61], 0
04BA6: 75 18                    jne 0x4bc0

; basic_block_04B1D
04B1D: be 82 3e                 mov si, 0x3e82
04B20: e8 64 0c                 call 0x5787
04B23: b9 11 00                 mov cx, 0x11
04B26: e8 d3 09                 call 0x54fc
04B29: e8 41 0c                 call 0x576d
04B2C: be a6 3e                 mov si, 0x3ea6
04B2F: e8 55 0c                 call 0x5787
04B32: b9 11 00                 mov cx, 0x11
04B35: e8 c4 09                 call 0x54fc
04B38: e8 32 0c                 call 0x576d
04B3B: be b9 3e                 mov si, 0x3eb9

; basic_block_04BD4
04BD4: be 96 37                 mov si, 0x3796
04BD7: e8 ad 0b                 call 0x5787
04BDA: b9 1e 00                 mov cx, 0x1e
04BDD: e8 68 00                 call 0x4c48
04BE0: be b1 37                 mov si, 0x37b1
04BE3: e8 a1 0b                 call 0x5787
04BE6: b9 1e 00                 mov cx, 0x1e
04BE9: e8 5c 00                 call 0x4c48
04BEC: e8 7e 0b                 call 0x576d
04BEF: be d8 37                 mov si, 0x37d8
04BF2: e8 92 0b                 call 0x5787
04BF5: b9 11 00                 mov cx, 0x11
04BF8: e8 4d 00                 call 0x4c48
04BFB: e8 d2 09                 call 0x55d0
04BFE: c7 06 88 8e 07 00        mov word ptr [0x8e88], 7
04C04: e8 a6 00                 call 0x4cad
04C07: c7 06 88 8e 00 00        mov word ptr [0x8e88], 0
04C0D: e8 41 be                 call 0xa51
04C10: e8 b4 ff                 call 0x4bc7
04C13: e8 fc 09                 call 0x5612
04C16: e8 38 be                 call 0xa51
04C19: e8 f6 09                 call 0x5612
04C1C: e8 40 c1                 call 0xd5f
04C1F: c7 06 88 8e 00 00        mov word ptr [0x8e88], 0
04C25: b9 96 00                 mov cx, 0x96
04C28: 51                       push cx
04C29: e8 23 c0                 call 0xc4f
04C2C: e8 22 be                 call 0xa51
04C2F: e8 f9 c1                 call 0xe2b
04C32: e8 4c c1                 call 0xd81
04C35: 59                       pop cx
04C36: e2 f0                    loop 0x4c28
04C38: e8 24 c1                 call 0xd5f
04C3B: b9 50 00                 mov cx, 0x50
04C3E: 51                       push cx
04C3F: e8 0f be                 call 0xa51
04C42: 59                       pop cx
04C43: e2 f9                    loop 0x4c3e
04C45: e9 46 ff                 jmp 0x4b8e

; basic_block_04E15

; basic_block_04E28
04E28: c3                       ret

; basic_block_0376B

; basic_block_04162

; basic_block_0416F

; basic_block_04172

; basic_block_04175

; basic_block_04178

; basic_block_0417B

; basic_block_0417E

; basic_block_04188
04188: b4 02                    mov ah, 2
0418A: b0 00                    mov al, 0
0418C: cd 80                    int 0x80
0418E: e9 95 fb                 jmp 0x3d26

; basic_block_04185
04185: e9 9e fb                 jmp 0x3d26

; basic_block_03324

; basic_block_029EF
029EF: 3d 2c 00                 cmp ax, 0x2c
029F2: 75 03                    jne 0x29f7

; basic_block_029EC
029EC: e9 57 08                 jmp 0x3246

; basic_block_03096
03096: 81 3e 4c 91 98 00        cmp word ptr [0x914c], 0x98
0309C: 75 0f                    jne 0x30ad

; basic_block_03093
03093: e9 62 fe                 jmp 0x2ef8

; basic_block_01021
01021: c3                       ret

; basic_block_0101B
0101B: 83 c5 04                 add bp, 4
0101E: e2 f4                    loop 0x1014
01020: 49                       dec cx

; basic_block_032D8

; basic_block_032DF

; basic_block_02E83
02E83: c3                       ret

; basic_block_02E7A
02E7A: 56                       push si
02E7B: 8b 36 4a 91              mov si, word ptr [0x914a]
02E7F: e8 3e d9                 call 0x7c0
02E82: 5e                       pop si

; basic_block_02CD4
02CD4: 56                       push si
02CD5: e8 4a e3                 call 0x1022
02CD8: bf fe 8f                 mov di, 0x8ffe
02CDB: e8 9e da                 call 0x77c
02CDE: c7 06 4c 91 98 00        mov word ptr [0x914c], 0x98
02CE4: 89 36 4e 91              mov word ptr [0x914e], si
02CE8: c7 04 98 00              mov word ptr [si], 0x98
02CEC: c7 44 02 01 38           mov word ptr [si + 2], 0x3801
02CF1: c7 44 04 61 07           mov word ptr [si + 4], 0x761
02CF6: c7 44 06 4c 91           mov word ptr [si + 6], 0x914c
02CFB: c7 44 34 00 00           mov word ptr [si + 0x34], 0
02D00: c7 44 24 02 00           mov word ptr [si + 0x24], 2
02D05: c7 44 36 0a 00           mov word ptr [si + 0x36], 0xa
02D0A: c7 44 48 ff ff           mov word ptr [si + 0x48], 0xffff
02D0F: 8b fe                    mov di, si
02D11: 5e                       pop si
02D12: c7 06 30 91 08 00        mov word ptr [0x9130], 8
02D18: c3                       ret

; basic_block_02CC5
02CC5: 56                       push si
02CC6: 8b 36 4a 91              mov si, word ptr [0x914a]
02CCA: e8 f3 da                 call 0x7c0
02CCD: 5e                       pop si
02CCE: c7 06 48 91 00 00        mov word ptr [0x9148], 0

; basic_block_02CBD

; basic_block_02C54

; basic_block_02C5A

; basic_block_02C49

; basic_block_05AD6

; basic_block_05AE3
05AE3: a0 59 8f                 mov al, byte ptr [0x8f59]
05AE6: 24 0c                    and al, 0xc
05AE8: 3a c4                    cmp al, ah
05AEA: 75 a3                    jne 0x5a8f

; basic_block_054D2
054D2: be f0 e5                 mov si, 0xe5f0

; basic_block_00C3A

; basic_block_05705
05705: 5b                       pop bx
05706: 53                       push bx
05707: 83 e3 01                 and bx, 1
0570A: d1 e3                    shl bx, 1
0570C: 8b b7 b2 3c              mov si, word ptr [bx + 0x3cb2]
05710: 8b 4d 02                 mov cx, word ptr [di + 2]
05713: 8b 55 04                 mov dx, word ptr [di + 4]
05716: 57                       push di
05717: e8 5b b1                 call 0x875
0571A: 5f                       pop di
0571B: 8b 5d 08                 mov bx, word ptr [di + 8]
0571E: 8b 37                    mov si, word ptr [bx]
05720: 83 c3 02                 add bx, 2
05723: 85 f6                    test si, si
05725: 75 07                    jne 0x572e

; basic_block_056F1
056F1: 75 0d                    jne 0x5700

; basic_block_056D4
056D4: 57                       push di
056D5: 8b 4d 02                 mov cx, word ptr [di + 2]
056D8: 8b 55 04                 mov dx, word ptr [di + 4]
056DB: 8b 1d                    mov bx, word ptr [di]
056DD: 83 c3 09                 add bx, 9
056E0: d1 e3                    shl bx, 1
056E2: 8b b7 a0 3c              mov si, word ptr [bx + 0x3ca0]
056E6: e8 8c b1                 call 0x875
056E9: 5f                       pop di
056EA: eb 75                    jmp 0x5761

; basic_block_056C9
056C9: e8 0b b6                 call 0xcd7
056CC: 83 3d 00                 cmp word ptr [di], 0
056CF: 75 03                    jne 0x56d4

; basic_block_04C95

; basic_block_04CFA
04CFA: ba 04 00                 mov dx, 4
04CFD: be 44 b1                 mov si, 0xb144
04D00: f7 06 3c 8f 04 00        test word ptr [0x8f3c], 4
04D06: 74 16                    je 0x4d1e

; basic_block_04C98

; basic_block_04D0D
04D0D: ba 6d 00                 mov dx, 0x6d
04D10: be 44 b1                 mov si, 0xb144
04D13: f7 06 3e 8f 04 00        test word ptr [0x8f3e], 4
04D19: 74 03                    je 0x4d1e

; basic_block_04C9B

; basic_block_04CA2
04CA2: 83 3e 3e 8f 00           cmp word ptr [0x8f3e], 0
04CA7: 75 b0                    jne 0x4c59

; basic_block_04C8A
04C8A: 79 06                    jns 0x4c92

; basic_block_05153
05153: c3                       ret

; basic_block_05140
05140: 8b 7d 0a                 mov di, word ptr [di + 0xa]
05143: eb db                    jmp 0x5120

; basic_block_0512B
0512B: 8b 5d 36                 mov bx, word ptr [di + 0x36]
0512E: 89 5c 06                 mov word ptr [si + 6], bx
05131: 89 7c 0a                 mov word ptr [si + 0xa], di
05134: d1 e3                    shl bx, 1
05136: 8b 87 98 38              mov ax, word ptr [bx + 0x3898]
0513A: 89 44 08                 mov word ptr [si + 8], ax
0513D: 83 c6 0c                 add si, 0xc

; basic_block_055C6
055C6: e8 ef 00                 call 0x56b8
055C9: e8 c7 b6                 call 0xc93
055CC: 59                       pop cx
055CD: e2 f3                    loop 0x55c2
055CF: c3                       ret

; basic_block_055A8

; basic_block_055AB

; basic_block_056A3
056A3: ff 0c                    dec word ptr [si]
056A5: 7f 0b                    jg 0x56b2

; basic_block_0569D
0569D: c7 04 00 00              mov word ptr [si], 0
056A1: eb 0f                    jmp 0x56b2

; basic_block_054F6

; basic_block_054FC
054FC: 51                       push cx
054FD: e8 51 b5                 call 0xa51
05500: e8 8e 01                 call 0x5691
05503: e8 b2 01                 call 0x56b8
05506: e8 8a b7                 call 0xc93
05509: e8 cf ff                 call 0x54db
0550C: 59                       pop cx
0550D: e2 ed                    loop 0x54fc
0550F: c3                       ret

; basic_block_05551

; basic_block_0556C

; basic_block_0556F

; basic_block_05572

; basic_block_05575

; basic_block_05578

; basic_block_0557B

; basic_block_0558D
0558D: c3                       ret

; basic_block_05522

; basic_block_00C7E

; basic_block_05787
05787: c6 06 40 8f ff           mov byte ptr [0x8f40], 0xff
0578C: 56                       push si
0578D: e8 01 ff                 call 0x5691
05790: e8 25 ff                 call 0x56b8
05793: e8 fd b4                 call 0xc93
05796: e8 b8 b2                 call 0xa51
05799: 5e                       pop si
0579A: e8 f4 e9                 call 0x4191
0579D: 25 03 00                 and ax, 3
057A0: 74 f8                    je 0x579a

; basic_block_04B41

; basic_block_05154
05154: c7 06 42 8f 00 00        mov word ptr [0x8f42], 0
0515A: c7 06 44 8f 00 00        mov word ptr [0x8f44], 0
05160: c7 06 18 38 ff ff        mov word ptr [0x3818], 0xffff
05166: e8 cc 02                 call 0x5435
05169: c7 06 b2 39 ff ff        mov word ptr [0x39b2], 0xffff
0516F: c6 06 5b 8f 00           mov byte ptr [0x8f5b], 0
05174: e8 f2 01                 call 0x5369
05177: 83 3e 44 8f 04           cmp word ptr [0x8f44], 4
0517C: 74 57                    je 0x51d5

; basic_block_04B44

; basic_block_055D0
055D0: be b6 3c                 mov si, 0x3cb6
055D3: b9 14 00                 mov cx, 0x14
055D6: c7 04 00 00              mov word ptr [si], 0
055DA: 83 c6 0c                 add si, 0xc
055DD: e2 f7                    loop 0x55d6
055DF: e8 6f b4                 call 0xa51
055E2: be b6 3c                 mov si, 0x3cb6
055E5: b9 14 00                 mov cx, 0x14
055E8: ff 0c                    dec word ptr [si]
055EA: 83 c6 0c                 add si, 0xc
055ED: e2 f9                    loop 0x55e8
055EF: 83 3e b6 3c f7           cmp word ptr [0x3cb6], -9
055F4: 74 08                    je 0x55fe

; basic_block_04B47

; basic_block_04B5B

; basic_block_04D38
04D38: 8b 1e 16 38              mov bx, word ptr [0x3816]
04D3C: d1 e3                    shl bx, 1
04D3E: 8b 87 d0 38              mov ax, word ptr [bx + 0x38d0]
04D42: 83 3e 1c 99 05           cmp word ptr [0x991c], 5
04D47: 75 02                    jne 0x4d4b

; basic_block_04B5E

; basic_block_04B61

; basic_block_04B64

; basic_block_04B6A

; basic_block_04E78
04E78: c7 06 42 8f 00 00        mov word ptr [0x8f42], 0
04E7E: c7 06 44 8f 00 00        mov word ptr [0x8f44], 0
04E84: c7 06 18 38 ff ff        mov word ptr [0x3818], 0xffff
04E8A: e8 a8 05                 call 0x5435
04E8D: c7 06 b2 39 ff ff        mov word ptr [0x39b2], 0xffff
04E93: c6 06 5b 8f 00           mov byte ptr [0x8f5b], 0
04E98: e8 ce 04                 call 0x5369
04E9B: 83 3e 44 8f 04           cmp word ptr [0x8f44], 4
04EA0: 74 7e                    je 0x4f20

; basic_block_04B6D

; basic_block_04B70

; basic_block_04CAD
04CAD: e8 c1 bf                 call 0xc71
04CB0: e8 9e bd                 call 0xa51
04CB3: 83 3e 3e 8f 44           cmp word ptr [0x8f3e], 0x44
04CB8: 74 12                    je 0x4ccc

; basic_block_04B79

; basic_block_04B82

; basic_block_04B85

; basic_block_04B88

; basic_block_04B8B

; basic_block_04B8E

; basic_block_04B91

; basic_block_04B94

; basic_block_04B9E

; basic_block_04BA1

; basic_block_04BC0
04BC0: c7 06 b2 91 0c 00        mov word ptr [0x91b2], 0xc
04BC6: c3                       ret

; basic_block_04BA8
04BA8: a1 48 30                 mov ax, word ptr [0x3048]
04BAB: 3b 06 48 30              cmp ax, word ptr [0x3048]
04BAF: 74 fa                    je 0x4bab

; basic_block_04B23

; basic_block_04B29

; basic_block_04B2C

; basic_block_04B32

; basic_block_04B38

; basic_block_04B3B

; basic_block_04BDA

; basic_block_04C48
04C48: 51                       push cx
04C49: e8 47 c0                 call 0xc93
04C4C: e8 42 0a                 call 0x5691
04C4F: e8 66 0a                 call 0x56b8
04C52: e8 fc bd                 call 0xa51
04C55: 59                       pop cx
04C56: e2 f0                    loop 0x4c48
04C58: c3                       ret

; basic_block_04BE0

; basic_block_04BE6

; basic_block_04BEC

; basic_block_04BEF

; basic_block_04BF5

; basic_block_04BFB

; basic_block_04BFE

; basic_block_04C07

; basic_block_04C10

; basic_block_04C13

; basic_block_04C16

; basic_block_04C19

; basic_block_04C1C

; basic_block_04C1F

; basic_block_00C4F
00C4F: 8b 2e 44 30              mov bp, word ptr [0x3044]
00C53: d1 e5                    shl bp, 1
00C55: d1 e5                    shl bp, 1
00C57: 2e ff 9e 5d 0c           lcall cs:[bp + 0xc5d]
00C5C: c3                       ret

; basic_block_04C2C

; basic_block_04C2F

; basic_block_04C32

; basic_block_04C35

; basic_block_04C3B

; basic_block_04C42

; basic_block_029F7
029F7: 3d 20 00                 cmp ax, 0x20
029FA: 75 03                    jne 0x29ff

; basic_block_029F4
029F4: e9 8d 04                 jmp 0x2e84

; basic_block_030AD
030AD: e8 c3 fd                 call 0x2e73
030B0: 56                       push si
030B1: e8 6e df                 call 0x1022
030B4: bf fe 8f                 mov di, 0x8ffe
030B7: e8 c2 d6                 call 0x77c
030BA: 8b fe                    mov di, si
030BC: 5e                       pop si
030BD: c7 06 48 91 44 00        mov word ptr [0x9148], 0x44
030C3: 89 3e 4a 91              mov word ptr [0x914a], di
030C7: c7 05 44 00              mov word ptr [di], 0x44
030CB: c7 45 02 35 38           mov word ptr [di + 2], 0x3835
030D0: c7 45 04 53 08           mov word ptr [di + 4], 0x853
030D5: c7 45 06 48 91           mov word ptr [di + 6], 0x9148
030DA: bd f8 12                 mov bp, 0x12f8
030DD: 2e 8b 46 00              mov ax, word ptr cs:[bp]
030E1: 89 45 0c                 mov word ptr [di + 0xc], ax
030E4: 2e 8b 46 02              mov ax, word ptr cs:[bp + 2]
030E8: 89 45 0e                 mov word ptr [di + 0xe], ax
030EB: 83 c5 04                 add bp, 4
030EE: 89 6d 10                 mov word ptr [di + 0x10], bp
030F1: a1 12 9f                 mov ax, word ptr [0x9f12]
030F4: 89 45 12                 mov word ptr [di + 0x12], ax
030F7: a1 16 9f                 mov ax, word ptr [0x9f16]
030FA: 89 45 16                 mov word ptr [di + 0x16], ax
030FD: c7 45 1a 00 00           mov word ptr [di + 0x1a], 0
03102: c7 45 34 00 00           mov word ptr [di + 0x34], 0
03107: c7 45 24 02 00           mov word ptr [di + 0x24], 2
0310C: c7 45 36 08 00           mov word ptr [di + 0x36], 8
03111: c7 45 48 ff ff           mov word ptr [di + 0x48], 0xffff
03116: c3                       ret

; basic_block_0309E
0309E: 56                       push si
0309F: 8b 36 4e 91              mov si, word ptr [0x914e]
030A3: e8 1a d7                 call 0x7c0
030A6: 5e                       pop si
030A7: c7 06 4c 91 00 00        mov word ptr [0x914c], 0

; basic_block_02E82

; basic_block_02CD8

; basic_block_02CDE

; basic_block_02CCD

; basic_block_05AEC
05AEC: e2 d9                    loop 0x5ac7
05AEE: eb c6                    jmp 0x5ab6

; basic_block_0571A

; basic_block_0572E
0572E: 89 5d 08                 mov word ptr [di + 8], bx
05731: 8b 4d 02                 mov cx, word ptr [di + 2]
05734: 8b 55 04                 mov dx, word ptr [di + 4]
05737: 06                       push es
05738: b8 9b 34                 mov ax, 0x349b
0573B: 8e c0                    mov es, ax
0573D: 26 03 0c                 add cx, word ptr es:[si]
05740: 26 03 54 02              add dx, word ptr es:[si + 2]
05744: 26 8b 44 04              mov ax, word ptr es:[si + 4]
05748: d1 e8                    shr ax, 1
0574A: 2d 10 00                 sub ax, 0x10
0574D: 2b c8                    sub cx, ax
0574F: 26 8b 44 06              mov ax, word ptr es:[si + 6]
05753: 40                       inc ax
05754: d1 e8                    shr ax, 1
05756: 2d 0e 00                 sub ax, 0xe
05759: 2b d0                    sub dx, ax
0575B: 07                       pop es
0575C: 57                       push di
0575D: e8 15 b1                 call 0x875
05760: 5f                       pop di
05761: 83 c7 0c                 add di, 0xc
05764: 59                       pop cx
05765: e2 02                    loop 0x5769
05767: eb 03                    jmp 0x576c

; basic_block_05727
05727: 8b 1f                    mov bx, word ptr [bx]
05729: 8b 37                    mov si, word ptr [bx]
0572B: 83 c3 02                 add bx, 2

; basic_block_05700
05700: e8 d4 b5                 call 0xcd7
05703: eb 5c                    jmp 0x5761

; basic_block_056F3
056F3: 83 3e 88 8e 00           cmp word ptr [0x8e88], 0
056F8: 79 06                    jns 0x5700

; basic_block_056E9

; basic_block_05761

; basic_block_00CD7
00CD7: 8b 2e 44 30              mov bp, word ptr [0x3044]
00CDB: d1 e5                    shl bp, 1
00CDD: d1 e5                    shl bp, 1
00CDF: 2e ff 9e e5 0c           lcall cs:[bp + 0xce5]
00CE4: c3                       ret

; basic_block_056CC

; basic_block_056D1
056D1: e9 8d 00                 jmp 0x5761

; basic_block_04D1E
04D1E: 52                       push dx
04D1F: 56                       push si
04D20: b9 e2 00                 mov cx, 0xe2
04D23: e8 07 bf                 call 0xc2d
04D26: 5e                       pop si
04D27: 5a                       pop dx
04D28: 52                       push dx
04D29: 56                       push si
04D2A: b9 02 01                 mov cx, 0x102
04D2D: e8 fd be                 call 0xc2d
04D30: 5e                       pop si
04D31: 5a                       pop dx
04D32: b9 22 01                 mov cx, 0x122
04D35: e9 f5 be                 jmp 0xc2d

; basic_block_04D08
04D08: be ae b1                 mov si, 0xb1ae
04D0B: eb 11                    jmp 0x4d1e

; basic_block_04D1B
04D1B: be ae b1                 mov si, 0xb1ae

; basic_block_04CA9
04CA9: e8 c5 bf                 call 0xc71
04CAC: c3                       ret

; basic_block_04C8C
04C8C: c7 06 3e 8f 00 00        mov word ptr [0x8f3e], 0

; basic_block_05120

; basic_block_055C9

; basic_block_055CC

; basic_block_056B2
056B2: 83 c6 0c                 add si, 0xc
056B5: e2 e0                    loop 0x5697
056B7: c3                       ret

; basic_block_056A7
056A7: e8 e7 ea                 call 0x4191
056AA: 25 ff 00                 and ax, 0xff
056AD: 05 14 00                 add ax, 0x14
056B0: 89 04                    mov word ptr [si], ax

; basic_block_05500

; basic_block_05503

; basic_block_05506

; basic_block_05509

; basic_block_0550C

; basic_block_05790

; basic_block_05793

; basic_block_05796

; basic_block_05799

; basic_block_0579D

; basic_block_0579A

; basic_block_057A2
057A2: 48                       dec ax
057A3: 0d 80 00                 or ax, 0x80
057A6: 33 c0                    xor ax, ax
057A8: 8b fe                    mov di, si
057AA: 80 3d 00                 cmp byte ptr [di], 0
057AD: 74 0e                    je 0x57bd

; basic_block_05435
05435: 8b 1e 44 8f              mov bx, word ptr [0x8f44]
05439: 83 fb 04                 cmp bx, 4
0543C: 74 27                    je 0x5465

; basic_block_05169

; basic_block_05369
05369: 83 3e dc 3a 00           cmp word ptr [0x3adc], 0
0536E: 74 07                    je 0x5377

; basic_block_05177

; basic_block_051D5
051D5: 83 3e 42 8f 00           cmp word ptr [0x8f42], 0
051DA: 74 3a                    je 0x5216

; basic_block_0517E
0517E: a1 42 8f                 mov ax, word ptr [0x8f42]
05181: 8b 1e 44 8f              mov bx, word ptr [0x8f44]
05185: 3b 06 18 38              cmp ax, word ptr [0x3818]
05189: 75 06                    jne 0x5191

; basic_block_055E2

; basic_block_055FE
055FE: b9 0b 00                 mov cx, 0xb
05601: 51                       push cx
05602: eb 04                    jmp 0x5608

; basic_block_055F6
055F6: e8 bf 00                 call 0x56b8
055F9: e8 97 b6                 call 0xc93
055FC: eb e1                    jmp 0x55df

; basic_block_04D4B
04D4B: 99                       cdq
04D4C: 3b 16 5c 91              cmp dx, word ptr [0x915c]
04D50: 7c 0e                    jl 0x4d60

; basic_block_04D49
04D49: d1 e8                    shr ax, 1

; basic_block_04E8D

; basic_block_04E9B

; basic_block_04F20
04F20: 83 3e 42 8f 00           cmp word ptr [0x8f42], 0
04F25: 74 6b                    je 0x4f92

; basic_block_04EA2
04EA2: a1 42 8f                 mov ax, word ptr [0x8f42]
04EA5: 8b 1e 44 8f              mov bx, word ptr [0x8f44]
04EA9: 3b 06 18 38              cmp ax, word ptr [0x3818]
04EAD: 75 06                    jne 0x4eb5

; basic_block_04CB0

; basic_block_04CB3

; basic_block_04CCC
04CCC: 83 3e 3c 8f 30           cmp word ptr [0x8f3c], 0x30
04CD1: 74 12                    je 0x4ce5

; basic_block_04CBA
04CBA: 83 06 3e 8f 04           add word ptr [0x8f3e], 4
04CBF: 83 3e 3e 8f 44           cmp word ptr [0x8f3e], 0x44
04CC4: 7e 06                    jle 0x4ccc

; basic_block_04BAB

; basic_block_04BB1
04BB1: e8 d1 bd                 call 0x985
04BB4: e8 58 bc                 call 0x80f
04BB7: e8 97 be                 call 0xa51
04BBA: e8 6e c2                 call 0xe2b
04BBD: e8 c1 c1                 call 0xd81

; basic_block_04C4C

; basic_block_04C4F

; basic_block_04C52

; basic_block_04C55

; basic_block_00C5C

; basic_block_029FF
029FF: 3d 4c 00                 cmp ax, 0x4c
02A02: 75 03                    jne 0x2a07

; basic_block_029FC
029FC: e9 b7 07                 jmp 0x31b6

; basic_block_030B0

; basic_block_030B4

; basic_block_030BA

; basic_block_030A6

; basic_block_05760

; basic_block_0576C
0576C: c3                       ret

; basic_block_05703

; basic_block_056FA
056FA: c7 06 8a 8e 00 00        mov word ptr [0x8e8a], 0

; basic_block_00CE4

; basic_block_04D26

; basic_block_04D30

; basic_block_04CAC

; basic_block_056AA

; basic_block_057BD
057BD: 03 06 46 8f              add ax, word ptr [0x8f46]
057C1: 3d 4b 00                 cmp ax, 0x4b
057C4: 7e 03                    jle 0x57c9

; basic_block_057AF
057AF: 80 3d 20                 cmp byte ptr [di], 0x20
057B2: 74 09                    je 0x57bd

; basic_block_05465
05465: b9 04 00                 mov cx, 4
05468: be e0 dd                 mov si, 0xdde0
0546B: 83 3e 42 8f 00           cmp word ptr [0x8f42], 0
05470: 74 10                    je 0x5482

; basic_block_0543E
0543E: 8b eb                    mov bp, bx
05440: d1 e3                    shl bx, 1
05442: d1 e3                    shl bx, 1
05444: 03 dd                    add bx, bp
05446: 03 1e 42 8f              add bx, word ptr [0x8f42]
0544A: b8 0c 00                 mov ax, 0xc
0544D: f7 e3                    mul bx
0544F: 8b d8                    mov bx, ax
05451: 8b 8f b8 3c              mov cx, word ptr [bx + 0x3cb8]
05455: 8b 97 ba 3c              mov dx, word ptr [bx + 0x3cba]
05459: 83 c1 0a                 add cx, 0xa
0545C: 83 c2 1f                 add dx, 0x1f
0545F: be 82 b2                 mov si, 0xb282
05462: e9 c8 b7                 jmp 0xc2d

; basic_block_05377
05377: 80 3e 5b 8f 00           cmp byte ptr [0x8f5b], 0
0537C: 74 03                    je 0x5381

; basic_block_05370
05370: ff 0e dc 3a              dec word ptr [0x3adc]
05374: e9 9f 00                 jmp 0x5416

; basic_block_05216
05216: e8 6f 02                 call 0x5488
05219: c3                       ret

; basic_block_051DC
051DC: c7 06 18 38 ff ff        mov word ptr [0x3818], 0xffff
051E2: a1 b2 39                 mov ax, word ptr [0x39b2]
051E5: 85 c0                    test ax, ax
051E7: 78 86                    js 0x516f

; basic_block_05191
05191: 8b d3                    mov dx, bx
05193: d1 e3                    shl bx, 1
05195: d1 e3                    shl bx, 1
05197: 03 da                    add bx, dx
05199: 03 c3                    add ax, bx
0519B: bb 0c 00                 mov bx, 0xc
0519E: f7 e3                    mul bx
051A0: be b6 3c                 mov si, 0x3cb6
051A3: 03 f0                    add si, ax
051A5: 8b 44 06                 mov ax, word ptr [si + 6]
051A8: 85 c0                    test ax, ax
051AA: 74 c3                    je 0x516f

; basic_block_0518B
0518B: 3b 1e 1a 38              cmp bx, word ptr [0x381a]
0518F: 74 4b                    je 0x51dc

; basic_block_05608
05608: e8 ad 00                 call 0x56b8
0560B: e8 85 b6                 call 0xc93
0560E: 59                       pop cx
0560F: e2 f3                    loop 0x5604
05611: c3                       ret

; basic_block_055F9

; basic_block_055FC

; basic_block_055DF

; basic_block_04D60
04D60: be b6 3c                 mov si, 0x3cb6
04D63: 8b 2e 16 38              mov bp, word ptr [0x3816]
04D67: 83 c5 02                 add bp, 2
04D6A: 8b dd                    mov bx, bp
04D6C: 4b                       dec bx
04D6D: d1 e3                    shl bx, 1
04D6F: bf d0 38                 mov di, 0x38d0
04D72: 03 fb                    add di, bx
04D74: 81 c3 9a 38              add bx, 0x389a
04D78: 8b 05                    mov ax, word ptr [di]
04D7A: 83 3e 1c 99 05           cmp word ptr [0x991c], 5
04D7F: 75 02                    jne 0x4d83

; basic_block_04D52
04D52: 75 06                    jne 0x4d5a

; basic_block_04F92
04F92: e8 f3 04                 call 0x5488
04F95: c3                       ret

; basic_block_04F27
04F27: c7 06 18 38 ff ff        mov word ptr [0x3818], 0xffff
04F2D: 83 3e b2 39 00           cmp word ptr [0x39b2], 0
04F32: 79 03                    jns 0x4f37

; basic_block_04EB5
04EB5: 8b d3                    mov dx, bx
04EB7: d1 e3                    shl bx, 1
04EB9: d1 e3                    shl bx, 1
04EBB: 03 da                    add bx, dx
04EBD: 03 c3                    add ax, bx
04EBF: bb 0c 00                 mov bx, 0xc
04EC2: f7 e3                    mul bx
04EC4: be b6 3c                 mov si, 0x3cb6
04EC7: 03 f0                    add si, ax
04EC9: 8b 44 06                 mov ax, word ptr [si + 6]
04ECC: 85 c0                    test ax, ax
04ECE: 74 c3                    je 0x4e93

; basic_block_04EAF
04EAF: 3b 1e 1a 38              cmp bx, word ptr [0x381a]
04EB3: 74 72                    je 0x4f27

; basic_block_04CE5
04CE5: e8 2a 09                 call 0x5612
04CE8: e8 22 00                 call 0x4d0d
04CEB: e8 0c 00                 call 0x4cfa
04CEE: 83 3e 3e 8f 44           cmp word ptr [0x8f3e], 0x44
04CF3: 75 bb                    jne 0x4cb0

; basic_block_04CD3
04CD3: 83 06 3c 8f 04           add word ptr [0x8f3c], 4
04CD8: 83 3e 3c 8f 30           cmp word ptr [0x8f3c], 0x30
04CDD: 7e 06                    jle 0x4ce5

; basic_block_04CC6
04CC6: c7 06 3e 8f 44 00        mov word ptr [0x8f3e], 0x44

; basic_block_04BB4

; basic_block_04BB7

; basic_block_04BBA

; basic_block_04BBD

; basic_block_02A07
02A07: 3d 3c 00                 cmp ax, 0x3c
02A0A: 75 03                    jne 0x2a0f

; basic_block_02A04
02A04: e9 01 05                 jmp 0x2f08

; basic_block_057C9
057C9: 33 c0                    xor ax, ax
057CB: ac                       lodsb al, byte ptr [si]
057CC: 84 c0                    test al, al
057CE: 74 24                    je 0x57f4

; basic_block_057C6
057C6: e8 60 00                 call 0x5829

; basic_block_057B4
057B4: 80 3d 0d                 cmp byte ptr [di], 0xd
057B7: 74 04                    je 0x57bd

; basic_block_05482
05482: ba a8 00                 mov dx, 0xa8
05485: e9 a5 b7                 jmp 0xc2d

; basic_block_05472
05472: b9 2d 00                 mov cx, 0x2d
05475: be e8 e1                 mov si, 0xe1e8
05478: 80 3e de 3a 00           cmp byte ptr [0x3ade], 0
0547D: 75 03                    jne 0x5482

; basic_block_05381
05381: 80 3e 59 8f 00           cmp byte ptr [0x8f59], 0
05386: 75 03                    jne 0x538b

; basic_block_0537E
0537E: e9 a8 00                 jmp 0x5429

; basic_block_05416
05416: e8 7a b8                 call 0xc93
05419: e8 75 02                 call 0x5691
0541C: e8 99 02                 call 0x56b8
0541F: e8 2f b6                 call 0xa51
05422: ff 06 9c 91              inc word ptr [0x919c]
05426: e9 40 ff                 jmp 0x5369

; basic_block_05219

; basic_block_0516F

; basic_block_051E9
051E9: 99                       cdq
051EA: 01 06 5a 91              add word ptr [0x915a], ax
051EE: 11 16 5c 91              adc word ptr [0x915c], dx
051F2: c7 06 b2 39 ff ff        mov word ptr [0x39b2], 0xffff
051F8: e8 82 05                 call 0x577d
051FB: 8b 36 b4 39              mov si, word ptr [0x39b4]
051FF: c7 44 06 00 00           mov word ptr [si + 6], 0
05204: 8b 74 0a                 mov si, word ptr [si + 0xa]
05207: e8 7e e5                 call 0x3788
0520A: e8 60 05                 call 0x576d
0520D: be 80 39                 mov si, 0x3980
05210: e8 74 05                 call 0x5787
05213: e9 59 ff                 jmp 0x516f

; basic_block_051AC
051AC: a1 42 8f                 mov ax, word ptr [0x8f42]
051AF: a3 18 38                 mov word ptr [0x3818], ax
051B2: a1 44 8f                 mov ax, word ptr [0x8f44]
051B5: a3 1a 38                 mov word ptr [0x381a], ax
051B8: 56                       push si
051B9: 8b 44 06                 mov ax, word ptr [si + 6]
051BC: 8b 74 0a                 mov si, word ptr [si + 0xa]
051BF: c6 06 e1 3a ff           mov byte ptr [0x3ae1], 0xff
051C4: 8b 5c 34                 mov bx, word ptr [si + 0x34]
051C7: e8 4f 01                 call 0x5319
051CA: 5e                       pop si
051CB: e8 72 00                 call 0x5240
051CE: c6 06 e1 3a 00           mov byte ptr [0x3ae1], 0
051D3: eb 9a                    jmp 0x516f

; basic_block_0560B

; basic_block_0560E

; basic_block_04D83
04D83: 3b 06 4a 8f              cmp ax, word ptr [0x8f4a]
04D87: 7f 19                    jg 0x4da2

; basic_block_04D81
04D81: d1 e8                    shr ax, 1

; basic_block_04D5A
04D5A: c7 06 16 38 00 00        mov word ptr [0x3816], 0

; basic_block_04D54
04D54: 3b 06 5a 91              cmp ax, word ptr [0x915a]
04D58: 76 06                    jbe 0x4d60

; basic_block_04F95

; basic_block_04F37
04F37: e8 a9 00                 call 0x4fe3
04F3A: 74 44                    je 0x4f80

; basic_block_04F34
04F34: e9 5c ff                 jmp 0x4e93

; basic_block_04E93

; basic_block_04ED0
04ED0: 3d 1a 00                 cmp ax, 0x1a
04ED3: 74 1e                    je 0x4ef3

; basic_block_04CE8

; basic_block_04CEB

; basic_block_04CEE

; basic_block_04CF5
04CF5: b4 01                    mov ah, 1
04CF7: cd 80                    int 0x80
04CF9: c3                       ret

; basic_block_04CDF
04CDF: c7 06 3c 8f 30 00        mov word ptr [0x8f3c], 0x30

; basic_block_02A0F
02A0F: 3d 38 00                 cmp ax, 0x38
02A12: 75 03                    jne 0x2a17

; basic_block_02A0C
02A0C: e9 f5 05                 jmp 0x3004

; basic_block_02F08
02F08: 83 3e 48 91 4c           cmp word ptr [0x9148], 0x4c
02F0D: 74 e9                    je 0x2ef8

; basic_block_057F4
057F4: c6 06 40 8f 00           mov byte ptr [0x8f40], 0
057F9: c3                       ret

; basic_block_057D0
057D0: 3c 20                    cmp al, 0x20
057D2: 74 10                    je 0x57e4

; basic_block_05829
05829: b8 37 00                 mov ax, 0x37
0582C: a3 46 8f                 mov word ptr [0x8f46], ax
0582F: 83 06 48 8f 07           add word ptr [0x8f48], 7
05834: c3                       ret

; basic_block_057B9
057B9: 40                       inc ax
057BA: 47                       inc di
057BB: eb ed                    jmp 0x57aa

; basic_block_0547F
0547F: be e4 df                 mov si, 0xdfe4

; basic_block_0538B
0538B: c7 06 88 8e 08 00        mov word ptr [0x8e88], 8
05391: c7 06 dc 3a 04 00        mov word ptr [0x3adc], 4
05397: e8 ee 00                 call 0x5488
0539A: f6 06 59 8f 04           test byte ptr [0x8f59], 4
0539F: 74 24                    je 0x53c5

; basic_block_05388
05388: e9 8b 00                 jmp 0x5416

; basic_block_05429
05429: c6 06 5b 8f 00           mov byte ptr [0x8f5b], 0
0542E: c7 06 88 8e 09 00        mov word ptr [0x8e88], 9
05434: c3                       ret

; basic_block_05419

; basic_block_0541C

; basic_block_0541F

; basic_block_05422

; basic_block_051FB

; basic_block_03788
03788: 57                       push di
03789: 83 3c 34                 cmp word ptr [si], 0x34
0378C: 75 0f                    jne 0x379d

; basic_block_0520A

; basic_block_0520D

; basic_block_05213

; basic_block_05319
05319: 53                       push bx
0531A: 50                       push ax
0531B: e8 4f 04                 call 0x576d
0531E: 5b                       pop bx
0531F: 53                       push bx
05320: d1 e3                    shl bx, 1
05322: 8b b7 66 38              mov si, word ptr [bx + 0x3866]
05326: e8 5e 04                 call 0x5787
05329: 58                       pop ax
0532A: 5b                       pop bx
0532B: 80 3e de 3a 00           cmp byte ptr [0x3ade], 0
05330: 74 36                    je 0x5368

; basic_block_051CA

; basic_block_05240
05240: 89 36 b4 39              mov word ptr [0x39b4], si
05244: c7 06 9a 3c f7 00        mov word ptr [0x3c9a], 0xf7
0524A: c7 06 9c 3c 78 00        mov word ptr [0x3c9c], 0x78
05250: c7 06 9e 3c 00 f7        mov word ptr [0x3c9e], 0xf700
05256: e8 f8 b7                 call 0xa51
05259: e8 37 ba                 call 0xc93
0525C: e8 32 04                 call 0x5691
0525F: e8 56 04                 call 0x56b8
05262: e8 76 02                 call 0x54db
05265: 83 2e 9c 3c 02           sub word ptr [0x3c9c], 2
0526A: 83 3e 9c 3c 68           cmp word ptr [0x3c9c], 0x68
0526F: 7f e5                    jg 0x5256

; basic_block_051CE

; basic_block_04DA2
04DA2: c7 44 06 1a 00           mov word ptr [si + 6], 0x1a
04DA7: c7 44 08 e8 3a           mov word ptr [si + 8], 0x3ae8
04DAC: 45                       inc bp
04DAD: 83 c7 02                 add di, 2
04DB0: 83 c3 02                 add bx, 2
04DB3: 83 c6 0c                 add si, 0xc
04DB6: 83 fd 1a                 cmp bp, 0x1a
04DB9: 74 3a                    je 0x4df5

; basic_block_04D89
04D89: 99                       cdq
04D8A: 3b 16 5c 91              cmp dx, word ptr [0x915c]
04D8E: 7f 12                    jg 0x4da2

; basic_block_04FE3
04FE3: 8b 36 b4 39              mov si, word ptr [0x39b4]
04FE7: 8b 5c 06                 mov bx, word ptr [si + 6]
04FEA: 83 fb 03                 cmp bx, 3
04FED: 75 03                    jne 0x4ff2

; basic_block_04F3A

; basic_block_04F80
04F80: e8 ea 07                 call 0x576d
04F83: be 02 39                 mov si, 0x3902
04F86: e8 fe 07                 call 0x5787
04F89: c7 06 b2 39 ff ff        mov word ptr [0x39b2], 0xffff
04F8F: e9 01 ff                 jmp 0x4e93

; basic_block_04F3C
04F3C: e8 2e 08                 call 0x576d
04F3F: be 52 39                 mov si, 0x3952
04F42: e8 42 08                 call 0x5787
04F45: a1 b2 39                 mov ax, word ptr [0x39b2]
04F48: 99                       cdq
04F49: 29 06 5a 91              sub word ptr [0x915a], ax
04F4D: 19 16 5c 91              sbb word ptr [0x915c], dx
04F51: 8b 36 b4 39              mov si, word ptr [0x39b4]
04F55: 8b 5c 06                 mov bx, word ptr [si + 6]
04F58: d1 e3                    shl bx, 1
04F5A: ff 97 1a 38              call word ptr [bx + 0x381a]
04F5E: c7 06 b2 39 ff ff        mov word ptr [0x39b2], 0xffff
04F64: e8 16 08                 call 0x577d
04F67: e8 bf fe                 call 0x4e29
04F6A: 8b 36 b4 39              mov si, word ptr [0x39b4]
04F6E: 83 7c 06 02              cmp word ptr [si + 6], 2
04F72: 75 03                    jne 0x4f77

; basic_block_04EF3
04EF3: e8 77 08                 call 0x576d
04EF6: be 2b 39                 mov si, 0x392b
04EF9: e8 8b 08                 call 0x5787
04EFC: c7 06 b2 39 ff ff        mov word ptr [0x39b2], 0xffff
04F02: eb 8f                    jmp 0x4e93

; basic_block_04ED5
04ED5: 3d 1b 00                 cmp ax, 0x1b
04ED8: 74 2a                    je 0x4f04

; basic_block_02A17
02A17: 3d c0 00                 cmp ax, 0xc0
02A1A: 75 03                    jne 0x2a1f

; basic_block_02A14
02A14: e9 65 05                 jmp 0x2f7c

; basic_block_03004
03004: 83 3e 48 91 38           cmp word ptr [0x9148], 0x38
03009: 75 03                    jne 0x300e

; basic_block_02F0F
02F0F: e8 61 ff                 call 0x2e73
02F12: 56                       push si
02F13: e8 0c e1                 call 0x1022
02F16: bf fe 8f                 mov di, 0x8ffe
02F19: e8 60 d8                 call 0x77c
02F1C: 8b fe                    mov di, si
02F1E: 5e                       pop si
02F1F: c7 06 48 91 4c 00        mov word ptr [0x9148], 0x4c
02F25: 89 3e 4a 91              mov word ptr [0x914a], di
02F29: c7 05 4c 00              mov word ptr [di], 0x4c
02F2D: c7 45 02 9b 22           mov word ptr [di + 2], 0x229b
02F32: c7 45 04 53 08           mov word ptr [di + 4], 0x853
02F37: c7 45 06 48 91           mov word ptr [di + 6], 0x9148
02F3C: bd 0c 14                 mov bp, 0x140c
02F3F: 2e 8b 46 00              mov ax, word ptr cs:[bp]
02F43: 89 45 0c                 mov word ptr [di + 0xc], ax
02F46: 2e 8b 46 02              mov ax, word ptr cs:[bp + 2]
02F4A: 89 45 0e                 mov word ptr [di + 0xe], ax
02F4D: 83 c5 04                 add bp, 4
02F50: 89 6d 10                 mov word ptr [di + 0x10], bp
02F53: a1 12 9f                 mov ax, word ptr [0x9f12]
02F56: 89 45 12                 mov word ptr [di + 0x12], ax
02F59: a1 16 9f                 mov ax, word ptr [0x9f16]
02F5C: 05 19 00                 add ax, 0x19
02F5F: 89 45 16                 mov word ptr [di + 0x16], ax
02F62: c7 45 1a 00 00           mov word ptr [di + 0x1a], 0
02F67: c7 45 34 00 00           mov word ptr [di + 0x34], 0
02F6C: c7 45 24 00 00           mov word ptr [di + 0x24], 0
02F71: c7 45 36 0b 00           mov word ptr [di + 0x36], 0xb
02F76: c7 45 48 ff ff           mov word ptr [di + 0x48], 0xffff
02F7B: c3                       ret

; basic_block_057E4
057E4: ff 06 46 8f              inc word ptr [0x8f46]
057E8: ac                       lodsb al, byte ptr [si]
057E9: 84 c0                    test al, al
057EB: 74 07                    je 0x57f4

; basic_block_057D4
057D4: 3c 0d                    cmp al, 0xd
057D6: 75 05                    jne 0x57dd

; basic_block_057AA

; basic_block_0539A

; basic_block_053C5
053C5: f6 06 59 8f 08           test byte ptr [0x8f59], 8
053CA: 74 1a                    je 0x53e6

; basic_block_053A1
053A1: 83 3e 44 8f 04           cmp word ptr [0x8f44], 4
053A6: 75 0f                    jne 0x53b7

; basic_block_0379D
0379D: 8b 7c 06                 mov di, word ptr [si + 6]
037A0: c7 05 00 00              mov word ptr [di], 0
037A4: e8 19 d0                 call 0x7c0
037A7: 5e                       pop si
037A8: c3                       ret

; basic_block_0378E
0378E: e8 de ff                 call 0x376f
03791: 83 3d 00                 cmp word ptr [di], 0
03794: 74 07                    je 0x379d

; basic_block_0531E

; basic_block_05329

; basic_block_05368
05368: c3                       ret

; basic_block_05332
05332: 3d 01 00                 cmp ax, 1
05335: 74 25                    je 0x535c

; basic_block_05259

; basic_block_0525C

; basic_block_0525F

; basic_block_05262

; basic_block_05265

; basic_block_05256

; basic_block_05271
05271: b9 03 00                 mov cx, 3
05274: e8 85 02                 call 0x54fc
05277: c7 06 9e 3c 70 f4        mov word ptr [0x3c9e], 0xf470
0527D: b9 03 00                 mov cx, 3
05280: e8 79 02                 call 0x54fc
05283: c7 06 9e 3c 00 f7        mov word ptr [0x3c9e], 0xf700
05289: b9 03 00                 mov cx, 3
0528C: e8 6d 02                 call 0x54fc
0528F: c7 06 9e 3c 90 f9        mov word ptr [0x3c9e], 0xf990
05295: b9 03 00                 mov cx, 3
05298: e8 61 02                 call 0x54fc
0529B: c7 06 9e 3c 00 f7        mov word ptr [0x3c9e], 0xf700
052A1: b9 03 00                 mov cx, 3
052A4: e8 55 02                 call 0x54fc
052A7: c7 06 9e 3c 70 f4        mov word ptr [0x3c9e], 0xf470
052AD: b9 03 00                 mov cx, 3
052B0: e8 49 02                 call 0x54fc
052B3: c7 06 9e 3c 00 f7        mov word ptr [0x3c9e], 0xf700
052B9: b9 03 00                 mov cx, 3
052BC: e8 3d 02                 call 0x54fc
052BF: c7 06 9e 3c 90 f9        mov word ptr [0x3c9e], 0xf990
052C5: b9 03 00                 mov cx, 3
052C8: e8 31 02                 call 0x54fc
052CB: c7 06 9e 3c 00 f7        mov word ptr [0x3c9e], 0xf700
052D1: b9 03 00                 mov cx, 3
052D4: e8 25 02                 call 0x54fc
052D7: e8 77 b7                 call 0xa51
052DA: e8 b6 b9                 call 0xc93
052DD: e8 b1 03                 call 0x5691
052E0: e8 d5 03                 call 0x56b8
052E3: e8 f5 01                 call 0x54db
052E6: 83 06 9c 3c 02           add word ptr [0x3c9c], 2
052EB: 81 3e 9c 3c 80 00        cmp word ptr [0x3c9c], 0x80
052F1: 7c e4                    jl 0x52d7

; basic_block_04DF5
04DF5: 81 fe 9a 3d              cmp si, 0x3d9a
04DF9: 74 0a                    je 0x4e05

; basic_block_04DBB
04DBB: 81 fe 9a 3d              cmp si, 0x3d9a
04DBF: 7c b7                    jl 0x4d78

; basic_block_04D90
04D90: 75 06                    jne 0x4d98

; basic_block_04FF2
04FF2: 83 fb 04                 cmp bx, 4
04FF5: 75 03                    jne 0x4ffa

; basic_block_04FEF
04FEF: e9 c2 00                 jmp 0x50b4

; basic_block_04F83

; basic_block_04F89

; basic_block_04F3F

; basic_block_04F45

; basic_block_04F5E

; basic_block_04F67

; basic_block_04E29
04E29: be b6 3c                 mov si, 0x3cb6
04E2C: b9 14 00                 mov cx, 0x14
04E2F: 8b 44 06                 mov ax, word ptr [si + 6]
04E32: 85 c0                    test ax, ax
04E34: 74 3c                    je 0x4e72

; basic_block_04F6A

; basic_block_04F77
04F77: be 67 39                 mov si, 0x3967
04F7A: e8 0a 08                 call 0x5787
04F7D: e9 13 ff                 jmp 0x4e93

; basic_block_04F74
04F74: e9 1c ff                 jmp 0x4e93

; basic_block_04EF6

; basic_block_04EFC

; basic_block_04F04
04F04: a1 16 38                 mov ax, word ptr [0x3816]
04F07: 05 13 00                 add ax, 0x13
04F0A: 3d 19 00                 cmp ax, 0x19
04F0D: 7c 02                    jl 0x4f11

; basic_block_04EDA
04EDA: a1 42 8f                 mov ax, word ptr [0x8f42]
04EDD: a3 18 38                 mov word ptr [0x3818], ax
04EE0: a1 44 8f                 mov ax, word ptr [0x8f44]
04EE3: a3 1a 38                 mov word ptr [0x381a], ax
04EE6: 56                       push si
04EE7: 8b 44 06                 mov ax, word ptr [si + 6]
04EEA: e8 2c 04                 call 0x5319
04EED: 5e                       pop si
04EEE: e8 29 03                 call 0x521a
04EF1: eb a0                    jmp 0x4e93

; basic_block_02A1F
02A1F: 3d 90 00                 cmp ax, 0x90
02A22: 75 03                    jne 0x2a27

; basic_block_02A1C
02A1C: e9 13 02                 jmp 0x2c32

; basic_block_02F7C
02F7C: 83 3e 48 91 38           cmp word ptr [0x9148], 0x38
02F81: 75 03                    jne 0x2f86

; basic_block_0300E
0300E: 83 3e 48 91 3c           cmp word ptr [0x9148], 0x3c
03013: 75 03                    jne 0x3018

; basic_block_0300B
0300B: e9 ea fe                 jmp 0x2ef8

; basic_block_02F12

; basic_block_02F16

; basic_block_02F1C

; basic_block_057ED
057ED: 3c 20                    cmp al, 0x20
057EF: 74 f3                    je 0x57e4

; basic_block_057DD
057DD: 56                       push si
057DE: e8 18 b5                 call 0xcf9
057E1: 5e                       pop si
057E2: eb e5                    jmp 0x57c9

; basic_block_057D8
057D8: e8 4e 00                 call 0x5829
057DB: eb aa                    jmp 0x5787

; basic_block_053E6
053E6: f6 06 59 8f 01           test byte ptr [0x8f59], 1
053EB: 74 0e                    je 0x53fb

; basic_block_053CC
053CC: 83 3e 44 8f 04           cmp word ptr [0x8f44], 4
053D1: 74 d5                    je 0x53a8

; basic_block_053B7
053B7: ff 0e 42 8f              dec word ptr [0x8f42]
053BB: 79 56                    jns 0x5413

; basic_block_053A8
053A8: 33 c0                    xor ax, ax
053AA: 83 3e 42 8f 00           cmp word ptr [0x8f42], 0
053AF: 75 01                    jne 0x53b2

; basic_block_037A7

; basic_block_03791

; basic_block_03796
03796: 56                       push si
03797: 8b f7                    mov si, di
03799: e8 24 d0                 call 0x7c0
0379C: 5e                       pop si

; basic_block_0535C
0535C: 53                       push bx
0535D: be d4 3a                 mov si, 0x3ad4
05360: e8 24 04                 call 0x5787
05363: 58                       pop ax
05364: 40                       inc ax
05365: e8 92 04                 call 0x57fa

; basic_block_05337
05337: 3d 13 00                 cmp ax, 0x13
0533A: 74 20                    je 0x535c

; basic_block_05277

; basic_block_05283

; basic_block_0528F

; basic_block_0529B

; basic_block_052A7

; basic_block_052B3

; basic_block_052BF

; basic_block_052CB

; basic_block_052D7

; basic_block_052DA

; basic_block_052DD

; basic_block_052E0

; basic_block_052E3

; basic_block_052E6

; basic_block_052F3
052F3: be b4 3a                 mov si, 0x3ab4
052F6: e8 8e 04                 call 0x5787
052F9: 8b 36 b4 39              mov si, word ptr [0x39b4]
052FD: 8b 5c 06                 mov bx, word ptr [si + 6]
05300: d1 e3                    shl bx, 1
05302: 8b 9f ce 38              mov bx, word ptr [bx + 0x38ce]
05306: 8b 7c 0a                 mov di, word ptr [si + 0xa]
05309: b8 d0 07                 mov ax, 0x7d0
0530C: f7 65 34                 mul word ptr [di + 0x34]
0530F: 03 c3                    add ax, bx
05311: d1 e8                    shr ax, 1
05313: a3 b2 39                 mov word ptr [0x39b2], ax
05316: e9 e1 04                 jmp 0x57fa

; basic_block_04E05
04E05: 83 3e 16 38 00           cmp word ptr [0x3816], 0
04E0A: 75 de                    jne 0x4dea

; basic_block_04DFB
04DFB: c7 44 06 00 00           mov word ptr [si + 6], 0
04E00: 83 c6 0c                 add si, 0xc
04E03: eb f0                    jmp 0x4df5

; basic_block_04D78

; basic_block_04DC1
04DC1: 7f 4e                    jg 0x4e11

; basic_block_04D98
04D98: 89 6c 06                 mov word ptr [si + 6], bp
04D9B: 8b 07                    mov ax, word ptr [bx]
04D9D: 89 44 08                 mov word ptr [si + 8], ax
04DA0: eb 0a                    jmp 0x4dac

; basic_block_04D92
04D92: 3b 06 5a 91              cmp ax, word ptr [0x915a]
04D96: 77 0a                    ja 0x4da2

; basic_block_04FFA
04FFA: 83 fb 07                 cmp bx, 7
04FFD: 75 03                    jne 0x5002

; basic_block_04FF7
04FF7: e9 c3 00                 jmp 0x50bd

; basic_block_050B4
050B4: 83 3e 5e 91 02           cmp word ptr [0x915e], 2
050B9: 74 f2                    je 0x50ad

; basic_block_04E72
04E72: 83 c6 0c                 add si, 0xc
04E75: e2 b8                    loop 0x4e2f
04E77: c3                       ret

; basic_block_04E36
04E36: 3d 1b 00                 cmp ax, 0x1b
04E39: 75 08                    jne 0x4e43

; basic_block_04F7D

; basic_block_04F11
04F11: a3 16 38                 mov word ptr [0x3816], ax
04F14: e8 21 fe                 call 0x4d38
04F17: c7 06 b2 39 ff ff        mov word ptr [0x39b2], 0xffff
04F1D: e9 73 ff                 jmp 0x4e93

; basic_block_04F0F
04F0F: 33 c0                    xor ax, ax

; basic_block_04EED

; basic_block_0521A
0521A: 89 36 b4 39              mov word ptr [0x39b4], si
0521E: be c2 3a                 mov si, 0x3ac2
05221: e8 63 05                 call 0x5787
05224: 8b 36 b4 39              mov si, word ptr [0x39b4]
05228: 8b 5c 06                 mov bx, word ptr [si + 6]
0522B: d1 e3                    shl bx, 1
0522D: 8b 87 ce 38              mov ax, word ptr [bx + 0x38ce]
05231: 83 3e 1c 99 05           cmp word ptr [0x991c], 5
05236: 75 02                    jne 0x523a

; basic_block_04EF1

; basic_block_02A27
02A27: 3d 48 00                 cmp ax, 0x48
02A2A: 75 03                    jne 0x2a2f

; basic_block_02A24
02A24: e9 ff 06                 jmp 0x3126

; basic_block_02F86
02F86: 83 3e 48 91 3c           cmp word ptr [0x9148], 0x3c
02F8B: 75 03                    jne 0x2f90

; basic_block_02F83
02F83: e9 72 ff                 jmp 0x2ef8

; basic_block_03018
03018: e8 58 fe                 call 0x2e73
0301B: 56                       push si
0301C: e8 03 e0                 call 0x1022
0301F: bf fe 8f                 mov di, 0x8ffe
03022: e8 57 d7                 call 0x77c
03025: 8b fe                    mov di, si
03027: 5e                       pop si
03028: c7 06 48 91 3c 00        mov word ptr [0x9148], 0x3c
0302E: 89 3e 4a 91              mov word ptr [0x914a], di
03032: c7 05 3c 00              mov word ptr [di], 0x3c
03036: c7 45 02 97 26           mov word ptr [di + 2], 0x2697
0303B: c7 45 04 53 08           mov word ptr [di + 4], 0x853
03040: c7 45 06 48 91           mov word ptr [di + 6], 0x9148
03045: bd 54 13                 mov bp, 0x1354
03048: 2e 8b 46 00              mov ax, word ptr cs:[bp]
0304C: 89 45 0c                 mov word ptr [di + 0xc], ax
0304F: 2e 8b 46 02              mov ax, word ptr cs:[bp + 2]
03053: 89 45 0e                 mov word ptr [di + 0xe], ax
03056: 83 c5 04                 add bp, 4
03059: 89 6d 10                 mov word ptr [di + 0x10], bp
0305C: a1 12 9f                 mov ax, word ptr [0x9f12]
0305F: 89 45 12                 mov word ptr [di + 0x12], ax
03062: a1 16 9f                 mov ax, word ptr [0x9f16]
03065: 05 19 00                 add ax, 0x19
03068: 89 45 16                 mov word ptr [di + 0x16], ax
0306B: c7 45 1a 00 00           mov word ptr [di + 0x1a], 0
03070: c7 45 34 01 00           mov word ptr [di + 0x34], 1
03075: c7 45 24 01 00           mov word ptr [di + 0x24], 1
0307A: c7 45 36 0d 00           mov word ptr [di + 0x36], 0xd
0307F: c7 45 48 ff ff           mov word ptr [di + 0x48], 0xffff
03084: c7 06 38 8f 9c ff        mov word ptr [0x8f38], 0xff9c
0308A: c3                       ret

; basic_block_03015
03015: e9 e0 fe                 jmp 0x2ef8

; basic_block_057F1
057F1: 4e                       dec si
057F2: eb 93                    jmp 0x5787

; basic_block_00CF9
00CF9: 8b 2e 44 30              mov bp, word ptr [0x3044]
00CFD: d1 e5                    shl bp, 1
00CFF: d1 e5                    shl bp, 1
00D01: 2e ff 9e 07 0d           lcall cs:[bp + 0xd07]
00D06: c3                       ret

; basic_block_057E1

; basic_block_057DB

; basic_block_053FB
053FB: f6 06 59 8f 02           test byte ptr [0x8f59], 2
05400: 74 11                    je 0x5413

; basic_block_053ED
053ED: ff 0e 44 8f              dec word ptr [0x8f44]
053F1: 79 20                    jns 0x5413

; basic_block_053D3
053D3: ff 06 42 8f              inc word ptr [0x8f42]
053D7: 83 3e 42 8f 04           cmp word ptr [0x8f42], 4
053DC: 7e 35                    jle 0x5413

; basic_block_05413
05413: e8 1f 00                 call 0x5435

; basic_block_053BD
053BD: c7 06 42 8f 04 00        mov word ptr [0x8f42], 4
053C3: eb 4e                    jmp 0x5413

; basic_block_053B2
053B2: a3 42 8f                 mov word ptr [0x8f42], ax
053B5: eb 5c                    jmp 0x5413

; basic_block_053B1
053B1: 40                       inc ax

; basic_block_0379C

; basic_block_05363

; basic_block_057FA
057FA: c6 06 40 8f ff           mov byte ptr [0x8f40], 0xff
057FF: 50                       push ax
05800: e8 4e b2                 call 0xa51
05803: e8 8b fe                 call 0x5691
05806: e8 af fe                 call 0x56b8
05809: e8 87 b4                 call 0xc93
0580C: 58                       pop ax
0580D: 3d 0a 00                 cmp ax, 0xa
05810: 7c 0b                    jl 0x581d

; basic_block_0533C
0533C: 3d 12 00                 cmp ax, 0x12
0533F: 74 1b                    je 0x535c

; basic_block_052F9

; basic_block_04DEA
04DEA: c7 44 06 1b 00           mov word ptr [si + 6], 0x1b
04DEF: c7 44 08 e2 3a           mov word ptr [si + 8], 0x3ae2
04DF4: c3                       ret

; basic_block_04E0C
04E0C: c7 44 06 00 00           mov word ptr [si + 6], 0
04E11: c3                       ret

; basic_block_04E11

; basic_block_04DC3
04DC3: 83 3e 16 38 00           cmp word ptr [0x3816], 0
04DC8: 75 20                    jne 0x4dea

; basic_block_04DAC

; basic_block_05002
05002: 83 fb 05                 cmp bx, 5
05005: 75 03                    jne 0x500a

; basic_block_04FFF
04FFF: e9 bb 00                 jmp 0x50bd

; basic_block_050BD
050BD: 83 3e 86 91 27           cmp word ptr [0x9186], 0x27
050C2: 74 e9                    je 0x50ad

; basic_block_050AD
050AD: 33 c0                    xor ax, ax
050AF: c3                       ret

; basic_block_050BB
050BB: eb f3                    jmp 0x50b0

; basic_block_04E43
04E43: 3d 1a 00                 cmp ax, 0x1a
04E46: 7d 2a                    jge 0x4e72

; basic_block_04E3B
04E3B: 83 7c fa 1a              cmp word ptr [si - 6], 0x1a
04E3F: 74 27                    je 0x4e68

; basic_block_04F17

; basic_block_05224

; basic_block_0523A
0523A: a3 b2 39                 mov word ptr [0x39b2], ax
0523D: e9 ba 05                 jmp 0x57fa

; basic_block_05238
05238: d1 e8                    shr ax, 1

; basic_block_02A2F
02A2F: 3d b0 00                 cmp ax, 0xb0
02A32: 75 03                    jne 0x2a37

; basic_block_02A2C
02A2C: e9 57 03                 jmp 0x2d86

; basic_block_03126
03126: b8 90 00                 mov ax, 0x90
03129: e8 eb ff                 call 0x3117
0312C: 75 03                    jne 0x3131

; basic_block_02F90
02F90: e8 e0 fe                 call 0x2e73
02F93: 56                       push si
02F94: e8 8b e0                 call 0x1022
02F97: bf fe 8f                 mov di, 0x8ffe
02F9A: e8 df d7                 call 0x77c
02F9D: 8b fe                    mov di, si
02F9F: 5e                       pop si
02FA0: c7 06 48 91 38 00        mov word ptr [0x9148], 0x38
02FA6: 89 3e 4a 91              mov word ptr [0x914a], di
02FAA: c7 05 38 00              mov word ptr [di], 0x38
02FAE: c7 45 02 97 26           mov word ptr [di + 2], 0x2697
02FB3: c7 45 04 53 08           mov word ptr [di + 4], 0x853
02FB8: c7 45 06 48 91           mov word ptr [di + 6], 0x9148
02FBD: bd 42 13                 mov bp, 0x1342
02FC0: 2e 8b 46 00              mov ax, word ptr cs:[bp]
02FC4: 89 45 0c                 mov word ptr [di + 0xc], ax
02FC7: 2e 8b 46 02              mov ax, word ptr cs:[bp + 2]
02FCB: 89 45 0e                 mov word ptr [di + 0xe], ax
02FCE: 83 c5 04                 add bp, 4
02FD1: 89 6d 10                 mov word ptr [di + 0x10], bp
02FD4: a1 12 9f                 mov ax, word ptr [0x9f12]
02FD7: 89 45 12                 mov word ptr [di + 0x12], ax
02FDA: a1 16 9f                 mov ax, word ptr [0x9f16]
02FDD: 05 19 00                 add ax, 0x19
02FE0: 89 45 16                 mov word ptr [di + 0x16], ax
02FE3: c7 45 1a 00 00           mov word ptr [di + 0x1a], 0
02FE8: c7 45 34 00 00           mov word ptr [di + 0x34], 0
02FED: c7 45 24 01 00           mov word ptr [di + 0x24], 1
02FF2: c7 45 36 09 00           mov word ptr [di + 0x36], 9
02FF7: c7 45 48 ff ff           mov word ptr [di + 0x48], 0xffff
02FFC: c7 06 38 8f 9c ff        mov word ptr [0x8f38], 0xff9c
03002: c3                       ret

; basic_block_02F8D
02F8D: e9 68 ff                 jmp 0x2ef8

; basic_block_0301B

; basic_block_0301F

; basic_block_03025

; basic_block_00D06

; basic_block_05402
05402: ff 06 44 8f              inc word ptr [0x8f44]
05406: 83 3e 44 8f 04           cmp word ptr [0x8f44], 4
0540B: 7e 06                    jle 0x5413

; basic_block_053F3
053F3: c7 06 44 8f 04 00        mov word ptr [0x8f44], 4
053F9: eb 18                    jmp 0x5413

; basic_block_053DE
053DE: c7 06 42 8f 00 00        mov word ptr [0x8f42], 0
053E4: eb 2d                    jmp 0x5413

; basic_block_05803

; basic_block_05806

; basic_block_05809

; basic_block_0580C

; basic_block_0581D
0581D: 05 30 00                 add ax, 0x30
05820: e8 d6 b4                 call 0xcf9
05823: c6 06 40 8f 00           mov byte ptr [0x8f40], 0
05828: c3                       ret

; basic_block_05812
05812: 99                       cdq
05813: bb 0a 00                 mov bx, 0xa
05816: f7 f3                    div bx
05818: 52                       push dx
05819: e8 f1 ff                 call 0x580d
0581C: 58                       pop ax

; basic_block_05341
05341: 3d 08 00                 cmp ax, 8
05344: 74 16                    je 0x535c

; basic_block_04DCA
04DCA: 8b 05                    mov ax, word ptr [di]
04DCC: 83 3e 1c 99 05           cmp word ptr [0x991c], 5
04DD1: 75 02                    jne 0x4dd5

; basic_block_0500A
0500A: 83 fb 06                 cmp bx, 6
0500D: 75 03                    jne 0x5012

; basic_block_05007
05007: e9 bc 00                 jmp 0x50c6

; basic_block_050C4
050C4: eb ea                    jmp 0x50b0

; basic_block_050B0
050B0: 33 c0                    xor ax, ax
050B2: 48                       dec ax
050B3: c3                       ret

; basic_block_04E48
04E48: 8b d8                    mov bx, ax
04E4A: d1 e3                    shl bx, 1
04E4C: 8b 87 ce 38              mov ax, word ptr [bx + 0x38ce]
04E50: 83 3e 1c 99 05           cmp word ptr [0x991c], 5
04E55: 75 02                    jne 0x4e59

; basic_block_04E68
04E68: c7 44 06 1a 00           mov word ptr [si + 6], 0x1a
04E6D: c7 44 08 e8 3a           mov word ptr [si + 8], 0x3ae8

; basic_block_04E41
04E41: eb 2f                    jmp 0x4e72

; basic_block_02A37
02A37: 3d 28 00                 cmp ax, 0x28
02A3A: 75 03                    jne 0x2a3f

; basic_block_02A34
02A34: e9 b9 03                 jmp 0x2df0

; basic_block_02D86
02D86: 83 3e 48 91 48           cmp word ptr [0x9148], 0x48
02D8B: 75 03                    jne 0x2d90

; basic_block_0312C

; basic_block_03131
03131: 56                       push si
03132: e8 ed de                 call 0x1022
03135: bf fe 8f                 mov di, 0x8ffe
03138: e8 41 d6                 call 0x77c
0313B: 8b fe                    mov di, si
0313D: 5e                       pop si
0313E: 3e c7 46 00 90 00        mov word ptr ds:[bp], 0x90
03144: 3e 89 7e 02              mov word ptr ds:[bp + 2], di
03148: c7 05 90 00              mov word ptr [di], 0x90
0314C: c7 45 02 0b 25           mov word ptr [di + 2], 0x250b
03151: c7 45 04 53 08           mov word ptr [di + 4], 0x853
03156: 89 6d 06                 mov word ptr [di + 6], bp
03159: 49                       dec cx
0315A: d1 e1                    shl cx, 1
0315C: d1 e1                    shl cx, 1
0315E: bd a8 30                 mov bp, 0x30a8
03161: 03 e9                    add bp, cx
03163: 3e 8b 46 00              mov ax, word ptr ds:[bp]
03167: 89 45 30                 mov word ptr [di + 0x30], ax
0316A: 3e 8b 46 02              mov ax, word ptr ds:[bp + 2]
0316E: 89 45 32                 mov word ptr [di + 0x32], ax
03171: bd 66 15                 mov bp, 0x1566
03174: 2e 8b 46 00              mov ax, word ptr cs:[bp]
03178: 89 45 0c                 mov word ptr [di + 0xc], ax
0317B: 2e 8b 46 02              mov ax, word ptr cs:[bp + 2]
0317F: 89 45 0e                 mov word ptr [di + 0xe], ax
03182: 83 c5 04                 add bp, 4
03185: 89 6d 10                 mov word ptr [di + 0x10], bp
03188: a1 12 9f                 mov ax, word ptr [0x9f12]
0318B: 03 45 30                 add ax, word ptr [di + 0x30]
0318E: 89 45 12                 mov word ptr [di + 0x12], ax
03191: a1 16 9f                 mov ax, word ptr [0x9f16]
03194: 03 45 32                 add ax, word ptr [di + 0x32]
03197: 89 45 16                 mov word ptr [di + 0x16], ax
0319A: c7 45 1a 00 00           mov word ptr [di + 0x1a], 0
0319F: c7 45 34 00 00           mov word ptr [di + 0x34], 0
031A4: c7 45 24 00 00           mov word ptr [di + 0x24], 0
031A9: c7 45 36 11 00           mov word ptr [di + 0x36], 0x11
031AE: c7 45 48 ff ff           mov word ptr [di + 0x48], 0xffff
031B3: e9 63 01                 jmp 0x3319

; basic_block_0312E
0312E: e9 82 00                 jmp 0x31b3

; basic_block_02F93

; basic_block_02F97

; basic_block_02F9D

; basic_block_0540D
0540D: c7 06 44 8f 00 00        mov word ptr [0x8f44], 0

; basic_block_05823

; basic_block_0580D

; basic_block_0581C

; basic_block_05346
05346: 3d 0a 00                 cmp ax, 0xa
05349: 74 11                    je 0x535c

; basic_block_04DD5
04DD5: 3b 06 4a 8f              cmp ax, word ptr [0x8f4a]
04DD9: 7f c7                    jg 0x4da2

; basic_block_04DD3
04DD3: d1 e8                    shr ax, 1

; basic_block_05012
05012: 83 fb 0c                 cmp bx, 0xc
05015: 75 03                    jne 0x501a

; basic_block_0500F
0500F: e9 bd 00                 jmp 0x50cf

; basic_block_050C6
050C6: 83 3e 32 91 03           cmp word ptr [0x9132], 3
050CB: 74 e0                    je 0x50ad

; basic_block_04E59
04E59: 99                       cdq
04E5A: 3b 16 5c 91              cmp dx, word ptr [0x915c]
04E5E: 7c 12                    jl 0x4e72

; basic_block_04E57
04E57: d1 e8                    shr ax, 1

; basic_block_02A3F
02A3F: 3d 94 00                 cmp ax, 0x94
02A42: 75 03                    jne 0x2a47

; basic_block_02A3C
02A3C: e9 eb 02                 jmp 0x2d2a

; basic_block_02DF0
02DF0: 81 3e 34 91 b0 00        cmp word ptr [0x9134], 0xb0
02DF6: 75 03                    jne 0x2dfb

; basic_block_02D90
02D90: 83 3e 4c 91 48           cmp word ptr [0x914c], 0x48
02D95: 74 82                    je 0x2d19

; basic_block_02D8D
02D8D: e9 68 01                 jmp 0x2ef8

; basic_block_03135

; basic_block_0313B

; basic_block_031B3

; basic_block_0534B
0534B: 3d 0e 00                 cmp ax, 0xe
0534E: 74 0c                    je 0x535c

; basic_block_04DDB
04DDB: 99                       cdq
04DDC: 3b 16 5c 91              cmp dx, word ptr [0x915c]
04DE0: 7f c0                    jg 0x4da2

; basic_block_0501A
0501A: 83 fb 10                 cmp bx, 0x10
0501D: 75 03                    jne 0x5022

; basic_block_05017
05017: e9 be 00                 jmp 0x50d8

; basic_block_050CF
050CF: 83 3e 62 91 00           cmp word ptr [0x9162], 0
050D4: 75 d7                    jne 0x50ad

; basic_block_050CD
050CD: eb e1                    jmp 0x50b0

; basic_block_04E60
04E60: 75 06                    jne 0x4e68

; basic_block_02A47
02A47: c3                       ret

; basic_block_02A44
02A44: e9 85 01                 jmp 0x2bcc

; basic_block_02D2A
02D2A: 83 3e 4c 91 28           cmp word ptr [0x914c], 0x28
02D2F: 74 e8                    je 0x2d19

; basic_block_02DFB
02DFB: 83 3e 34 91 00           cmp word ptr [0x9134], 0
02E00: 74 09                    je 0x2e0b

; basic_block_02DF8
02DF8: e9 26 fe                 jmp 0x2c21

; basic_block_02D97
02D97: bb 48 91                 mov bx, 0x9148
02D9A: 83 3f 00                 cmp word ptr [bx], 0
02D9D: 74 10                    je 0x2daf

; basic_block_05350
05350: 3d 09 00                 cmp ax, 9
05353: 74 07                    je 0x535c

; basic_block_04DE2
04DE2: 75 06                    jne 0x4dea

; basic_block_05022
05022: 83 fb 16                 cmp bx, 0x16
05025: 75 03                    jne 0x502a

; basic_block_0501F
0501F: e9 d3 00                 jmp 0x50f5

; basic_block_050D8
050D8: bf 34 91                 mov di, 0x9134
050DB: b9 07 00                 mov cx, 7
050DE: 83 3d 00                 cmp word ptr [di], 0
050E1: 74 0b                    je 0x50ee

; basic_block_050D6
050D6: eb d8                    jmp 0x50b0

; basic_block_04E62
04E62: 3b 06 5a 91              cmp ax, word ptr [0x915a]
04E66: 76 0a                    jbe 0x4e72

; basic_block_02D31
02D31: 83 3e 4c 91 00           cmp word ptr [0x914c], 0
02D36: 74 09                    je 0x2d41

; basic_block_02E0B
02E0B: c7 06 34 91 b0 00        mov word ptr [0x9134], 0xb0
02E11: 56                       push si
02E12: e8 0d e2                 call 0x1022
02E15: bf fe 8f                 mov di, 0x8ffe
02E18: e8 61 d9                 call 0x77c
02E1B: 89 36 36 91              mov word ptr [0x9136], si
02E1F: c7 04 b0 00              mov word ptr [si], 0xb0
02E23: c7 44 02 3c 21           mov word ptr [si + 2], 0x213c
02E28: c7 44 04 53 08           mov word ptr [si + 4], 0x853
02E2D: c7 44 06 34 91           mov word ptr [si + 6], 0x9134
02E32: bd 0c 11                 mov bp, 0x110c
02E35: 2e 8b 46 00              mov ax, word ptr cs:[bp]
02E39: 89 44 0c                 mov word ptr [si + 0xc], ax
02E3C: 2e 8b 46 02              mov ax, word ptr cs:[bp + 2]
02E40: 89 44 0e                 mov word ptr [si + 0xe], ax
02E43: 83 c5 04                 add bp, 4
02E46: 89 6c 10                 mov word ptr [si + 0x10], bp
02E49: a1 12 9f                 mov ax, word ptr [0x9f12]
02E4C: 89 44 12                 mov word ptr [si + 0x12], ax
02E4F: a1 16 9f                 mov ax, word ptr [0x9f16]
02E52: 89 44 16                 mov word ptr [si + 0x16], ax
02E55: c7 44 34 00 00           mov word ptr [si + 0x34], 0
02E5A: c7 44 24 02 00           mov word ptr [si + 0x24], 2
02E5F: c7 44 36 14 00           mov word ptr [si + 0x36], 0x14
02E64: c7 44 48 ff ff           mov word ptr [si + 0x48], 0xffff
02E69: 8b fe                    mov di, si
02E6B: 5e                       pop si
02E6C: c7 06 30 91 08 00        mov word ptr [0x9130], 8
02E72: c3                       ret

; basic_block_02E02
02E02: 56                       push si
02E03: 8b 36 36 91              mov si, word ptr [0x9136]
02E07: e8 b6 d9                 call 0x7c0
02E0A: 5e                       pop si

; basic_block_02DAF
02DAF: c7 07 48 00              mov word ptr [bx], 0x48
02DB3: 56                       push si
02DB4: e8 6b e2                 call 0x1022
02DB7: bf fe 8f                 mov di, 0x8ffe
02DBA: e8 bf d9                 call 0x77c
02DBD: 89 77 02                 mov word ptr [bx + 2], si
02DC0: c7 04 a0 00              mov word ptr [si], 0xa0
02DC4: c7 44 02 00 39           mov word ptr [si + 2], 0x3900
02DC9: c7 44 04 61 07           mov word ptr [si + 4], 0x761
02DCE: 89 5c 06                 mov word ptr [si + 6], bx
02DD1: c7 44 34 00 00           mov word ptr [si + 0x34], 0
02DD6: c7 44 24 00 00           mov word ptr [si + 0x24], 0
02DDB: c7 44 36 17 00           mov word ptr [si + 0x36], 0x17
02DE0: c7 44 48 ff ff           mov word ptr [si + 0x48], 0xffff
02DE5: 8b fe                    mov di, si
02DE7: 5e                       pop si
02DE8: c7 06 30 91 1e 00        mov word ptr [0x9130], 0x1e
02DEE: c3                       ret

; basic_block_02D9F
02D9F: bb 4c 91                 mov bx, 0x914c
02DA2: 83 3f 00                 cmp word ptr [bx], 0
02DA5: 74 08                    je 0x2daf

; basic_block_05355
05355: 3d 0d 00                 cmp ax, 0xd
05358: 74 02                    je 0x535c

; basic_block_04DE4
04DE4: 3b 06 5a 91              cmp ax, word ptr [0x915a]
04DE8: 77 b8                    ja 0x4da2

; basic_block_0502A
0502A: 83 fb 18                 cmp bx, 0x18
0502D: 75 03                    jne 0x5032

; basic_block_05027
05027: e9 d4 00                 jmp 0x50fe

; basic_block_050F5
050F5: 83 3e 60 91 00           cmp word ptr [0x9160], 0
050FA: 75 b1                    jne 0x50ad

; basic_block_050EE
050EE: 83 c7 06                 add di, 6
050F1: e2 eb                    loop 0x50de
050F3: eb b8                    jmp 0x50ad

; basic_block_050E3
050E3: 8b 5d 02                 mov bx, word ptr [di + 2]
050E6: 8b 47 34                 mov ax, word ptr [bx + 0x34]
050E9: 3b 47 24                 cmp ax, word ptr [bx + 0x24]
050EC: 75 c2                    jne 0x50b0

; basic_block_02D41
02D41: c7 06 4c 91 28 00        mov word ptr [0x914c], 0x28
02D47: 56                       push si
02D48: e8 d7 e2                 call 0x1022
02D4B: bf fe 8f                 mov di, 0x8ffe
02D4E: e8 2b da                 call 0x77c
02D51: 89 36 4e 91              mov word ptr [0x914e], si
02D55: c7 04 9c 00              mov word ptr [si], 0x9c
02D59: c7 44 02 72 38           mov word ptr [si + 2], 0x3872
02D5E: c7 44 04 61 07           mov word ptr [si + 4], 0x761
02D63: c7 44 06 4c 91           mov word ptr [si + 6], 0x914c
02D68: c7 44 34 00 00           mov word ptr [si + 0x34], 0
02D6D: c7 44 24 00 00           mov word ptr [si + 0x24], 0
02D72: c7 44 36 15 00           mov word ptr [si + 0x36], 0x15
02D77: c7 44 48 ff ff           mov word ptr [si + 0x48], 0xffff
02D7C: 8b fe                    mov di, si
02D7E: 5e                       pop si
02D7F: c7 06 30 91 0c 00        mov word ptr [0x9130], 0xc
02D85: c3                       ret

; basic_block_02D38
02D38: 56                       push si
02D39: 8b 36 4e 91              mov si, word ptr [0x914e]
02D3D: e8 80 da                 call 0x7c0
02D40: 5e                       pop si

; basic_block_02E15

; basic_block_02E1B

; basic_block_02E0A

; basic_block_02DB7

; basic_block_02DBD

; basic_block_02DA7
02DA7: 56                       push si
02DA8: 8b 77 02                 mov si, word ptr [bx + 2]
02DAB: e8 12 da                 call 0x7c0
02DAE: 5e                       pop si

; basic_block_0535A
0535A: eb 0c                    jmp 0x5368

; basic_block_05032
05032: 83 fb 19                 cmp bx, 0x19
05035: 75 03                    jne 0x503a

; basic_block_0502F
0502F: e9 d5 00                 jmp 0x5107

; basic_block_050FE
050FE: 83 3e 8a 91 09           cmp word ptr [0x918a], 9
05103: 74 a8                    je 0x50ad

; basic_block_050FC
050FC: eb b2                    jmp 0x50b0

; basic_block_02D4B

; basic_block_02D51

; basic_block_02D40

; basic_block_02DAE

; basic_block_0503A
0503A: 8a 87 4d 38              mov al, byte ptr [bx + 0x384d]
0503E: a8 01                    test al, 1
05040: 75 4c                    jne 0x508e

; basic_block_05037
05037: e9 d6 00                 jmp 0x5110

; basic_block_05107
05107: 80 3e 23 92 00           cmp byte ptr [0x9223], 0
0510C: 75 9f                    jne 0x50ad

; basic_block_05105
05105: eb a9                    jmp 0x50b0

; basic_block_0508E
0508E: 8b 3e 36 91              mov di, word ptr [0x9136]
05092: 3b 5d 36                 cmp bx, word ptr [di + 0x36]
05095: 74 ed                    je 0x5084

; basic_block_05042
05042: a8 02                    test al, 2
05044: 75 62                    jne 0x50a8

; basic_block_05110
05110: 83 3e 50 91 00           cmp word ptr [0x9150], 0
05115: 75 96                    jne 0x50ad

; basic_block_0510E
0510E: eb a0                    jmp 0x50b0

; basic_block_05084
05084: 8b 45 34                 mov ax, word ptr [di + 0x34]
05087: 3b 45 24                 cmp ax, word ptr [di + 0x24]
0508A: 75 24                    jne 0x50b0

; basic_block_05097
05097: 83 3e 34 91 00           cmp word ptr [0x9134], 0
0509C: 74 12                    je 0x50b0

; basic_block_050A8
050A8: e8 63 bf                 call 0x100e
050AB: 74 03                    je 0x50b0

; basic_block_05046
05046: a8 04                    test al, 4
05048: 75 2a                    jne 0x5074

; basic_block_05117
05117: eb 97                    jmp 0x50b0

; basic_block_0508C
0508C: eb 1f                    jmp 0x50ad

; basic_block_0509E
0509E: 81 3e 34 91 94 00        cmp word ptr [0x9134], 0x94
050A4: 74 0a                    je 0x50b0

; basic_block_050AB

; basic_block_05074
05074: 83 3e 48 91 00           cmp word ptr [0x9148], 0
05079: 74 35                    je 0x50b0

; basic_block_0504A
0504A: a8 10                    test al, 0x10
0504C: 74 10                    je 0x505e

; basic_block_050A6
050A6: eb 05                    jmp 0x50ad

; basic_block_0507B
0507B: 8b 3e 4a 91              mov di, word ptr [0x914a]
0507F: 3b 5d 36                 cmp bx, word ptr [di + 0x36]
05082: 75 29                    jne 0x50ad

; basic_block_0505E
0505E: a8 08                    test al, 8
05060: 74 4e                    je 0x50b0

; basic_block_0504E
0504E: 83 3e 4c 91 00           cmp word ptr [0x914c], 0
05053: 74 5b                    je 0x50b0

; basic_block_05062
05062: 83 3e 4c 91 00           cmp word ptr [0x914c], 0
05067: 74 47                    je 0x50b0

; basic_block_05055
05055: 83 3e 48 91 00           cmp word ptr [0x9148], 0
0505A: 74 54                    je 0x50b0

; basic_block_05069
05069: 8b 3e 4e 91              mov di, word ptr [0x914e]
0506D: 3b 5d 36                 cmp bx, word ptr [di + 0x36]
05070: 74 12                    je 0x5084

; basic_block_0505C
0505C: eb 4f                    jmp 0x50ad

; basic_block_05072
05072: eb 39                    jmp 0x50ad
