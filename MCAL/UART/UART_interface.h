#ifndef UART_INTERFACE_H
#define UART_INTERFACE_H

#include "STD_TYPES.h"

void UART_Init(u16 BaudRate_CalculatedValue);
void UART_Transmit(u8 Data);
u8 UART_Receive(void);

#endif