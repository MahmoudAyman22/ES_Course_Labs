
_UART_Init:

;UART_program.c,6 :: 		void UART_Init(u16 BaudRate_CalculatedValue) {
;UART_program.c,8 :: 		SPBRG = BaudRate_CalculatedValue;
	MOVF       FARG_UART_Init_BaudRate_CalculatedValue+0, 0
	MOVWF      153
;UART_program.c,10 :: 		SET_BIT(TRISC, 6); // TX
	BSF        135, 6
;UART_program.c,11 :: 		SET_BIT(TRISC, 7); // RX
	BSF        135, 7
;UART_program.c,12 :: 		TXSTA = 0b00100100;
	MOVLW      36
	MOVWF      152
;UART_program.c,13 :: 		RCSTA = 0b10010000;
	MOVLW      144
	MOVWF      24
;UART_program.c,14 :: 		}
L_end_UART_Init:
	RETURN
; end of _UART_Init

_UART_Transmit:

;UART_program.c,16 :: 		void UART_Transmit(u8 Data) {
;UART_program.c,17 :: 		while (GET_BIT(PIR1, 4) == 0);
L_UART_Transmit0:
	MOVF       12, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVLW      1
	ANDWF      R0+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_UART_Transmit1
	GOTO       L_UART_Transmit0
L_UART_Transmit1:
;UART_program.c,18 :: 		TXREG = Data;
	MOVF       FARG_UART_Transmit_Data+0, 0
	MOVWF      25
;UART_program.c,19 :: 		}
L_end_UART_Transmit:
	RETURN
; end of _UART_Transmit

_UART_Receive:

;UART_program.c,21 :: 		u8 UART_Receive(void) {
;UART_program.c,22 :: 		while (GET_BIT(PIR1, 5) == 0);
L_UART_Receive2:
	MOVLW      5
	MOVWF      R1+0
	MOVF       12, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
L__UART_Receive7:
	BTFSC      STATUS+0, 2
	GOTO       L__UART_Receive8
	RRF        R0+0, 1
	BCF        R0+0, 7
	ADDLW      255
	GOTO       L__UART_Receive7
L__UART_Receive8:
	MOVLW      1
	ANDWF      R0+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_UART_Receive3
	GOTO       L_UART_Receive2
L_UART_Receive3:
;UART_program.c,23 :: 		return RCREG;
	MOVF       26, 0
	MOVWF      R0+0
;UART_program.c,24 :: 		}
L_end_UART_Receive:
	RETURN
; end of _UART_Receive
