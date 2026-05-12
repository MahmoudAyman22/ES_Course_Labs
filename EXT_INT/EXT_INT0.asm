
_EXT_INT0_Init:

;EXT_INT0.c,9 :: 		void EXT_INT0_Init(void) {
;EXT_INT0.c,10 :: 		SET_BIT(TRISB, 0);
	BSF        134, 0
;EXT_INT0.c,15 :: 		CLR_BIT(OPTION_REG, 6);
	MOVLW      191
	ANDWF      129, 1
;EXT_INT0.c,18 :: 		CLR_BIT(INTCON, 1);
	MOVLW      253
	ANDWF      11, 1
;EXT_INT0.c,19 :: 		}
L_end_EXT_INT0_Init:
	RETURN
; end of _EXT_INT0_Init

_EXT_INT0_Enable:

;EXT_INT0.c,21 :: 		void EXT_INT0_Enable(void) {
;EXT_INT0.c,22 :: 		SET_BIT(INTCON, 4);
	BSF        11, 4
;EXT_INT0.c,23 :: 		SET_BIT(INTCON, 7);
	BSF        11, 7
;EXT_INT0.c,24 :: 		}
L_end_EXT_INT0_Enable:
	RETURN
; end of _EXT_INT0_Enable

_EXT_INT0_Disable:

;EXT_INT0.c,26 :: 		void EXT_INT0_Disable(void) {
;EXT_INT0.c,27 :: 		CLR_BIT(INTCON, 4);
	MOVLW      239
	ANDWF      11, 1
;EXT_INT0.c,28 :: 		}
L_end_EXT_INT0_Disable:
	RETURN
; end of _EXT_INT0_Disable

_EXT_INT0_SetEdge:

;EXT_INT0.c,30 :: 		void EXT_INT0_SetEdge(u8 edge_type) {
;EXT_INT0.c,31 :: 		if (edge_type == EXT_INT0_RISING_EDGE) {
	MOVF       FARG_EXT_INT0_SetEdge_edge_type+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_EXT_INT0_SetEdge0
;EXT_INT0.c,32 :: 		SET_BIT(OPTION_REG, 6);
	BSF        129, 6
;EXT_INT0.c,33 :: 		}
	GOTO       L_EXT_INT0_SetEdge1
L_EXT_INT0_SetEdge0:
;EXT_INT0.c,34 :: 		else if (edge_type == EXT_INT0_FALLING_EDGE) {
	MOVF       FARG_EXT_INT0_SetEdge_edge_type+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_EXT_INT0_SetEdge2
;EXT_INT0.c,35 :: 		CLR_BIT(OPTION_REG, 6);
	MOVLW      191
	ANDWF      129, 1
;EXT_INT0.c,36 :: 		}
L_EXT_INT0_SetEdge2:
L_EXT_INT0_SetEdge1:
;EXT_INT0.c,37 :: 		}
L_end_EXT_INT0_SetEdge:
	RETURN
; end of _EXT_INT0_SetEdge

_EXT_INT0_SetCallback:

;EXT_INT0.c,39 :: 		void EXT_INT0_SetCallback(void (*ptr)(void)) {
;EXT_INT0.c,40 :: 		if (ptr != NULL_PTR) {
	MOVF       FARG_EXT_INT0_SetCallback_ptr+0, 0
	MOVWF      R1+0
	MOVF       FARG_EXT_INT0_SetCallback_ptr+1, 0
	MOVWF      R1+1
	MOVF       FARG_EXT_INT0_SetCallback_ptr+2, 0
	MOVWF      R1+2
	MOVF       FARG_EXT_INT0_SetCallback_ptr+3, 0
	MOVWF      R1+3
	MOVLW      0
	MOVWF      R0+0
	XORWF      R1+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__EXT_INT0_SetCallback9
	MOVF       R0+0, 0
	XORWF      R1+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__EXT_INT0_SetCallback9
	MOVF       R0+0, 0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__EXT_INT0_SetCallback9
	MOVF       R1+0, 0
	XORLW      0
L__EXT_INT0_SetCallback9:
	BTFSC      STATUS+0, 2
	GOTO       L_EXT_INT0_SetCallback3
;EXT_INT0.c,41 :: 		EXT_INT0_Callback = ptr;
	MOVF       FARG_EXT_INT0_SetCallback_ptr+0, 0
	MOVWF      _EXT_INT0_Callback+0
	MOVF       FARG_EXT_INT0_SetCallback_ptr+1, 0
	MOVWF      _EXT_INT0_Callback+1
	MOVF       FARG_EXT_INT0_SetCallback_ptr+2, 0
	MOVWF      _EXT_INT0_Callback+2
	MOVF       FARG_EXT_INT0_SetCallback_ptr+3, 0
;EXT_INT0.c,42 :: 		}
L_EXT_INT0_SetCallback3:
;EXT_INT0.c,43 :: 		}
L_end_EXT_INT0_SetCallback:
	RETURN
; end of _EXT_INT0_SetCallback
