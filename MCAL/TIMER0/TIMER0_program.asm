
_TIMER0_voidInit:

;TIMER0_program.c,7 :: 		void TIMER0_voidInit(void) {
;TIMER0_program.c,9 :: 		OPTION_REG &= 0b11000000;
	MOVLW      192
	ANDWF      129, 1
;TIMER0_program.c,10 :: 		OPTION_REG |= 0b00000010;
	BSF        129, 1
;TIMER0_program.c,11 :: 		}
L_end_TIMER0_voidInit:
	RETURN
; end of _TIMER0_voidInit

_TIMER0_voidSetPreload:

;TIMER0_program.c,13 :: 		void TIMER0_voidSetPreload(unsigned char Copy_u8Preload) {
;TIMER0_program.c,14 :: 		TMR0 = Copy_u8Preload;
	MOVF       FARG_TIMER0_voidSetPreload_Copy_u8Preload+0, 0
	MOVWF      1
;TIMER0_program.c,15 :: 		}
L_end_TIMER0_voidSetPreload:
	RETURN
; end of _TIMER0_voidSetPreload

_TIMER0_voidEnableInterrupt:

;TIMER0_program.c,17 :: 		void TIMER0_voidEnableInterrupt(void) {
;TIMER0_program.c,19 :: 		INTCON |= (1 << 5);
	BSF        11, 5
;TIMER0_program.c,20 :: 		}
L_end_TIMER0_voidEnableInterrupt:
	RETURN
; end of _TIMER0_voidEnableInterrupt

_TIMER0_voidSetCallBack:

;TIMER0_program.c,22 :: 		void TIMER0_voidSetCallBack(void (*Copy_ptrToFunc)(void)) {
;TIMER0_program.c,23 :: 		if (Copy_ptrToFunc != 0) {
	MOVF       FARG_TIMER0_voidSetCallBack_Copy_ptrToFunc+0, 0
	MOVWF      R1+0
	MOVF       FARG_TIMER0_voidSetCallBack_Copy_ptrToFunc+1, 0
	MOVWF      R1+1
	MOVF       FARG_TIMER0_voidSetCallBack_Copy_ptrToFunc+2, 0
	MOVWF      R1+2
	MOVF       FARG_TIMER0_voidSetCallBack_Copy_ptrToFunc+3, 0
	MOVWF      R1+3
	MOVLW      0
	MOVWF      R0+0
	XORWF      R1+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__TIMER0_voidSetCallBack5
	MOVF       R0+0, 0
	XORWF      R1+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__TIMER0_voidSetCallBack5
	MOVF       R0+0, 0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__TIMER0_voidSetCallBack5
	MOVF       R1+0, 0
	XORLW      0
L__TIMER0_voidSetCallBack5:
	BTFSC      STATUS+0, 2
	GOTO       L_TIMER0_voidSetCallBack0
;TIMER0_program.c,24 :: 		TIMER0_CallBack = Copy_ptrToFunc;
	MOVF       FARG_TIMER0_voidSetCallBack_Copy_ptrToFunc+0, 0
	MOVWF      _TIMER0_CallBack+0
	MOVF       FARG_TIMER0_voidSetCallBack_Copy_ptrToFunc+1, 0
	MOVWF      _TIMER0_CallBack+1
	MOVF       FARG_TIMER0_voidSetCallBack_Copy_ptrToFunc+2, 0
	MOVWF      _TIMER0_CallBack+2
	MOVF       FARG_TIMER0_voidSetCallBack_Copy_ptrToFunc+3, 0
;TIMER0_program.c,25 :: 		}
L_TIMER0_voidSetCallBack0:
;TIMER0_program.c,26 :: 		}
L_end_TIMER0_voidSetCallBack:
	RETURN
; end of _TIMER0_voidSetCallBack
