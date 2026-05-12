#include "STD_TYPES.h"
#include "LED_interface.h"
#include "SWITCH_interface.h"
#include "EXT_INT0_interface.h"
#include "GPIO_interface.h"
void APP_ToggleLED_ISR(void) {
    LED_Toggle(GPIO_PORTC, GPIO_PIN0);
}
void EXT_INT_Test(void) {
    LED_Init(GPIO_PORTC, GPIO_PIN0);
    SWITCH_Init(GPIO_PIN0); 
    EXT_INT0_Init();
    EXT_INT0_SetCallback(APP_ToggleLED_ISR);
    EXT_INT0_Enable();
    while(1) {
    }
}