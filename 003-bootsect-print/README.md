# Boot sector print

In this chapter, we'll learn how to print a string in the screen, using BIOS interrupts.

## Interrupts

An interrupt is basically an event that, when it's fired, the CPU stops doing whatever was doing, and executes a piece of code.

The BIOS already provides us with some interrupts (printing to screen, reading from disk...). We'll use [interrupt 0x10](https://es.wikipedia.org/wiki/Int_10h), which is capable of "screen stuff".

Here we have a simple code that prints "H" to screen:
```
mov ah, 0x0E
mov al, 'H'
int 0x10
```

First, we set `ah` register (which holds the function that we want to execute) to `0x0E`. That means "print to teletype".

Secondly, we load our character into `al`, where it's expected.

Finally, we call interrupt `0x10`, to actually print the character.

You can try it, and you should see a `H` printed on screen. But remember to add the zero-padding and magic number!

If we wanted to print "Hello", we would have to do something like this:
```
mov ah, 0x0E ; Set function mode
mov al, 'H'
int 0x10
mov al, 'e'
int 0x10
mov al, 'l'
int 0x10
int 0x10 ; 'l' already in al register!
mov al, 'o'
int 0x10
```

A lot of code, right?

## Printing strings

Printing character by character doesn't seem very useful... So we are going to write a function to do it for us.

You can try implementing it yourself, or you can take a look at `boot-print.asm`. It's a simple function that uses what we've learned to print a string on screen.

Then, on `bootsect.asm`, we just call that function and print "Hello World!" on screen.

We've just implemented the boot `print` function! We're going to save that for later.