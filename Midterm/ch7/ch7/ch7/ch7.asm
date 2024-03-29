 .INCLUDE "m328Pdef.inc"
 .DEF	VAR_A = R16
 .DEF	TEM = R17

 .CSEG
 .ORG 0x000
 ldi VAR_A,0xFF
 out DDRB,VAR_A

 ldi VAR_A,0x00
 out  DDRC,VAR_A
 ldi TEM,0x00

 MAIN: in VAR_A,PINC
		andi VAR_A,0x70
		swap VAR_A
		ldi ZL,low(TB_LED*2)
		ldi ZH,high(TB_LED*2)
		add ZL,VAR_A
		adc ZH,TEM
		lpm
		com R0
		out PORTB,R0
		rjmp MAIN

TB_LED: .DB 0b11111111, 0b11111110
		.DB 0b11111100, 0b11111000
		.DB 0b11110000, 0b11100000
		.DB 0b11000000, 0b10000000

.DSEG
.ESEG