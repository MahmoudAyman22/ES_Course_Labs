#include "STD_TYPES.h"
#include "ADC_interface.h"
#include "GPIO_interface.h"

void ADC_Test(void) {
    u16 Digital_Value = 0;
    u16 Temperature = 0;
    GPIO_SetPinDirection(GPIO_PORTA, GPIO_PIN0, GPIO_INPUT);
    ADC_Init(); 
    while(1) {
        Digital_Value = ADC_ReadChannel(ADC_CHANNEL_AN0);
        Temperature = (Digital_Value * 500) / 1024;
        
    }
}