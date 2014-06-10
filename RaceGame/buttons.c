 #include "buttons.h"
 
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
