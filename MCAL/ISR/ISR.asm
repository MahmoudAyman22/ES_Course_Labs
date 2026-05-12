
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;ISR.c,11 :: 		void interrupt(void) {
;ISR.c,13 :: 		if (GET_BIT(INTCON, 1) == 1) {
	MOVF       11, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVLW      1
	ANDWF      R0+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt0
;ISR.c,15 :: 		CLR_BIT(INTCON, 1);
	MOVLW      253
	ANDWF      11, 1
;ISR.c,17 :: 		if (EXT_INT0_Callback != NULL_PTR) {
	MOVF       _EXT_INT0_Callback+0, 0
	MOVWF      R1+0
	MOVF       _EXT_INT0_Callback+1, 0
	MOVWF      R1+1
	MOVF       _EXT_INT0_Callback+2, 0
	MOVWF      R1+2
	MOVF       _EXT_INT0_Callback+3, 0
	MOVWF      R1+3
	MOVLW      0
	MOVWF      R0+0
	XORWF      R1+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt6
	MOVF       R0+0, 0
	XORWF      R1+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt6
	MOVF       R0+0, 0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt6
	MOVF       R1+0, 0
	XORLW      0
L__interrupt6:
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt1
;ISR.c,18 :: 		EXT_INT0_Callback();
	MOVF       _EXT_INT0_Callback+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       _EXT_INT0_Callback+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoIFC+0
;ISR.c,19 :: 		}
L_interrupt1:
;ISR.c,20 :: 		}
L_interrupt0:
;ISR.c,22 :: 		if (GET_BIT(INTCON, 2) == 1) {
	MOVF       11, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVLW      1
	ANDWF      R0+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt2
;ISR.c,23 :: 		CLR_BIT(INTCON, 2);
	MOVLW      251
	ANDWF      11, 1
;ISR.c,25 :: 		TMR0 = 6;
	MOVLW      6
	MOVWF      1
;ISR.c,27 :: 		if (TIMER0_CallBack != NULL_PTR) {
	MOVF       _TIMER0_CallBack+0, 0
	MOVWF      R1+0
	MOVF       _TIMER0_CallBack+1, 0
	MOVWF      R1+1
	MOVF       _TIMER0_CallBack+2, 0
	MOVWF      R1+2
	MOVF       _TIMER0_CallBack+3, 0
	MOVWF      R1+3
	MOVLW      0
	MOVWF      R0+0
	XORWF      R1+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt7
	MOVF       R0+0, 0
	XORWF      R1+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt7
	MOVF       R0+0, 0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt7
	MOVF       R1+0, 0
	XORLW      0
L__interrupt7:
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt3
;ISR.c,28 :: 		TIMER0_CallBack();
	MOVF       _TIMER0_CallBack+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       _TIMER0_CallBack+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoIFC+0
;ISR.c,29 :: 		}
L_interrupt3:
;ISR.c,30 :: 		}
L_interrupt2:
;ISR.c,31 :: 		}
L_end_interrupt:
L__interrupt5:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

ISR____?ag:

L_end_ISR___?ag:
	RETURN
; end of ISR____?ag
