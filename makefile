asm = nasm
ld = ld

asm_flags = -f elf
ld_flags = -s

hi: hi.o
	${ld} ${lad_flags} -o hi hi.o

hi.o: hi.asm
	${asm} ${asm_flags} hi.asm

clean:
	rm hi hi.o
