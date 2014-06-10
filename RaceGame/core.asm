
_pntCr:

;core.c,9 :: 		void pntCr(){
;core.c,11 :: 		Lcd_Cmd(64);
	MOVLW      64
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;core.c,12 :: 		for (i = 0; i<=7; i++) Lcd_Chr_CP(car[i]);
	CLRF       pntCr_i_L0+0
L_pntCr0:
	MOVF       pntCr_i_L0+0, 0
	SUBLW      7
	BTFSS      STATUS+0, 0
	GOTO       L_pntCr1
	MOVF       pntCr_i_L0+0, 0
	ADDLW      _car+0
	MOVWF      R0+0
	MOVLW      hi_addr(_car+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
	INCF       pntCr_i_L0+0, 1
	GOTO       L_pntCr0
L_pntCr1:
;core.c,13 :: 		Lcd_Cmd(_LCD_RETURN_HOME);
	MOVLW      2
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;core.c,14 :: 		Lcd_Chr(c_row, c_col, 0);
	MOVF       _c_row+0, 0
	MOVWF      FARG_Lcd_Chr_row+0
	MOVF       _c_col+0, 0
	MOVWF      FARG_Lcd_Chr_column+0
	CLRF       FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;core.c,15 :: 		}
L_end_pntCr:
	RETURN
; end of _pntCr

_clr:

;core.c,16 :: 		void clr(){
;core.c,17 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;core.c,18 :: 		}
L_end_clr:
	RETURN
; end of _clr

_c_down:

;core.c,21 :: 		void c_down(char * num){
;core.c,22 :: 		if(*num == 1){
	MOVF       FARG_c_down_num+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_c_down3
;core.c,23 :: 		*num = *num +1;
	MOVF       FARG_c_down_num+0, 0
	MOVWF      FSR
	INCF       INDF+0, 0
	MOVWF      R0+0
	MOVF       FARG_c_down_num+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;core.c,24 :: 		pntCr();
	CALL       _pntCr+0
;core.c,25 :: 		}
L_c_down3:
;core.c,26 :: 		}
L_end_c_down:
	RETURN
; end of _c_down

_c_up:

;core.c,28 :: 		void c_up(char * num){
;core.c,29 :: 		if(*num == 2){
	MOVF       FARG_c_up_num+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_c_up4
;core.c,30 :: 		*num = *num -1;
	MOVF       FARG_c_up_num+0, 0
	MOVWF      FSR
	DECF       INDF+0, 0
	MOVWF      R0+0
	MOVF       FARG_c_up_num+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;core.c,31 :: 		pntCr();
	CALL       _pntCr+0
;core.c,32 :: 		}
L_c_up4:
;core.c,33 :: 		}
L_end_c_up:
	RETURN
; end of _c_up

_c_right:

;core.c,35 :: 		void c_right(char * num){
;core.c,36 :: 		if(*num < 16){
	MOVF       FARG_c_right_num+0, 0
	MOVWF      FSR
	MOVLW      16
	SUBWF      INDF+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_c_right5
;core.c,37 :: 		*num = *num +1;
	MOVF       FARG_c_right_num+0, 0
	MOVWF      FSR
	INCF       INDF+0, 0
	MOVWF      R0+0
	MOVF       FARG_c_right_num+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;core.c,38 :: 		pntCr();
	CALL       _pntCr+0
;core.c,39 :: 		}
L_c_right5:
;core.c,40 :: 		}
L_end_c_right:
	RETURN
; end of _c_right

_c_left:

;core.c,42 :: 		void c_left(char * num){
;core.c,43 :: 		if(*num>1){
	MOVF       FARG_c_left_num+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	SUBLW      1
	BTFSC      STATUS+0, 0
	GOTO       L_c_left6
;core.c,44 :: 		*num = *num -1;
	MOVF       FARG_c_left_num+0, 0
	MOVWF      FSR
	DECF       INDF+0, 0
	MOVWF      R0+0
	MOVF       FARG_c_left_num+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;core.c,45 :: 		pntCr();
	CALL       _pntCr+0
;core.c,46 :: 		}
L_c_left6:
;core.c,47 :: 		}
L_end_c_left:
	RETURN
; end of _c_left
