
_I2C_Test:

;i2c_test.c,3 :: 		void I2C_Test(void) {
;i2c_test.c,4 :: 		I2C_InitMaster(0x09);
	MOVLW      9
	MOVWF      FARG_I2C_InitMaster_Address_BaudRate_Calculated+0
	CALL       _I2C_InitMaster+0
;i2c_test.c,5 :: 		while(1) {
L_I2C_Test0:
;i2c_test.c,6 :: 		I2C_Start();
	CALL       _I2C_Start+0
;i2c_test.c,7 :: 		I2C_Write(0xA0); /* example slave address with write bit 0 */
	MOVLW      160
	MOVWF      FARG_I2C_Write_Data+0
	CALL       _I2C_Write+0
;i2c_test.c,8 :: 		I2C_Write(0x00); /* example internal register address */
	CLRF       FARG_I2C_Write_Data+0
	CALL       _I2C_Write+0
;i2c_test.c,9 :: 		I2C_Write(0x55); /* example data */
	MOVLW      85
	MOVWF      FARG_I2C_Write_Data+0
	CALL       _I2C_Write+0
;i2c_test.c,10 :: 		I2C_Stop();
	CALL       _I2C_Stop+0
;i2c_test.c,11 :: 		}
	GOTO       L_I2C_Test0
;i2c_test.c,12 :: 		}
L_end_I2C_Test:
	RETURN
; end of _I2C_Test
