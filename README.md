RSXmode
=======

This program offers RSX commands for the Amstrad CPC computers family.

It allows the CPC to display more than one fixed resolution on a screen.
Everything is usable in Basic and does not require Z80 assembly language nor
hardware knowledge.

It is based on the work of Brian Cadge published in Popular Computing Weekly.
See [https://cpcrulez.fr/coding_src-list-RSX-mix_your_modes_POPU.htm]()

It has been reverse engineered and patched to allow 664, 6128 and the plus
family to run it. It is also able to change border color for each section.

![DEMORSX](rsxmode.png)

In the example above:

- section 0 uses mode 2, 640 pixels wide, 2 colors
- section 1 and 2 uses mode 0, 160 pixels wide, 16 colors
- section 3 uses mode 1, 320 pixels wide, 4 colors

Requirements
------------

In order to compile this program, you need:

- **Zasm** compiler [http://k1.spdns.de/Develop/Projects/zasm/]()

If you want to generate a DSK file that you can use with a CPC emulator, you
need:

- **addamsdosheader** utility [https://github.com/Zigazou/addamsdosheader]()
- **cpcxfs** (or cpcfs) [http://www.cpctech.org.uk/download.html]()
- **caprice32** or another emulator [https://github.com/ColinPitrat/caprice32]()

Compile
-------

    make

or

    make run

Demo
----

To run the demo:

    cap32 rsxmode.dsk

Once the emulator has launched:

    run"loadrsx
    run"demorsx

The RSX commands
----------------

The sections are in this order: 5, 0, 1, 2, 3, 4.

Sections 4 and 5 are not usable but you can still change the border for them.
They aren't usable because they are outside of the standard drawing zone.

### SETM

Set the mode for each section. This RSX requires and even number of
arguments.

    |SETM,section,mode,section,mode...

### BORD

Set the border color for each section. This RSX requires and even number of
arguments.

    |BORD,section,color,section,color...

### MODE

Tells the Amstrad CPC in which mode the Basic commands must work. Patching
Basic to detect in which mode it should operate is beyond my knowledges :-)

    |MODE,mode

### NORM

Disable the multi-modes mode and return to a standard mode.

    |NORM,mode

How it works
------------

It uses the fast interrupt of the CPC which occurs every 1/300th second. This
interrupt is synchronised on the CRTC refresh rate. Since the refresh rate is
of 50 Hz, the interrupt is generated 6 times per screen refresh. Using this
interrupt, we can not define arbitrary sections but it makes it possible to use
Basic and firmware at the same time.
