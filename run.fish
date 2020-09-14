#!/usr/bin/fish

nasm -f bin game.asm -o bootsector.bin; and \
qemu-system-i386 -monitor stdio -drive file=bootsector.bin,format=raw
