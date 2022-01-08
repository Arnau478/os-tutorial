# Assembly code

In this chapter, we will be learning how NASM converts an assembly file into machine code.

Let's take for instance the following code:
```
mov ax, 0xAB ; put 0xAB in ax register
mov bx, 0xCD ; put 0xCD in bx
add ax, bx
```
If we assemble it using `nasm code.asm -f bin -o code.bin`, that will generate a raw binary file containing our code.

Now, we can use `hexdump code.bin` command, which will output something similar to:
```
b8 ab 00 bb cd 00 01 d8
```
The file itself is binary is in binary, but we use hexadecimal to represent it.

Also, there is no distinction between **data** and **code**, only the context in which it appears. That will be important later.

## Magic number

We are going to start writing our bootloader. But what makes a bootloader an actual bootloader? Well, there is something called **magic number**.

When the computer boots, the first thing loaded is the **boot sector**. The boot sector is always made up of 512 bytes. The BIOS will load first 512 bytes from our **OS** image to memory, and start executing it.

To confirm that the loaded sector is a bootable one, the BIOS looks for the **magic number**.

The magic number is basically a `0xAA55` on the last two bytes. That means that our boot sector binary file, should:
- Be 512 bytes long
- End with 0xAA55

Luckily for us, NASM has a set of tools that will help us with this.

## Start coding the boot sector

Take a look at `bootsect.asm` file.
```
jmp $
```
In NASM, `$` means "current address"; so a jump to the current address will lead into an infinite loop.

```
times 510-($-$$) db 0
dw 0xAA55
```
That last bit is slightly more complicated. We first write a null byte (db 0), but many times. That number can be calculated like this: `510-($-$$)`. As we've seen, `$` means "current address", and `$$` means "beginning of the current sector". Don't care much about it, just that it calculates the correct amount of zeroes, so the boot sector is 512 bytes long.

Then, the `dw 0xAA55` just writes that magic number.

Note that we use `dw` instead of `db` when writing the magic number. That's because of 0xAA55 being a **w**ord (2 bytes), not a **b**yte.

## Test it!

First, assemble the code like this: `nasm bootsect.asm -f bin -o bootsect.bin`.

Then, to run it on qemu, just run `qemu-system-i386 bootsect.bin`.

You should see `Booting from hard disk...` and a blinking cursor right below. If that's the case, congratulations! You've made your first bootloader!

In the next chapter, we'll be writing some text to the screen, using BIOS interrupts.