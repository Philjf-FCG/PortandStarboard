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
00542: e8 19 59                 call 0x5e5e
00545: e8 43 57                 call 0x5c8b
00548: 8c d8                    mov ax, ds
0054A: 8e c0                    mov es, ax
0054C: e8 26 37                 call 0x3c75
0054F: 83 3e 44 30 04           cmp word ptr [0x3044], 4
00554: 75 2f                    jne 0x585
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
00585: b4 01                    mov ah, 1
00587: cd 80                    int 0x80
00589: e8 37 59                 call 0x5ec3
0058C: e8 eb 58                 call 0x5e7a
0058F: b8 03 00                 mov ax, 3
00592: 83 3e 44 30 04           cmp word ptr [0x3044], 4
00597: 75 03                    jne 0x59c
00599: b8 07 00                 mov ax, 7
0059C: cd 10                    int 0x10
0059E: b8 00 4c                 mov ax, 0x4c00
005A1: cd 21                    int 0x21
005A3: c6 06 57 8f 00           mov byte ptr [0x8f57], 0
005A8: e8 55 fa                 call 0
005AB: 8c d8                    mov ax, ds
005AD: 8e c0                    mov es, ax
005AF: b8 04 00                 mov ax, 4
005B2: 80 3e 59 8e 00           cmp byte ptr [0x8e59], 0
005B7: 75 21                    jne 0x5da
005B9: b8 03 00                 mov ax, 3
005BC: 80 3e 5a 8e 00           cmp byte ptr [0x8e5a], 0
005C1: 75 17                    jne 0x5da
005C3: b8 02 00                 mov ax, 2
005C6: 80 3e 58 8e 00           cmp byte ptr [0x8e58], 0
005CB: 75 0d                    jne 0x5da
005CD: b8 00 00                 mov ax, 0
005D0: 80 3e 5d 8e 00           cmp byte ptr [0x8e5d], 0
005D5: 75 03                    jne 0x5da
005D7: b8 01 00                 mov ax, 1
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
00611: 80 fc 41                 cmp ah, 0x41
00614: 74 3c                    je 0x652
00616: 80 fc 39                 cmp ah, 0x39
00619: 74 16                    je 0x631
0061B: 80 fc 50                 cmp ah, 0x50
0061E: 74 11                    je 0x631
00620: 80 fc 4d                 cmp ah, 0x4d
00623: 74 0c                    je 0x631
00625: 80 fc 48                 cmp ah, 0x48
00628: 74 1a                    je 0x644
0062A: 80 fc 4b                 cmp ah, 0x4b
0062D: 74 15                    je 0x644
0062F: eb d7                    jmp 0x608
00631: ff 06 44 30              inc word ptr [0x3044]
00635: 83 3e 44 30 06           cmp word ptr [0x3044], 6
0063A: 7c c9                    jl 0x605
0063C: c7 06 44 30 00 00        mov word ptr [0x3044], 0
00642: eb c1                    jmp 0x605
00644: ff 0e 44 30              dec word ptr [0x3044]
00648: 79 bb                    jns 0x605
0064A: c7 06 44 30 05 00        mov word ptr [0x3044], 5
00650: eb b3                    jmp 0x605
00652: c6 06 57 8f ff           mov byte ptr [0x8f57], 0xff
00657: 83 3e 44 30 05           cmp word ptr [0x3044], 5
0065C: 75 05                    jne 0x663
0065E: e8 0d 00                 call 0x66e
00661: eb 91                    jmp 0x5f4
00663: a1 44 30                 mov ax, word ptr [0x3044]
00666: bb f8 2e                 mov bx, 0x2ef8
00669: d7                       xlatb
0066A: a3 44 30                 mov word ptr [0x3044], ax
0066D: c3                       ret
