
_ADC_Test:

;adc_test.c,5 :: 		void ADC_Test(void) {
;adc_test.c,6 :: 		u16 Digital_Value = 0;
;adc_test.c,7 :: 		u16 Temperature = 0;
;adc_test.c,8 :: 		GPIO_SetPinDirection(GPIO_PORTA, GPIO_PIN0, GPIO_INPUT);
	CLRF       FARG_GPIO_SetPinDirection_Port+0
	CLRF       FARG_GPIO_SetPinDirection_Pin+0
	MOVLW      1
	MOVWF      FARG_GPIO_SetPinDirection_Direction+0
	CALL       _GPIO_SetPinDirection+0
;adc_test.c,9 :: 		ADC_Init();
	CALL       _ADC_Init+0
;adc_test.c,10 :: 		while(1) {
L_ADC_Test0:
;adc_test.c,11 :: 		Digital_Value = ADC_ReadChannel(ADC_CHANNEL_AN0);
	CLRF       FARG_ADC_ReadChannel_Channel+0
	CALL       _ADC_ReadChannel+0
;adc_test.c,14 :: 		}
	GOTO       L_ADC_Test0
;adc_test.c,15 :: 		}
L_end_ADC_Test:
	RETURN
; end of _ADC_Test
