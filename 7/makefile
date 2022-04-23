run: main.exe
	./main.exe

main.exe: main.o strcpy.o
	gcc main.o strcpy.o -o main.exe

strcpy.o: strcpy.s
	yasm -felf64 -o strcpy.o strcpy.s

main.o: main.c
	gcc -c main.c

.PHONY : clean
clean :
	rm -rf *.o *.exe *.s *.out