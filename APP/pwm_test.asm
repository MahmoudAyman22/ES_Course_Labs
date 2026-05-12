
_APP_ChangeSpeed_ISR:

;pwm_test.c,6 :: 		void APP_ChangeSpeed_ISR(void) {
;pwm_test.c,7 :: 		Duty_State++;
	INCF       _Duty_State+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      _Duty_State+0
;pwm_test.c,8 :: 		if(Duty_State > 3) {
	MOVF       _Duty_State+0, 0
	SUBLW      3
	BTFSC      STATUS+0, 0
	GOTO       L_APP_ChangeSpeed_ISR0
;pwm_test.c,9 :: 		Duty_State = 0;
	CLRF       _Duty_State+0
;pwm_test.c,10 :: 		}
L_APP_ChangeSpeed_ISR0:
;pwm_test.c,11 :: 		if(Duty_State == 0)      PWM_SetDutyCycle(25);
	MOVF       _Duty_State+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_APP_ChangeSpeed_ISR1
	MOVLW      25
	MOVWF      FARG_PWM_SetDutyCycle_DutyCycle_Percent+0
	CALL       _PWM_SetDutyCycle+0
	GOTO       L_APP_ChangeSpeed_ISR2
L_APP_ChangeSpeed_ISR1:
;pwm_test.c,12 :: 		else if(Duty_State == 1) PWM_SetDutyCycle(50);
	MOVF       _Duty_State+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_APP_ChangeSpeed_ISR3
	MOVLW      50
	MOVWF      FARG_PWM_SetDutyCycle_DutyCycle_Percent+0
	CALL       _PWM_SetDutyCycle+0
	GOTO       L_APP_ChangeSpeed_ISR4
L_APP_ChangeSpeed_ISR3:
;pwm_test.c,13 :: 		else if(Duty_State == 2) PWM_SetDutyCycle(75);
	MOVF       _Duty_State+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_APP_ChangeSpeed_ISR5
	MOVLW      75
	MOVWF      FARG_PWM_SetDutyCycle_DutyCycle_Percent+0
	CALL       _PWM_SetDutyCycle+0
	GOTO       L_APP_ChangeSpeed_ISR6
L_APP_ChangeSpeed_ISR5:
;pwm_test.c,14 :: 		else if(Duty_State == 3) PWM_SetDutyCycle(100);
	MOVF       _Duty_State+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_APP_ChangeSpeed_ISR7
	MOVLW      100
	MOVWF      FARG_PWM_SetDutyCycle_DutyCycle_Percent+0
	CALL       _PWM_SetDutyCycle+0
L_APP_ChangeSpeed_ISR7:
L_APP_ChangeSpeed_ISR6:
L_APP_ChangeSpeed_ISR4:
L_APP_ChangeSpeed_ISR2:
;pwm_test.c,15 :: 		}
L_end_APP_ChangeSpeed_ISR:
	RETURN
; end of _APP_ChangeSpeed_ISR

_PWM_Test:

;pwm_test.c,16 :: 		void PWM_Test(void) {
;pwm_test.c,17 :: 		PWM_Init();
	CALL       _PWM_Init+0
;pwm_test.c,18 :: 		EXT_INT0_Init();
	CALL       _EXT_INT0_Init+0
;pwm_test.c,19 :: 		EXT_INT0_SetCallback(APP_ChangeSpeed_ISR);
	MOVLW      _APP_ChangeSpeed_ISR+0
	MOVWF      FARG_EXT_INT0_SetCallback_ptr+0
	MOVLW      hi_addr(_APP_ChangeSpeed_ISR+0)
	MOVWF      FARG_EXT_INT0_SetCallback_ptr+1
	MOVLW      0
	MOVWF      FARG_EXT_INT0_SetCallback_ptr+2
	MOVLW      0
	CALL       _EXT_INT0_SetCallback+0
;pwm_test.c,20 :: 		EXT_INT0_Enable();
	CALL       _EXT_INT0_Enable+0
;pwm_test.c,21 :: 		PWM_SetDutyCycle(25);
	MOVLW      25
	MOVWF      FARG_PWM_SetDutyCycle_DutyCycle_Percent+0
	CALL       _PWM_SetDutyCycle+0
;pwm_test.c,22 :: 		while(1) {
L_PWM_Test8:
;pwm_test.c,23 :: 		}
	GOTO       L_PWM_Test8
;pwm_test.c,24 :: 		}
L_end_PWM_Test:
	RETURN
; end of _PWM_Test
