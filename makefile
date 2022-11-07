countdown: counter
example: cexample
uart: cuart

counter: display.o
	gcc -o display display.o

display.o: display.s lib/lcd.o
	as -o display.o display.s

lib/lcd.o: lib/utils.o lib/gpio.o lib/fileio.o
	as -o lib/lcd.o lib/lcd.s

lib/fileio.o: lib/fileio.s
	as -o lib/fileio.o lib/fileio.s

lib/gpio.o: lib/gpio.s
	as -o lib/gpio.o lib/gpio.s

lib/utils.o: lib/utils.s
	as -o lib/utils.o lib/utils.s

cexample: examples/countdown.c lib/lcd.s
	gcc -o countdown examples/countdown.c lib/lcd.s

cuart: uart/uart.c lib/lcd.s
	gcc -o uartx uart/uart.c lib/lcd.s -lwiringPi