#include "STD_TYPES.h"
#include "I2C_interface.h"
void I2C_Test(void) {
    I2C_InitMaster(0x09);  
    while(1) {
        I2C_Start();
        I2C_Write(0xA0); /* example slave address with write bit 0 */
        I2C_Write(0x00); /* example internal register address */
        I2C_Write(0x55); /* example data */
        I2C_Stop();
    }
}