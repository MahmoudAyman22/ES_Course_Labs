#include "STD_TYPES.h"
#include "BIT_MATH.h"
#include "PWM_interface.h"
#include "PWM_private.h"

void PWM_Init(void) {
    
    PR2 = 255;     
    CCP1CON = 0b00001100;
    T2CON = 0b00000110; 
}

void PWM_SetDutyCycle(u8 DutyCycle_Percent) {
    u16 Total_Value;
    if(DutyCycle_Percent > 100) {
        DutyCycle_Percent = 100;
    }

    Total_Value = ((u16)(PR2 + 1) * 4 * DutyCycle_Percent) / 100;
    CCPR1L = (u8)(Total_Value >> 2);
    CCP1CON &= 0b11001111;              
    CCP1CON |= ((Total_Value & 0x03) << 4); 
}