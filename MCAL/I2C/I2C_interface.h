#ifndef I2C_INTERFACE_H
#define I2C_INTERFACE_H

#include "STD_TYPES.h"

void I2C_InitMaster(u8 Address_BaudRate_Calculated);
void I2C_Start(void);
void I2C_Stop(void);
void I2C_Write(u8 Data);
u8 I2C_Read(u8 Ack);

#endif