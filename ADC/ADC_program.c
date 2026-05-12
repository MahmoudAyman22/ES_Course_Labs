#include "STD_TYPES.h"
#include "BIT_MATH.h"
#include "ADC_interface.h"
#include "ADC_private.h"

void ADC_Init(void) {
    ADCON1 = 0b10000000;
    ADCON0 = 0b01000001; 
}

u16 ADC_ReadChannel(u8 Channel) {
    ADCON0 &= 0b11000111;
    ADCON0 |= (Channel << 3);
    SET_BIT(ADCON0, 2);
    while(GET_BIT(ADCON0, 2) == 1);
    return ((ADRESH << 8) | ADRESL);
}