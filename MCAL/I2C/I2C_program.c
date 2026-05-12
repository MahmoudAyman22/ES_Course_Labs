#include "STD_TYPES.h"
#include "BIT_MATH.h"
#include "I2C_interface.h"
#include "I2C_private.h"
void I2C_InitMaster(u8 Address_BaudRate_Calculated) {
    SET_BIT(TRISC, 3); 
    SET_BIT(TRISC, 4);
    SSPADD = Address_BaudRate_Calculated; 
    SSPCON1 = 0b00101000;  
    SSPSTAT = 0b00000000;
}
void I2C_Start(void) {
    SET_BIT(SSPCON2, 0);
    while(GET_BIT(SSPCON2, 0) == 1);
}
void I2C_Stop(void) {
    SET_BIT(SSPCON2, 2);
    while(GET_BIT(SSPCON2, 2) == 1);
}
void I2C_Write(u8 Data) {
    SSPBUF = Data;
    while(GET_BIT(SSPSTAT, 2) == 1);
}
u8 I2C_Read(u8 Ack) {
    u8 received_data;
    SET_BIT(SSPCON2, 3);
    while(GET_BIT(SSPSTAT, 0) == 0);
    received_data = SSPBUF;
    if(Ack) {
        CLR_BIT(SSPCON2, 5); 
    } else {
        SET_BIT(SSPCON2, 5); 
    }
    SET_BIT(SSPCON2, 4);
    while(GET_BIT(SSPCON2, 4) == 1);
    
    return received_data;
}