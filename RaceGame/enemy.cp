#line 1 "C:/Users/elbruz/Google Drive/PIC/PIC_PROJECTS/RaceGame/enemy.c"
#line 1 "c:/users/elbruz/google drive/pic/pic_projects/racegame/enemy.h"



typedef struct Enemy{
 int row;
 int col;
}Enemy;

void pntEn(char pos_row, char pos_char);
#line 4 "C:/Users/elbruz/Google Drive/PIC/PIC_PROJECTS/RaceGame/enemy.c"
const char enImg[] = {5,15,19,19,19,19,15,5};


void pntEn(char pos_row, char pos_char) {
 char i;
 Lcd_Cmd(72);
 for (i = 0; i<=7; i++) Lcd_Chr_CP(enImg[i]);
 Lcd_Cmd(_LCD_RETURN_HOME);
 Lcd_Chr(pos_row, pos_char, 1);
}
