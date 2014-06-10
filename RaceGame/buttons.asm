
_isPressed:

;buttons.c,3 :: 		char isPressed( int pin ){
;buttons.c,4 :: 		if( pin == 1 ){
	MOVLW      0
	XORWF      FARG_isPressed_pin+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__isPressed5
	MOVLW      1
	XORWF      FARG_isPressed_pin+0, 0
L__isPressed5:
	BTFSS      STATUS+0, 2
	GOTO       L_isPressed0
;buttons.c,5 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_isPressed1:
	DECFSZ     R13+0, 1
	GOTO       L_isPressed1
	DECFSZ     R12+0, 1
	GOTO       L_isPressed1
	NOP
;buttons.c,6 :: 		if(pin == 1)
	MOVLW      0
	XORWF      FARG_isPressed_pin+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__isPressed6
	MOVLW      1
	XORWF      FARG_isPressed_pin+0, 0
L__isPressed6:
	BTFSS      STATUS+0, 2
	GOTO       L_isPressed2
;buttons.c,7 :: 		return 1;
	MOVLW      1
	MOVWF      R0+0
	GOTO       L_end_isPressed
L_isPressed2:
;buttons.c,9 :: 		return 0;
	CLRF       R0+0
	GOTO       L_end_isPressed
;buttons.c,10 :: 		}
L_isPressed0:
;buttons.c,11 :: 		return 0;
	CLRF       R0+0
;buttons.c,12 :: 		}
L_end_isPressed:
	RETURN
; end of _isPressed
