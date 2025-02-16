# bootloader
very shit bootloader just for fun :DDDDDDDDDDD
# running
nasm -f bin -o bootloader.bin bootloader.asm
nasm -f bin -o kernel.bin kernel.asm
dd if=bootloader.bin of=boot.img bs=512 seek=4
dd if=kernel.bin of=boot.img bs=512 seek=2
qemu-system-x86_64 -drive format=raw,file=boot.img
