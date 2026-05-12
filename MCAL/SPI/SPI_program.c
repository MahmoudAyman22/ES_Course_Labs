#include "STD_TYPES.h"
#include "BIT_MATH.h"
#include "SPI_interface.h"
#include "SPI_private.h"

void SPI_InitMaster(void) {
    /* Configure IO Pins for SPI Master */
    CLR_BIT(TRISC, 5); // SDO -> Output
    SET_BIT(TRISC, 4); // SDI -> Input
    CLR_BIT(TRISC, 3); // SCK -> Output
    /*Configure SSPSTAT: SMP=0, CKE=0 */
    SSPSTAT = 0b00000000;
    /*  Configure SSPCON: SSPEN=1 (Enable), SPI Master mode Fosc/4 (0000) */
    SSPCON = 0b00100000; 
}
void SPI_InitSlave(void) {
    /* Configure IO Pins for SPI Slave */
    CLR_BIT(TRISC, 5); // SDO -> Output
    SET_BIT(TRISC, 4); // SDI -> Input
    SET_BIT(TRISC, 3); // SCK -> Input
    /*  Configure SSPSTAT */
    SSPSTAT = 0b00000000;
    /*Configure SSPCON: SSPEN=1, SPI Slave mode with SS disabled (0101) */
    SSPCON = 0b00100101; 
}
u8 SPI_Transfer(u8 Data) {
    /*  Load data into the buffer */
    SSPBUF = Data;
    /*  Wait until transmission/reception is complete (BF is bit 0 of SSPSTAT) */
    while (GET_BIT(SSPSTAT, 0) == 0);   
    /*  Return the received data */
    return SSPBUF;
}