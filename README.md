# nasmer
Nasm test for project

nasm -f bin boot.asm -o boot.bin
qemu-system-x86_64 boot.bin
qemu-system-x86_64 -drive file=boot.bin,format=raw -nographic
mkisofs -o boot.iso -b boot.bin -no-emul-boot -R -J .