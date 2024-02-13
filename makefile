rw: rw.o
	ld -s -o rw rw.o
	
rw.o: rw.s
	as -o rw.o rw.s	

clean: rw.o
	rm rw.o
