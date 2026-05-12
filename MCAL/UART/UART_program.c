#include "STD_TYPES.h"
#include "BIT_MATH.h"
#include "UART_interface.h"
#include "UART_private.h"

void UART_Init(u16 BaudRate_CalculatedValue) {

    SPBRG = BaudRate_CalculatedValue; 

    SET_BIT(TRISC, 6); // TX
    SET_BIT(TRISC, 7); // RX
    TXSTA = 0b00100100;
    RCSTA = 0b10010000;
}

void UART_Transmit(u8 Data) {
    while (GET_BIT(PIR1, 4) == 0);
    TXREG = Data;
}

u8 UART_Receive(void) {
    while (GET_BIT(PIR1, 5) == 0);
    return RCREG;
}