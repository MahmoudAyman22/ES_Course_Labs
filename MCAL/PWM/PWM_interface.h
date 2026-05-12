#ifndef PWM_INTERFACE_H
#define PWM_INTERFACE_H

#include "STD_TYPES.h"

void PWM_Init(void);
void PWM_SetDutyCycle(u8 DutyCycle_Percent);

#endif