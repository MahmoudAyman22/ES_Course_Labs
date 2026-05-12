
_PWM_Init:

;PWM_program.c,6 :: 		void PWM_Init(void) {
;PWM_program.c,8 :: 		PR2 = 255;
	MOVLW      255
	MOVWF      146
;PWM_program.c,9 :: 		CCP1CON = 0b00001100;
	MOVLW      12
	MOVWF      23
;PWM_program.c,10 :: 		T2CON = 0b00000110;
	MOVLW      6
	MOVWF      18
;PWM_program.c,11 :: 		}
L_end_PWM_Init:
	RETURN
; end of _PWM_Init

_PWM_SetDutyCycle:

;PWM_program.c,13 :: 		void PWM_SetDutyCycle(u8 DutyCycle_Percent) {
;PWM_program.c,15 :: 		if(DutyCycle_Percent > 100) {
	MOVF       FARG_PWM_SetDutyCycle_DutyCycle_Percent+0, 0
	SUBLW      100
	BTFSC      STATUS+0, 0
	GOTO       L_PWM_SetDutyCycle0
;PWM_program.c,16 :: 		DutyCycle_Percent = 100;
	MOVLW      100
	MOVWF      FARG_PWM_SetDutyCycle_DutyCycle_Percent+0
;PWM_program.c,17 :: 		}
L_PWM_SetDutyCycle0:
;PWM_program.c,19 :: 		Total_Value = ((u16)(PR2 + 1) * 4 * DutyCycle_Percent) / 100;
	INCF       146, 0
	MOVWF      R3+0
	MOVF       R3+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       FARG_PWM_SetDutyCycle_DutyCycle_Percent+0, 0
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Mul_16X16_U+0
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
;PWM_program.c,20 :: 		CCPR1L = (u8)(Total_Value >> 2);
	MOVF       R0+0, 0
	MOVWF      R2+0
	RRF        R2+0, 1
	BCF        R2+0, 7
	RRF        R2+0, 1
	BCF        R2+0, 7
	MOVF       R2+0, 0
	MOVWF      21
;PWM_program.c,21 :: 		CCP1CON &= 0b11001111;
	MOVLW      207
	ANDWF      23, 1
;PWM_program.c,22 :: 		CCP1CON |= ((Total_Value & 0x03) << 4);
	MOVLW      3
	ANDWF      R0+0, 0
	MOVWF      R2+0
	MOVF       R2+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	IORWF      23, 1
;PWM_program.c,23 :: 		}
L_end_PWM_SetDutyCycle:
	RETURN
; end of _PWM_SetDutyCycle
