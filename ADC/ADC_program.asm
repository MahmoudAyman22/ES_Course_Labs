
_ADC_Init:

;ADC_program.c,6 :: 		void ADC_Init(void) {
;ADC_program.c,7 :: 		ADCON1 = 0b10000000;
	MOVLW      128
	MOVWF      159
;ADC_program.c,8 :: 		ADCON0 = 0b01000001;
	MOVLW      65
	MOVWF      31
;ADC_program.c,9 :: 		}
L_end_ADC_Init:
	RETURN
; end of _ADC_Init

_ADC_ReadChannel:

;ADC_program.c,11 :: 		u16 ADC_ReadChannel(u8 Channel) {
;ADC_program.c,12 :: 		ADCON0 &= 0b11000111;
	MOVLW      199
	ANDWF      31, 1
;ADC_program.c,13 :: 		ADCON0 |= (Channel << 3);
	MOVF       FARG_ADC_ReadChannel_Channel+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	IORWF      31, 1
;ADC_program.c,14 :: 		SET_BIT(ADCON0, 2);
	BSF        31, 2
;ADC_program.c,15 :: 		while(GET_BIT(ADCON0, 2) == 1);
L_ADC_ReadChannel0:
	MOVF       31, 0
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
	GOTO       L_ADC_ReadChannel1
	GOTO       L_ADC_ReadChannel0
L_ADC_ReadChannel1:
;ADC_program.c,16 :: 		return ((ADRESH << 8) | ADRESL);
	MOVF       158, 0
	MOVWF      R0+0
;ADC_program.c,17 :: 		}
L_end_ADC_ReadChannel:
	RETURN
; end of _ADC_ReadChannel
