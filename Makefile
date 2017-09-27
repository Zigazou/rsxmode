ALL: rsxmode.dsk rsxmode.bin dsk

rsxmode.bin: rsxmode.z80
	zasm --z80 rsxmode.z80 -o rsxmode.bin
	addamsdosheader rsxmode.bin binary a000 a000

rsxmode.dsk:
	cpcxfs -nd rsxmode.dsk

dsk: rsxmode.bin rsxmode.dsk loadrsx.bas demorsx.bas
	cpcxfs rsxmode.dsk -f -p rsxmode.bin
	cpcxfs rsxmode.dsk -f -p loadrsx.bas
	cpcxfs rsxmode.dsk -f -p demorsx.bas

run: dsk
	cap32 rsxmode.dsk
