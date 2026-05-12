#include "STD_TYPES.h"
#include "BIT_MATH.h"
#include "EXT_INT0_interface.h"
#include "EXT_INT0_config.h"
#include "EXT_INT0_private.h"

void (*EXT_INT0_Callback)(void) = NULL_PTR;

void EXT_INT0_Init(void) {
    SET_BIT(TRISB, 0);

#if EXT_INT0_SENSE_CONTROL == EXT_INT0_RISING_EDGE
    SET_BIT(OPTION_REG, 6); 
#elif EXT_INT0_SENSE_CONTROL == EXT_INT0_FALLING_EDGE
    CLR_BIT(OPTION_REG, 6);
#endif

    CLR_BIT(INTCON, 1);
}

void EXT_INT0_Enable(void) {
    SET_BIT(INTCON, 4); 
    SET_BIT(INTCON, 7); 
}

void EXT_INT0_Disable(void) {
    CLR_BIT(INTCON, 4); 
}

void EXT_INT0_SetEdge(u8 edge_type) {
    if (edge_type == EXT_INT0_RISING_EDGE) {
        SET_BIT(OPTION_REG, 6);
    }
    else if (edge_type == EXT_INT0_FALLING_EDGE) {
        CLR_BIT(OPTION_REG, 6);
    }
}

void EXT_INT0_SetCallback(void (*ptr)(void)) {
    if (ptr != NULL_PTR) {
        EXT_INT0_Callback = ptr;
    }
}