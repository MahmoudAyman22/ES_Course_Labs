#include "STD_TYPES.h"
#include "BIT_MATH.h"


#define INTCON *((volatile u8*)0x0B)
#define TMR0   *((volatile u8*)0x01)

extern void (*EXT_INT0_Callback)(void);
extern void (*TIMER0_CallBack)(void);

void interrupt(void) {
 
    if (GET_BIT(INTCON, 1) == 1) {
        
        CLR_BIT(INTCON, 1);
        
        if (EXT_INT0_Callback != NULL_PTR) {
            EXT_INT0_Callback();
        }
    }
    
    if (GET_BIT(INTCON, 2) == 1) {
        CLR_BIT(INTCON, 2);
        
        TMR0 = 6; 
        
        if (TIMER0_CallBack != NULL_PTR) {
            TIMER0_CallBack();
        }
    }
}