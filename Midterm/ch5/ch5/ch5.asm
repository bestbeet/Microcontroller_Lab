.INCLUDE "m328Pdef.inc"
.DEF	var_a = R16
.DEF	zero = R17
.DEF	count = R18

.CSEG
.ORG		0x0000
	ldi		var_a,0x00
	out		DDRB,var_a
	ldi		var_a,0xFF
	out		DDRC,var_a
	clr		zero
	clr		count

MAIN:	in		var_a,PINB
		clr		count
LOOP:	lsl		var_a
		adc		count, zero
		cpi		var_a, 0
		brne	LOOP

		ldi		ZL,low(TB7SEG*2)
		ldi		ZH,high(TB7SEG*2)
		add 	ZL,count
		adc		ZH,zero
		lpm
		com 	R0
		out 	PORTC,R0
		rjmp	MAIN

TB7SEG:	.db 0b00111111, 0b00000110, 0b01011011, 0b01001111
		.db 0b01100110, 0b01101101, 0b01111101, 0b00000111
		.db 0b01111111, 0b01101111, 0b01110111, 0b01111100
		.db 0b00111001, 0b01011110, 0b01111001, 0b01110001
