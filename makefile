asm = nasm
ld = ld

asm_flags = -f elf -F dwarf -g
ld_flags = -lc -I/lib/ld-linux.so.2 

all: a1 a2 a3 a4 hi beer
	make clean

a4: a4.o
	${ld} ${ld_flags} -o a4 a4.o

a4.o: a4.asm
	${asm} ${asm_flags} a4.asm

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
	rm -f *.o

cleaner:
	rm -f hi hi.o a1 a1.o a2 a2.o a3 a3.o a4 a4.o

beer:
	echo "Served."
