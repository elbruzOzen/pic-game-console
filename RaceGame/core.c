#include "core.h"

//Init pos. and shape
char c_row = 1;
char c_col = 1;
const char car[8] = {0,18,31,29,29,31,18,0};

//Print car
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

//Down and refresh screen
void c_down(char * num){
    if(*num == 1){
       *num = *num +1;
       pntCr();
    }
}
//Up and refresh screen
void c_up(char * num){
    if(*num == 2){
       *num = *num -1;
       pntCr();
    }
}
//Right and refresh screen
void c_right(char * num){
    if(*num < 16){
       *num = *num +1;
       pntCr();
    }
}
//Left and refresh screen
void c_left(char * num){
    if(*num>1){
       *num = *num -1;
       pntCr();
    }
}