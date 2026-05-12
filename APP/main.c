#include "STD_TYPES.h"
extern void EXT_INT_Test(void);
extern void Timer_Test(void);
extern void PWM_Test(void);
extern void ADC_Test(void);
extern void UART_Test(void);
extern void SPI_Test(void);
extern void I2C_Test(void);

void main(void) {
    /* Please Uncomment ONE of the test functions below at a time */
     // EXT_INT_Test();   
     // Timer_Test();    
     // PWM_Test();      
     // ADC_Test();       
     // UART_Test();      /* Echoes received characters */
     // SPI_Test();       /* SPI Master transmission */
     // I2C_Test();       /* I2C Master transmission */
    while (1) {
    }
}