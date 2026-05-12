#include "STD_TYPES.h"
#include "TIMER0_interface.h"
#include "GPIO_interface.h"
#include "GIE_interface.h"
volatile u16 Timer_Counter = 0;
void APP_Timer_ISR(void) {
    u8 current;
    Timer_Counter++;
    if(Timer_Counter >= 500) {
        Timer_Counter = 0;
        current = GPIO_GetPinValue(GPIO_PORTB, GPIO_PIN0);
        if(current == GPIO_HIGH) {
            GPIO_SetPinValue(GPIO_PORTB, GPIO_PIN0, GPIO_LOW);
        } else {
            GPIO_SetPinValue(GPIO_PORTB, GPIO_PIN0, GPIO_HIGH);
        }
    }
}
void Timer_Test(void) {
    GPIO_SetPinDirection(GPIO_PORTB, GPIO_PIN0, GPIO_OUTPUT);
    TIMER0_voidSetCallBack(APP_Timer_ISR);
    TIMER0_voidSetPreload(6);
    TIMER0_voidInit();
    TIMER0_voidEnableInterrupt();
    GIE_voidEnable();
    while(1) {
    }
}