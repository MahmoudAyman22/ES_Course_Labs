
_SPI_InitMaster:

;SPI_program.c,6 :: 		void SPI_InitMaster(void) {
;SPI_program.c,8 :: 		CLR_BIT(TRISC, 5); // SDO -> Output
	MOVLW      223
	ANDWF      135, 1
;SPI_program.c,9 :: 		SET_BIT(TRISC, 4); // SDI -> Input
	BSF        135, 4
;SPI_program.c,10 :: 		CLR_BIT(TRISC, 3); // SCK -> Output
	MOVLW      247
	ANDWF      135, 1
;SPI_program.c,12 :: 		SSPSTAT = 0b00000000;
	CLRF       148
;SPI_program.c,14 :: 		SSPCON = 0b00100000;
	MOVLW      32
	MOVWF      20
;SPI_program.c,15 :: 		}
L_end_SPI_InitMaster:
	RETURN
; end of _SPI_InitMaster

_SPI_InitSlave:

;SPI_program.c,16 :: 		void SPI_InitSlave(void) {
;SPI_program.c,18 :: 		CLR_BIT(TRISC, 5); // SDO -> Output
	MOVLW      223
	ANDWF      135, 1
;SPI_program.c,19 :: 		SET_BIT(TRISC, 4); // SDI -> Input
	BSF        135, 4
;SPI_program.c,20 :: 		SET_BIT(TRISC, 3); // SCK -> Input
	BSF        135, 3
;SPI_program.c,22 :: 		SSPSTAT = 0b00000000;
	CLRF       148
;SPI_program.c,24 :: 		SSPCON = 0b00100101;
	MOVLW      37
	MOVWF      20
;SPI_program.c,25 :: 		}
L_end_SPI_InitSlave:
	RETURN
; end of _SPI_InitSlave

_SPI_Transfer:

;SPI_program.c,26 :: 		u8 SPI_Transfer(u8 Data) {
;SPI_program.c,28 :: 		SSPBUF = Data;
	MOVF       FARG_SPI_Transfer_Data+0, 0
	MOVWF      19
;SPI_program.c,30 :: 		while (GET_BIT(SSPSTAT, 0) == 0);
L_SPI_Transfer0:
	MOVF       148, 0
	MOVWF      R0+0
	MOVLW      1
	ANDWF      R0+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_SPI_Transfer1
	GOTO       L_SPI_Transfer0
L_SPI_Transfer1:
;SPI_program.c,32 :: 		return SSPBUF;
	MOVF       19, 0
	MOVWF      R0+0
;SPI_program.c,33 :: 		}
L_end_SPI_Transfer:
	RETURN
; end of _SPI_Transfer
