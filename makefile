Projeto_Bootloader=disk.img

#boot1
boot1=boot1

#boot2
boot2=boot2

#kernel
kernel=kernel

file=$(Projeto_Bootloader)

#all: clean mydisk boot1 write_boot1 boot2 write_boot2 kernel write_kernel hexdump launchqemu
all: boot1 write_boot1 boot2 write_boot2 kernel write_kernel hexdump launchqemu

#clean:
	#rm -f *.bin $(Projeto_Bootloader) *~

#mydisk:
	#dd if=/dev/zero of=$(Projeto_Bootloader) bs=512 count=100 status=noxfer

boot1:
	nasm -f bin $(boot1).asm -o $(boot1).bin

write_boot1:
	dd if=$(boot1).bin of=$(Projeto_Bootloader) bs=512 count=1 conv=notrunc status=noxfer

boot2:
	nasm -f bin $(boot2).asm -o $(boot2).bin

write_boot2:
	dd if=$(boot2).bin of=$(Projeto_Bootloader) bs=512 seek=1 count=512 conv=notrunc status=noxfer

kernel:
	nasm -f bin $(kernel).asm -o $(kernel).bin

write_kernel:
	dd if=$(kernel).bin of=$(Projeto_Bootloader) bs=512 seek=2 count=3072 conv=notrunc

hexdump:
	hexdump $(file)

launchqemu:
	qemu-system-i386 -fda $(Projeto_Bootloader)

