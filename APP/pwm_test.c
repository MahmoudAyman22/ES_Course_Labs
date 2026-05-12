#include "STD_TYPES.h"
#include "PWM_interface.h"
#include "EXT_INT0_interface.h"
#include "GPIO_interface.h"
volatile u8 Duty_State = 0; 
void APP_ChangeSpeed_ISR(void) {
    Duty_State++;
    if(Duty_State > 3) {
        Duty_State = 0;
    }
    if(Duty_State == 0)      PWM_SetDutyCycle(25);
    else if(Duty_State == 1) PWM_SetDutyCycle(50);
    else if(Duty_State == 2) PWM_SetDutyCycle(75);
    else if(Duty_State == 3) PWM_SetDutyCycle(100);
}
void PWM_Test(void) {
    PWM_Init();
    EXT_INT0_Init();
    EXT_INT0_SetCallback(APP_ChangeSpeed_ISR);
    EXT_INT0_Enable();
    PWM_SetDutyCycle(25);
    while(1) {
    }
}