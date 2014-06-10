#line 1 "C:/Users/elbruz/Google Drive/PIC/PIC_PROJECTS/RaceGame/RaceGame.c"
#line 1 "c:/users/elbruz/google drive/pic/pic_projects/racegame/core.h"




extern char c_row;
extern char c_col;


void pntCr();
void clr();
void c_down(char *num);
void c_up(char *num);
void c_right(char *num);
void c_left(char *num);
#line 1 "c:/users/elbruz/google drive/pic/pic_projects/racegame/enemy.h"



typedef struct Enemy{
 int row;
 int col;
}Enemy;

void pntEn(char pos_row, char pos_char);
#line 1 "c:/users/elbruz/google drive/pic/pic_projects/racegame/pins.h"




sbit LCD_RS at RB4_bit;
sbit LCD_EN at RB5_bit;
sbit LCD_D4 at RB0_bit;
sbit LCD_D5 at RB1_bit;
sbit LCD_D6 at RB2_bit;
sbit LCD_D7 at RB3_bit;

sbit LCD_RS_Direction at TRISB4_bit;
sbit LCD_EN_Direction at TRISB5_bit;
sbit LCD_D4_Direction at TRISB0_bit;
sbit LCD_D5_Direction at TRISB1_bit;
sbit LCD_D6_Direction at TRISB2_bit;
sbit LCD_D7_Direction at TRISB3_bit;
#line 7 "C:/Users/elbruz/Google Drive/PIC/PIC_PROJECTS/RaceGame/RaceGame.c"
Enemy enemies[ 10 ];


unsigned char valid;

unsigned char counter;

char *beginTxt = "GET READY";
char *endTxt = "GAME OVER";

int i;

void main() {



 ANSEL = 0;
 ANSELH = 0;
 C1ON_bit = 0;
 C2ON_bit = 0;

 TRISC = 0b11110000;


 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);


 start:

 c_row = 1;
 c_col = 1;
 valid = 0;
 counter = 0;

 for( i = 0 ; i <  10  ; i++){
 enemies[i].col = 0;
 enemies[i].row = 0;
 }

 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1,4,beginTxt);
 Delay_ms(1000);


 while(1){


 if( counter%10 == 0 ){


 if(counter == 20){


 counter = 0;
 enemies[valid].col = 17;

 enemies[valid].row = rand()%2+1;
 valid++;


 if(valid ==  10 -1)
 valid = 0;
 }


 for( i = 0 ; i <  10  ; i++)
 enemies[i].col = enemies[i].col - 1;


 for(i = 0 ; i <  10  ; i++){


 if(enemies[i].row == c_row && enemies[i].col == c_col){

 clr();
 Lcd_Out(2,4,endTxt);
 Delay_ms(2000);

 goto start;

 }

 }


 clr();
 pntCr();

 for( i = 0 ; i <  10  ; i++)
 pntEn(enemies[i].row,enemies[i].col);

 }




 if(RC5_bit == 1 ){

 Delay_ms(5);

 if(RC5_bit == 1){

 clr();
 c_up(&c_row);
 for( i = 0 ; i <  10  ; i++)
 pntEn(enemies[i].row,enemies[i].col);

 }

 }


 if(RC4_bit == 1 ){

 Delay_ms(5);

 if(RC4_bit == 1) {

 clr();
 c_down(&c_row);
 for( i = 0 ; i <  10  ; i++)
 pntEn(enemies[i].row,enemies[i].col);
 }
 }


 if(RC6_bit == 1 ){

 Delay_ms(5);

 if(RC6_bit == 1) {

 clr();

 c_left(&c_col);
 for( i = 0 ; i <  10  ; i++)
 pntEn(enemies[i].row,enemies[i].col);

 }
 }


 if(RC7_bit == 1 ){

 Delay_ms(5);

 if(RC7_bit == 1) {

 clr();

 c_right(&c_col);
 for( i = 0 ; i <  10  ; i++)
 pntEn(enemies[i].row,enemies[i].col);

 }
 }

 counter++;
 Delay_ms(30);

 }

}
