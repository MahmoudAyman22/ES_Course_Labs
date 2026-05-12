
_APP_Timer_ISR:

;timer_test.c,6 :: 		void APP_Timer_ISR(void) {
;timer_test.c,8 :: 		Timer_Counter++;
	INCF       _Timer_Counter+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      _Timer_Counter+0
;timer_test.c,9 :: 		if(Timer_Counter >= 500) {
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORLW      1
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__APP_Timer_ISR6
	MOVLW      244
	SUBWF      _Timer_Counter+0, 0
L__APP_Timer_ISR6:
	BTFSS      STATUS+0, 0
	GOTO       L_APP_Timer_ISR0
;timer_test.c,10 :: 		Timer_Counter = 0;
	CLRF       _Timer_Counter+0
;timer_test.c,11 :: 		current = GPIO_GetPinValue(GPIO_PORTB, GPIO_PIN0);
	MOVLW      1
	MOVWF      FARG_GPIO_GetPinValue_Port+0
	CLRF       FARG_GPIO_GetPinValue_Pin+0
	CALL       _GPIO_GetPinValue+0
;timer_test.c,12 :: 		if(current == GPIO_HIGH) {
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_APP_Timer_ISR1
;timer_test.c,13 :: 		GPIO_SetPinValue(GPIO_PORTB, GPIO_PIN0, GPIO_LOW);
	MOVLW      1
	MOVWF      FARG_GPIO_SetPinValue_Port+0
	CLRF       FARG_GPIO_SetPinValue_Pin+0
	CLRF       FARG_GPIO_SetPinValue_Value+0
	CALL       _GPIO_SetPinValue+0
;timer_test.c,14 :: 		} else {
	GOTO       L_APP_Timer_ISR2
L_APP_Timer_ISR1:
;timer_test.c,15 :: 		GPIO_SetPinValue(GPIO_PORTB, GPIO_PIN0, GPIO_HIGH);
	MOVLW      1
	MOVWF      FARG_GPIO_SetPinValue_Port+0
	CLRF       FARG_GPIO_SetPinValue_Pin+0
	MOVLW      1
	MOVWF      FARG_GPIO_SetPinValue_Value+0
	CALL       _GPIO_SetPinValue+0
;timer_test.c,16 :: 		}
L_APP_Timer_ISR2:
;timer_test.c,17 :: 		}
L_APP_Timer_ISR0:
;timer_test.c,18 :: 		}
L_end_APP_Timer_ISR:
	RETURN
; end of _APP_Timer_ISR

_Timer_Test:

;timer_test.c,19 :: 		void Timer_Test(void) {
;timer_test.c,20 :: 		GPIO_SetPinDirection(GPIO_PORTB, GPIO_PIN0, GPIO_OUTPUT);
	MOVLW      1
	MOVWF      FARG_GPIO_SetPinDirection_Port+0
	CLRF       FARG_GPIO_SetPinDirection_Pin+0
	CLRF       FARG_GPIO_SetPinDirection_Direction+0
	CALL       _GPIO_SetPinDirection+0
;timer_test.c,21 :: 		TIMER0_voidSetCallBack(APP_Timer_ISR);
	MOVLW      _APP_Timer_ISR+0
	MOVWF      FARG_TIMER0_voidSetCallBack_Copy_ptrToFunc+0
	MOVLW      hi_addr(_APP_Timer_ISR+0)
	MOVWF      FARG_TIMER0_voidSetCallBack_Copy_ptrToFunc+1
	MOVLW      0
	MOVWF      FARG_TIMER0_voidSetCallBack_Copy_ptrToFunc+2
	MOVLW      0
	CALL       _TIMER0_voidSetCallBack+0
;timer_test.c,22 :: 		TIMER0_voidSetPreload(6);
	MOVLW      6
	MOVWF      FARG_TIMER0_voidSetPreload_Copy_u8Preload+0
	CALL       _TIMER0_voidSetPreload+0
;timer_test.c,23 :: 		TIMER0_voidInit();
	CALL       _TIMER0_voidInit+0
;timer_test.c,24 :: 		TIMER0_voidEnableInterrupt();
	CALL       _TIMER0_voidEnableInterrupt+0
;timer_test.c,25 :: 		GIE_voidEnable();
	CALL       _GIE_voidEnable+0
;timer_test.c,26 :: 		while(1) {
L_Timer_Test3:
;timer_test.c,27 :: 		}
	GOTO       L_Timer_Test3
;timer_test.c,28 :: 		}
L_end_Timer_Test:
	RETURN
; end of _Timer_Test
