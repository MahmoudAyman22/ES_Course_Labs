
_APP_ToggleLED_ISR:

;ext_int_test.c,6 :: 		void APP_ToggleLED_ISR(void) {
;ext_int_test.c,7 :: 		LED_Toggle(GPIO_PORTC, GPIO_PIN0);
	MOVLW      2
	MOVWF      FARG_LED_Toggle_Port+0
	CLRF       FARG_LED_Toggle_Pin+0
	CALL       _LED_Toggle+0
;ext_int_test.c,8 :: 		}
L_end_APP_ToggleLED_ISR:
	RETURN
; end of _APP_ToggleLED_ISR

_EXT_INT_Test:

;ext_int_test.c,9 :: 		void EXT_INT_Test(void) {
;ext_int_test.c,10 :: 		LED_Init(GPIO_PORTC, GPIO_PIN0);
	MOVLW      2
	MOVWF      FARG_LED_Init_Port+0
	CLRF       FARG_LED_Init_Pin+0
	CALL       _LED_Init+0
;ext_int_test.c,11 :: 		SWITCH_Init(GPIO_PIN0);
	CLRF       FARG_SWITCH_Init_pin+0
	CALL       _SWITCH_Init+0
;ext_int_test.c,12 :: 		EXT_INT0_Init();
	CALL       _EXT_INT0_Init+0
;ext_int_test.c,13 :: 		EXT_INT0_SetCallback(APP_ToggleLED_ISR);
	MOVLW      _APP_ToggleLED_ISR+0
	MOVWF      FARG_EXT_INT0_SetCallback_ptr+0
	MOVLW      hi_addr(_APP_ToggleLED_ISR+0)
	MOVWF      FARG_EXT_INT0_SetCallback_ptr+1
	MOVLW      0
	MOVWF      FARG_EXT_INT0_SetCallback_ptr+2
	MOVLW      0
	CALL       _EXT_INT0_SetCallback+0
;ext_int_test.c,14 :: 		EXT_INT0_Enable();
	CALL       _EXT_INT0_Enable+0
;ext_int_test.c,15 :: 		while(1) {
L_EXT_INT_Test0:
;ext_int_test.c,16 :: 		}
	GOTO       L_EXT_INT_Test0
;ext_int_test.c,17 :: 		}
L_end_EXT_INT_Test:
	RETURN
; end of _EXT_INT_Test
