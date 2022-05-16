gui_c.exe: gui_c.o
	gcc gui_c.c -o gui_c.exe `pkg-config --cflags --libs gtk+-3.0`

gui_c.o: gui_c.c
	gcc -c gui_c.c `pkg-config --cflags --libs gtk+-3.0`

clean:
	rm *.o *.exe