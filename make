#!/bin/bash
nasm -f elf32 boot/boot.asm -o boot/boot.o
gcc -m32 -c src/kern.c -o src/kern.o -ffreestanding -nostdlib -O2 -fno-stack-protector
ld -m elf_i386 -T boot/linker.ld -o iso/boot/kern.kernel boot/boot.o src/kern.o -nostdlib -z noexecstack
grub-mkrescue -o serbia.iso iso
