#line 1 "C:/Users/elbruz/Google Drive/PIC/PIC_PROJECTS/RaceGame/buttons.c"
#line 1 "c:/users/elbruz/google drive/pic/pic_projects/racegame/buttons.h"



 char isPressed(int pin);
#line 3 "C:/Users/elbruz/Google Drive/PIC/PIC_PROJECTS/RaceGame/buttons.c"
 char isPressed( int pin ){
 if( pin == 1 ){
 Delay_ms(10);
 if(pin == 1)
 return 1;
 else
 return 0;
 }
 return 0;
 }
