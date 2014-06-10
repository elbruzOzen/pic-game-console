
_pntEn:

;enemy.c,7 :: 		void pntEn(char pos_row, char pos_char) {
;enemy.c,9 :: 		Lcd_Cmd(72);
	MOVLW      72
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;enemy.c,10 :: 		for (i = 0; i<=7; i++) Lcd_Chr_CP(enImg[i]);
	CLRF       pntEn_i_L0+0
L_pntEn0:
	MOVF       pntEn_i_L0+0, 0
	SUBLW      7
	BTFSS      STATUS+0, 0
	GOTO       L_pntEn1
	MOVF       pntEn_i_L0+0, 0
	ADDLW      _enImg+0
	MOVWF      R0+0
	MOVLW      hi_addr(_enImg+0)
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
	INCF       pntEn_i_L0+0, 1
	GOTO       L_pntEn0
L_pntEn1:
;enemy.c,11 :: 		Lcd_Cmd(_LCD_RETURN_HOME);
	MOVLW      2
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;enemy.c,12 :: 		Lcd_Chr(pos_row, pos_char, 1);
	MOVF       FARG_pntEn_pos_row+0, 0
	MOVWF      FARG_Lcd_Chr_row+0
	MOVF       FARG_pntEn_pos_char+0, 0
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;enemy.c,13 :: 		}
L_end_pntEn:
	RETURN
; end of _pntEn
