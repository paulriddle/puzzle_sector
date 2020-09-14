VGA mode 0x13 gives you 320x200 256 colors

Valid effective addresses in 16-bit mode are [BX], [SI], [DI], [BX+SI],
[BX+DI], [BP+SI], [BP+DI], an immediate address, any of the above with a
16-bit offset, and [BP+offset]. Anything involving BP defaults to using
the SS segment, everything else defaults to using DS.

Or you could do: MOV AL, 0x0F / MOV CX, 64000 / REPZ / STOSB
