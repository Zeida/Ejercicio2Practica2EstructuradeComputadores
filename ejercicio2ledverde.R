.global _start
_start:

movia r2, 0x10000010 	//Green LED parallel port
addi r3, r3, 9 			//guarda en r3 un 9
movia r1, 0x1 			//guarda en r1-0x1

INI:

stwio r1, 0(r2)			//Guarda 0x10000010, es decir la direccion del led verde, en r1
movia r4, 500000 		// Contador Temporal en mhz
roli r1, r1, 1			//con addi sumador binario // rota 1  == addi r1, r1,1
subi r3, r3, 1			//va restando 1 al 9 inicial

DELAY1:

subi r4, r4, 1 			//menos 1 al contador temporal
bne r4, r0, DELAY1 		// si r4=/r0 vuelve a ejecutar delay1
br INI 					// salta a ini si r4==r0

.end