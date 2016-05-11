asm = nasm
ld = ld

asm_flags = -f elf -F dwarf -g
ld_flags = -lc

a3: a3.o
	${ld} ${ld_flags} -o a3 a3.o

a3.o: a3.asm
	${asm} ${asm_flags} a3.asm

a2: a2.o
	${ld} ${ld_flags} -o a2 a2.o

a2.o: a2.asm
	${asm} ${asm_flags} a2.asm

a1: a1.o
	${ld} ${ld_flags} -o a1 a1.o

a1.o: a1.asm
	${asm} ${asm_flags} a1.asm

hi: hi.o
	${ld} ${lad_flags} -o hi hi.o

hi.o: hi.asm
	${asm} ${asm_flags} hi.asm

clean:
	rm -f hi hi.o a1 a1.o a2 a2.o a3 a3.o

beer:
	echo "Served."
