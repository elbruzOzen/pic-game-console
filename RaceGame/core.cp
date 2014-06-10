#line 1 "C:/Users/elbruz/Google Drive/PIC/PIC_PROJECTS/RaceGame/core.c"
#line 1 "c:/users/elbruz/google drive/pic/pic_projects/racegame/core.h"




extern char c_row;
extern char c_col;


void pntCr();
void clr();
void c_down(char *num);
void c_up(char *num);
void c_right(char *num);
void c_left(char *num);
#line 4 "C:/Users/elbruz/Google Drive/PIC/PIC_PROJECTS/RaceGame/core.c"
char c_row = 1;
char c_col = 1;
const char car[8] = {0,18,31,29,29,31,18,0};


void pntCr(){
 char i;
 Lcd_Cmd(64);
 for (i = 0; i<=7; i++) Lcd_Chr_CP(car[i]);
 Lcd_Cmd(_LCD_RETURN_HOME);
 Lcd_Chr(c_row, c_col, 0);
}
void clr(){
 Lcd_Cmd(_LCD_CLEAR);
}


void c_down(char * num){
 if(*num == 1){
 *num = *num +1;
 pntCr();
 }
}

void c_up(char * num){
 if(*num == 2){
 *num = *num -1;
 pntCr();
 }
}

void c_right(char * num){
 if(*num < 16){
 *num = *num +1;
 pntCr();
 }
}

void c_left(char * num){
 if(*num>1){
 *num = *num -1;
 pntCr();
 }
}
