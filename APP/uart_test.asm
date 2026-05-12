
_UART_Test:

;uart_test.c,3 :: 		void UART_Test(void) {
;uart_test.c,5 :: 		UART_Init(25);
	MOVLW      25
	MOVWF      FARG_UART_Init_BaudRate_CalculatedValue+0
	CALL       _UART_Init+0
;uart_test.c,6 :: 		UART_Transmit('H');
	MOVLW      72
	MOVWF      FARG_UART_Transmit_Data+0
	CALL       _UART_Transmit+0
;uart_test.c,7 :: 		UART_Transmit('i');
	MOVLW      105
	MOVWF      FARG_UART_Transmit_Data+0
	CALL       _UART_Transmit+0
;uart_test.c,8 :: 		while(1) {
L_UART_Test0:
;uart_test.c,9 :: 		Received_Char = UART_Receive();
	CALL       _UART_Receive+0
;uart_test.c,10 :: 		UART_Transmit(Received_Char);
	MOVF       R0+0, 0
	MOVWF      FARG_UART_Transmit_Data+0
	CALL       _UART_Transmit+0
;uart_test.c,11 :: 		}
	GOTO       L_UART_Test0
;uart_test.c,12 :: 		}
L_end_UART_Test:
	RETURN
; end of _UART_Test
