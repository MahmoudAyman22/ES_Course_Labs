
_I2C_InitMaster:

;I2C_program.c,5 :: 		void I2C_InitMaster(u8 Address_BaudRate_Calculated) {
;I2C_program.c,6 :: 		SET_BIT(TRISC, 3);
	BSF        135, 3
;I2C_program.c,7 :: 		SET_BIT(TRISC, 4);
	BSF        135, 4
;I2C_program.c,8 :: 		SSPADD = Address_BaudRate_Calculated;
	MOVF       FARG_I2C_InitMaster_Address_BaudRate_Calculated+0, 0
	MOVWF      147
;I2C_program.c,9 :: 		SSPCON1 = 0b00101000;
	MOVLW      40
	MOVWF      20
;I2C_program.c,10 :: 		SSPSTAT = 0b00000000;
	CLRF       148
;I2C_program.c,11 :: 		}
L_end_I2C_InitMaster:
	RETURN
; end of _I2C_InitMaster

_I2C_Start:

;I2C_program.c,12 :: 		void I2C_Start(void) {
;I2C_program.c,13 :: 		SET_BIT(SSPCON2, 0);
	BSF        145, 0
;I2C_program.c,14 :: 		while(GET_BIT(SSPCON2, 0) == 1);
L_I2C_Start0:
	MOVF       145, 0
	MOVWF      R0+0
	MOVLW      1
	ANDWF      R0+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_I2C_Start1
	GOTO       L_I2C_Start0
L_I2C_Start1:
;I2C_program.c,15 :: 		}
L_end_I2C_Start:
	RETURN
; end of _I2C_Start

_I2C_Stop:

;I2C_program.c,16 :: 		void I2C_Stop(void) {
;I2C_program.c,17 :: 		SET_BIT(SSPCON2, 2);
	BSF        145, 2
;I2C_program.c,18 :: 		while(GET_BIT(SSPCON2, 2) == 1);
L_I2C_Stop2:
	MOVF       145, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVLW      1
	ANDWF      R0+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_I2C_Stop3
	GOTO       L_I2C_Stop2
L_I2C_Stop3:
;I2C_program.c,19 :: 		}
L_end_I2C_Stop:
	RETURN
; end of _I2C_Stop

_I2C_Write:

;I2C_program.c,20 :: 		void I2C_Write(u8 Data) {
;I2C_program.c,21 :: 		SSPBUF = Data;
	MOVF       FARG_I2C_Write_Data+0, 0
	MOVWF      19
;I2C_program.c,22 :: 		while(GET_BIT(SSPSTAT, 2) == 1);
L_I2C_Write4:
	MOVF       148, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVLW      1
	ANDWF      R0+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_I2C_Write5
	GOTO       L_I2C_Write4
L_I2C_Write5:
;I2C_program.c,23 :: 		}
L_end_I2C_Write:
	RETURN
; end of _I2C_Write

_I2C_Read:

;I2C_program.c,24 :: 		u8 I2C_Read(u8 Ack) {
;I2C_program.c,26 :: 		SET_BIT(SSPCON2, 3);
	BSF        145, 3
;I2C_program.c,27 :: 		while(GET_BIT(SSPSTAT, 0) == 0);
L_I2C_Read6:
	MOVF       148, 0
	MOVWF      R0+0
	MOVLW      1
	ANDWF      R0+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_I2C_Read7
	GOTO       L_I2C_Read6
L_I2C_Read7:
;I2C_program.c,28 :: 		received_data = SSPBUF;
	MOVF       19, 0
	MOVWF      R2+0
;I2C_program.c,29 :: 		if(Ack) {
	MOVF       FARG_I2C_Read_Ack+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_I2C_Read8
;I2C_program.c,30 :: 		CLR_BIT(SSPCON2, 5);
	MOVLW      223
	ANDWF      145, 1
;I2C_program.c,31 :: 		} else {
	GOTO       L_I2C_Read9
L_I2C_Read8:
;I2C_program.c,32 :: 		SET_BIT(SSPCON2, 5);
	BSF        145, 5
;I2C_program.c,33 :: 		}
L_I2C_Read9:
;I2C_program.c,34 :: 		SET_BIT(SSPCON2, 4);
	BSF        145, 4
;I2C_program.c,35 :: 		while(GET_BIT(SSPCON2, 4) == 1);
L_I2C_Read10:
	MOVF       145, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVLW      1
	ANDWF      R0+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_I2C_Read11
	GOTO       L_I2C_Read10
L_I2C_Read11:
;I2C_program.c,37 :: 		return received_data;
	MOVF       R2+0, 0
	MOVWF      R0+0
;I2C_program.c,38 :: 		}
L_end_I2C_Read:
	RETURN
; end of _I2C_Read
