#include "enemy.h"

//Enemy shape
const char enImg[] = {5,15,19,19,19,19,15,5};

//Print Enemy(row,col)
void pntEn(char pos_row, char pos_char) {
    char i;
    Lcd_Cmd(72);
    for (i = 0; i<=7; i++) Lcd_Chr_CP(enImg[i]);
    Lcd_Cmd(_LCD_RETURN_HOME);
    Lcd_Chr(pos_row, pos_char, 1);
}