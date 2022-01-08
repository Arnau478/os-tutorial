# Getting ready

In this short chapter, we will set up all the tools and libraries we will need

## NASM

NASM (Netwide assembler) is the tool we will be using to assemble (mainly) our bootloader code.

You can get it using almost any package manager. If you are using windows, you can also download it from [here](https://www.nasm.us/pub/nasm/releasebuilds/).

## C compiler

I'll be using **GNU gcc**, but any C compiler should work. We will be using it to compile our kernel.

## QEMU

I recommend using QEMU, but you can also use any other x86 emulator. It's as easy to install as NASM. We won't be running our OS in our own machine, so we need an emulator.

## GNU Make

You can also use `cmake`, `ant` or any similar tool. We will be using it in further chapters, when we have a bit larger OS

### Ready?

If you have all that installed, we are mostly ready to start developing our (not so) amazing OS.