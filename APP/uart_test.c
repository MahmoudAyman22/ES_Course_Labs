#include "STD_TYPES.h"
#include "UART_interface.h"
void UART_Test(void) {
    u8 Received_Char;
    UART_Init(25); 
    UART_Transmit('H');
    UART_Transmit('i');
    while(1) {
        Received_Char = UART_Receive();
        UART_Transmit(Received_Char);
    }
}