
_main:

;RaceGame.c,19 :: 		void main() {
;RaceGame.c,23 :: 		ANSEL  = 0;                        // Configure AN pins as digital I/O
	CLRF       ANSEL+0
;RaceGame.c,24 :: 		ANSELH = 0;
	CLRF       ANSELH+0
;RaceGame.c,25 :: 		C1ON_bit = 0;                      // Disable comparators
	BCF        C1ON_bit+0, BitPos(C1ON_bit+0)
;RaceGame.c,26 :: 		C2ON_bit = 0;
	BCF        C2ON_bit+0, BitPos(C2ON_bit+0)
;RaceGame.c,28 :: 		TRISC = 0b11110000;                //4,5,6,7 are input
	MOVLW      240
	MOVWF      TRISC+0
;RaceGame.c,31 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;RaceGame.c,32 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;RaceGame.c,33 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;RaceGame.c,36 :: 		start:
___main_start:
;RaceGame.c,38 :: 		c_row = 1;
	MOVLW      1
	MOVWF      _c_row+0
;RaceGame.c,39 :: 		c_col = 1;
	MOVLW      1
	MOVWF      _c_col+0
;RaceGame.c,40 :: 		valid = 0;
	CLRF       _valid+0
;RaceGame.c,41 :: 		counter = 0;
	CLRF       _counter+0
;RaceGame.c,43 :: 		for( i = 0 ; i < MAX_EN ; i++){
	CLRF       _i+0
	CLRF       _i+1
L_main0:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main49
	MOVLW      10
	SUBWF      _i+0, 0
L__main49:
	BTFSC      STATUS+0, 0
	GOTO       L_main1
;RaceGame.c,44 :: 		enemies[i].col = 0;
	MOVF       _i+0, 0
	MOVWF      R0+0
	MOVF       _i+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVLW      _enemies+0
	ADDWF      R0+0, 1
	MOVLW      2
	ADDWF      R0+0, 0
	MOVWF      FSR
	CLRF       INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
;RaceGame.c,45 :: 		enemies[i].row = 0;
	MOVF       _i+0, 0
	MOVWF      R0+0
	MOVF       _i+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _enemies+0
	MOVWF      FSR
	CLRF       INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
;RaceGame.c,43 :: 		for( i = 0 ; i < MAX_EN ; i++){
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;RaceGame.c,46 :: 		}
	GOTO       L_main0
L_main1:
;RaceGame.c,48 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;RaceGame.c,49 :: 		Lcd_Out(1,4,beginTxt);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _beginTxt+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;RaceGame.c,50 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
	NOP
;RaceGame.c,53 :: 		while(1){
L_main4:
;RaceGame.c,56 :: 		if( counter%10 == 0 ){
	MOVLW      10
	MOVWF      R4+0
	MOVF       _counter+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main6
;RaceGame.c,59 :: 		if(counter == 20){
	MOVF       _counter+0, 0
	XORLW      20
	BTFSS      STATUS+0, 2
	GOTO       L_main7
;RaceGame.c,62 :: 		counter = 0;
	CLRF       _counter+0
;RaceGame.c,63 :: 		enemies[valid].col = 17;
	MOVF       _valid+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVLW      _enemies+0
	ADDWF      R0+0, 1
	MOVLW      2
	ADDWF      R0+0, 0
	MOVWF      FSR
	MOVLW      17
	MOVWF      INDF+0
	MOVLW      0
	INCF       FSR, 1
	MOVWF      INDF+0
;RaceGame.c,65 :: 		enemies[valid].row = rand()%2+1;
	MOVF       _valid+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVLW      _enemies+0
	ADDWF      R0+0, 1
	MOVF       R0+0, 0
	MOVWF      FLOC__main+0
	CALL       _rand+0
	MOVLW      2
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	INCF       R0+0, 1
	BTFSC      STATUS+0, 2
	INCF       R0+1, 1
	MOVF       FLOC__main+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	MOVF       R0+1, 0
	INCF       FSR, 1
	MOVWF      INDF+0
;RaceGame.c,66 :: 		valid++;
	INCF       _valid+0, 1
;RaceGame.c,69 :: 		if(valid == MAX_EN-1)
	MOVF       _valid+0, 0
	XORLW      9
	BTFSS      STATUS+0, 2
	GOTO       L_main8
;RaceGame.c,70 :: 		valid = 0;
	CLRF       _valid+0
L_main8:
;RaceGame.c,71 :: 		}
L_main7:
;RaceGame.c,74 :: 		for( i = 0 ; i < MAX_EN ; i++)
	CLRF       _i+0
	CLRF       _i+1
L_main9:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main50
	MOVLW      10
	SUBWF      _i+0, 0
L__main50:
	BTFSC      STATUS+0, 0
	GOTO       L_main10
;RaceGame.c,75 :: 		enemies[i].col =  enemies[i].col - 1;
	MOVF       _i+0, 0
	MOVWF      R0+0
	MOVF       _i+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVLW      _enemies+0
	ADDWF      R0+0, 1
	MOVLW      2
	ADDWF      R0+0, 0
	MOVWF      R2+0
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVLW      1
	SUBWF      INDF+0, 0
	MOVWF      R0+0
	MOVLW      0
	BTFSS      STATUS+0, 0
	ADDLW      1
	INCF       FSR, 1
	SUBWF      INDF+0, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	MOVF       R0+1, 0
	INCF       FSR, 1
	MOVWF      INDF+0
;RaceGame.c,74 :: 		for( i = 0 ; i < MAX_EN ; i++)
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;RaceGame.c,75 :: 		enemies[i].col =  enemies[i].col - 1;
	GOTO       L_main9
L_main10:
;RaceGame.c,78 :: 		for(i = 0 ; i < MAX_EN ; i++){
	CLRF       _i+0
	CLRF       _i+1
L_main12:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main51
	MOVLW      10
	SUBWF      _i+0, 0
L__main51:
	BTFSC      STATUS+0, 0
	GOTO       L_main13
;RaceGame.c,81 :: 		if(enemies[i].row == c_row && enemies[i].col == c_col){
	MOVF       _i+0, 0
	MOVWF      R0+0
	MOVF       _i+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _enemies+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R1+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R1+1
	MOVLW      0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main52
	MOVF       _c_row+0, 0
	XORWF      R1+0, 0
L__main52:
	BTFSS      STATUS+0, 2
	GOTO       L_main17
	MOVF       _i+0, 0
	MOVWF      R0+0
	MOVF       _i+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVLW      _enemies+0
	ADDWF      R0+0, 1
	MOVLW      2
	ADDWF      R0+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R1+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R1+1
	MOVLW      0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main53
	MOVF       _c_col+0, 0
	XORWF      R1+0, 0
L__main53:
	BTFSS      STATUS+0, 2
	GOTO       L_main17
L__main47:
;RaceGame.c,83 :: 		clr();
	CALL       _clr+0
;RaceGame.c,84 :: 		Lcd_Out(2,4,endTxt);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _endTxt+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;RaceGame.c,85 :: 		Delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main18:
	DECFSZ     R13+0, 1
	GOTO       L_main18
	DECFSZ     R12+0, 1
	GOTO       L_main18
	DECFSZ     R11+0, 1
	GOTO       L_main18
	NOP
;RaceGame.c,87 :: 		goto start;
	GOTO       ___main_start
;RaceGame.c,89 :: 		}
L_main17:
;RaceGame.c,78 :: 		for(i = 0 ; i < MAX_EN ; i++){
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;RaceGame.c,91 :: 		}
	GOTO       L_main12
L_main13:
;RaceGame.c,94 :: 		clr();
	CALL       _clr+0
;RaceGame.c,95 :: 		pntCr();
	CALL       _pntCr+0
;RaceGame.c,97 :: 		for( i = 0 ; i < MAX_EN ; i++)
	CLRF       _i+0
	CLRF       _i+1
L_main19:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main54
	MOVLW      10
	SUBWF      _i+0, 0
L__main54:
	BTFSC      STATUS+0, 0
	GOTO       L_main20
;RaceGame.c,98 :: 		pntEn(enemies[i].row,enemies[i].col);
	MOVF       _i+0, 0
	MOVWF      R0+0
	MOVF       _i+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVLW      _enemies+0
	ADDWF      R0+0, 1
	MOVF       R0+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_pntEn_pos_row+0
	MOVLW      2
	ADDWF      R0+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_pntEn_pos_char+0
	CALL       _pntEn+0
;RaceGame.c,97 :: 		for( i = 0 ; i < MAX_EN ; i++)
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;RaceGame.c,98 :: 		pntEn(enemies[i].row,enemies[i].col);
	GOTO       L_main19
L_main20:
;RaceGame.c,100 :: 		}
L_main6:
;RaceGame.c,105 :: 		if(RC5_bit == 1 ){
	BTFSS      RC5_bit+0, BitPos(RC5_bit+0)
	GOTO       L_main22
;RaceGame.c,107 :: 		Delay_ms(5);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_main23:
	DECFSZ     R13+0, 1
	GOTO       L_main23
	DECFSZ     R12+0, 1
	GOTO       L_main23
	NOP
	NOP
;RaceGame.c,109 :: 		if(RC5_bit == 1){
	BTFSS      RC5_bit+0, BitPos(RC5_bit+0)
	GOTO       L_main24
;RaceGame.c,111 :: 		clr();
	CALL       _clr+0
;RaceGame.c,112 :: 		c_up(&c_row);
	MOVLW      _c_row+0
	MOVWF      FARG_c_up_num+0
	CALL       _c_up+0
;RaceGame.c,113 :: 		for( i = 0 ; i < MAX_EN ; i++)
	CLRF       _i+0
	CLRF       _i+1
L_main25:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main55
	MOVLW      10
	SUBWF      _i+0, 0
L__main55:
	BTFSC      STATUS+0, 0
	GOTO       L_main26
;RaceGame.c,114 :: 		pntEn(enemies[i].row,enemies[i].col);
	MOVF       _i+0, 0
	MOVWF      R0+0
	MOVF       _i+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVLW      _enemies+0
	ADDWF      R0+0, 1
	MOVF       R0+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_pntEn_pos_row+0
	MOVLW      2
	ADDWF      R0+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_pntEn_pos_char+0
	CALL       _pntEn+0
;RaceGame.c,113 :: 		for( i = 0 ; i < MAX_EN ; i++)
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;RaceGame.c,114 :: 		pntEn(enemies[i].row,enemies[i].col);
	GOTO       L_main25
L_main26:
;RaceGame.c,116 :: 		}
L_main24:
;RaceGame.c,118 :: 		}
L_main22:
;RaceGame.c,121 :: 		if(RC4_bit == 1 ){
	BTFSS      RC4_bit+0, BitPos(RC4_bit+0)
	GOTO       L_main28
;RaceGame.c,123 :: 		Delay_ms(5);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_main29:
	DECFSZ     R13+0, 1
	GOTO       L_main29
	DECFSZ     R12+0, 1
	GOTO       L_main29
	NOP
	NOP
;RaceGame.c,125 :: 		if(RC4_bit == 1) {
	BTFSS      RC4_bit+0, BitPos(RC4_bit+0)
	GOTO       L_main30
;RaceGame.c,127 :: 		clr();
	CALL       _clr+0
;RaceGame.c,128 :: 		c_down(&c_row);
	MOVLW      _c_row+0
	MOVWF      FARG_c_down_num+0
	CALL       _c_down+0
;RaceGame.c,129 :: 		for( i = 0 ; i < MAX_EN ; i++)
	CLRF       _i+0
	CLRF       _i+1
L_main31:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main56
	MOVLW      10
	SUBWF      _i+0, 0
L__main56:
	BTFSC      STATUS+0, 0
	GOTO       L_main32
;RaceGame.c,130 :: 		pntEn(enemies[i].row,enemies[i].col);
	MOVF       _i+0, 0
	MOVWF      R0+0
	MOVF       _i+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVLW      _enemies+0
	ADDWF      R0+0, 1
	MOVF       R0+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_pntEn_pos_row+0
	MOVLW      2
	ADDWF      R0+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_pntEn_pos_char+0
	CALL       _pntEn+0
;RaceGame.c,129 :: 		for( i = 0 ; i < MAX_EN ; i++)
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;RaceGame.c,130 :: 		pntEn(enemies[i].row,enemies[i].col);
	GOTO       L_main31
L_main32:
;RaceGame.c,131 :: 		}
L_main30:
;RaceGame.c,132 :: 		}
L_main28:
;RaceGame.c,135 :: 		if(RC6_bit == 1 ){
	BTFSS      RC6_bit+0, BitPos(RC6_bit+0)
	GOTO       L_main34
;RaceGame.c,137 :: 		Delay_ms(5);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_main35:
	DECFSZ     R13+0, 1
	GOTO       L_main35
	DECFSZ     R12+0, 1
	GOTO       L_main35
	NOP
	NOP
;RaceGame.c,139 :: 		if(RC6_bit == 1) {
	BTFSS      RC6_bit+0, BitPos(RC6_bit+0)
	GOTO       L_main36
;RaceGame.c,141 :: 		clr();
	CALL       _clr+0
;RaceGame.c,143 :: 		c_left(&c_col);
	MOVLW      _c_col+0
	MOVWF      FARG_c_left_num+0
	CALL       _c_left+0
;RaceGame.c,144 :: 		for( i = 0 ; i < MAX_EN ; i++)
	CLRF       _i+0
	CLRF       _i+1
L_main37:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main57
	MOVLW      10
	SUBWF      _i+0, 0
L__main57:
	BTFSC      STATUS+0, 0
	GOTO       L_main38
;RaceGame.c,145 :: 		pntEn(enemies[i].row,enemies[i].col);
	MOVF       _i+0, 0
	MOVWF      R0+0
	MOVF       _i+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVLW      _enemies+0
	ADDWF      R0+0, 1
	MOVF       R0+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_pntEn_pos_row+0
	MOVLW      2
	ADDWF      R0+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_pntEn_pos_char+0
	CALL       _pntEn+0
;RaceGame.c,144 :: 		for( i = 0 ; i < MAX_EN ; i++)
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;RaceGame.c,145 :: 		pntEn(enemies[i].row,enemies[i].col);
	GOTO       L_main37
L_main38:
;RaceGame.c,147 :: 		}
L_main36:
;RaceGame.c,148 :: 		}
L_main34:
;RaceGame.c,151 :: 		if(RC7_bit == 1 ){
	BTFSS      RC7_bit+0, BitPos(RC7_bit+0)
	GOTO       L_main40
;RaceGame.c,153 :: 		Delay_ms(5);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_main41:
	DECFSZ     R13+0, 1
	GOTO       L_main41
	DECFSZ     R12+0, 1
	GOTO       L_main41
	NOP
	NOP
;RaceGame.c,155 :: 		if(RC7_bit == 1) {
	BTFSS      RC7_bit+0, BitPos(RC7_bit+0)
	GOTO       L_main42
;RaceGame.c,157 :: 		clr();
	CALL       _clr+0
;RaceGame.c,159 :: 		c_right(&c_col);
	MOVLW      _c_col+0
	MOVWF      FARG_c_right_num+0
	CALL       _c_right+0
;RaceGame.c,160 :: 		for( i = 0 ; i < MAX_EN ; i++)
	CLRF       _i+0
	CLRF       _i+1
L_main43:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main58
	MOVLW      10
	SUBWF      _i+0, 0
L__main58:
	BTFSC      STATUS+0, 0
	GOTO       L_main44
;RaceGame.c,161 :: 		pntEn(enemies[i].row,enemies[i].col);
	MOVF       _i+0, 0
	MOVWF      R0+0
	MOVF       _i+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVLW      _enemies+0
	ADDWF      R0+0, 1
	MOVF       R0+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_pntEn_pos_row+0
	MOVLW      2
	ADDWF      R0+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_pntEn_pos_char+0
	CALL       _pntEn+0
;RaceGame.c,160 :: 		for( i = 0 ; i < MAX_EN ; i++)
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;RaceGame.c,161 :: 		pntEn(enemies[i].row,enemies[i].col);
	GOTO       L_main43
L_main44:
;RaceGame.c,163 :: 		}
L_main42:
;RaceGame.c,164 :: 		}
L_main40:
;RaceGame.c,166 :: 		counter++;
	INCF       _counter+0, 1
;RaceGame.c,167 :: 		Delay_ms(30);
	MOVLW      78
	MOVWF      R12+0
	MOVLW      235
	MOVWF      R13+0
L_main46:
	DECFSZ     R13+0, 1
	GOTO       L_main46
	DECFSZ     R12+0, 1
	GOTO       L_main46
;RaceGame.c,169 :: 		}
	GOTO       L_main4
;RaceGame.c,171 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
