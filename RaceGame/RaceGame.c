#include "core.h"
#include "enemy.h"
#include "pins.h"

#define MAX_EN 10

Enemy enemies[MAX_EN];

//iterator of enemies array
unsigned char valid;
//Used for keep period
unsigned char counter;

char *beginTxt = "GET READY";
char *endTxt = "GAME OVER";

int i;//Loop variable

void main() {

  //************************* Hardware Setup ***************************

  ANSEL  = 0;                        // Configure AN pins as digital I/O
  ANSELH = 0;
  C1ON_bit = 0;                      // Disable comparators
  C2ON_bit = 0;
  
  TRISC = 0b11110000;                //4,5,6,7 are input

  //Init LED
  Lcd_Init();
  Lcd_Cmd(_LCD_CLEAR);
  Lcd_Cmd(_LCD_CURSOR_OFF);

  //**************************** Init Game *****************************
  start:
  
  c_row = 1;
  c_col = 1;
  valid = 0;
  counter = 0;
  
  for( i = 0 ; i < MAX_EN ; i++){
        enemies[i].col = 0;
        enemies[i].row = 0;
  }
  
  Lcd_Cmd(_LCD_CLEAR);
  Lcd_Out(1,4,beginTxt);
  Delay_ms(1000);

  //********************** Main Loop *****************************
  while(1){

       //For each 500 ms
       if( counter%10 == 0 ){
       
           //For each 1000 ms
           if(counter == 20){
           
               //Reset Counter
               counter = 0;
               enemies[valid].col = 17;
               //Random row for newborn enemy
               enemies[valid].row = rand()%2+1;
               valid++;

               //Return the beginning of array
               if(valid == MAX_EN-1)
                   valid = 0;
           }

           //Move enemies
           for( i = 0 ; i < MAX_EN ; i++)
                enemies[i].col =  enemies[i].col - 1;

           //Collision detect
           for(i = 0 ; i < MAX_EN ; i++){
           
                 //If collision is detected
                 if(enemies[i].row == c_row && enemies[i].col == c_col){

                      clr();
                      Lcd_Out(2,4,endTxt);
                      Delay_ms(2000);
                      //Start the game again
                      goto start;
                 
                 }
           
           }

           //Refresh screen
           clr();
           pntCr();
           
           for( i = 0 ; i < MAX_EN ; i++)
                pntEn(enemies[i].row,enemies[i].col);

        }

      //**************** Check Input ************************
      
      //Up detected
      if(RC5_bit == 1 ){
          
          Delay_ms(5);
          
          if(RC5_bit == 1){
              
              clr();
              c_up(&c_row);
              for( i = 0 ; i < MAX_EN ; i++)
                   pntEn(enemies[i].row,enemies[i].col);
          
          }

      }

      //Down detected
      if(RC4_bit == 1 ){
          
          Delay_ms(5);
          
          if(RC4_bit == 1) {
              
              clr();
              c_down(&c_row);
              for( i = 0 ; i < MAX_EN ; i++)
                   pntEn(enemies[i].row,enemies[i].col);
          }
      }
      
      //Left detected
      if(RC6_bit == 1 ){
          
          Delay_ms(5);
          
          if(RC6_bit == 1) {
              
              clr();
              
              c_left(&c_col);
              for( i = 0 ; i < MAX_EN ; i++)
                   pntEn(enemies[i].row,enemies[i].col);
          
          }
      }
      
      //Right Detected
      if(RC7_bit == 1 ){
          
          Delay_ms(5);
          
          if(RC7_bit == 1) {
             
             clr();
             
             c_right(&c_col);
             for( i = 0 ; i < MAX_EN ; i++)
                  pntEn(enemies[i].row,enemies[i].col);
          
          }
      }
      
      counter++;
      Delay_ms(30);
  
  }
  
}