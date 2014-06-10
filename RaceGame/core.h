#ifndef _CORE_H_
#define _CORE_H_

//car row and col
extern char c_row;
extern char c_col;

//method protypes
void pntCr();
void clr();                     //quick clear screen
void c_down(char *num);
void c_up(char *num);
void c_right(char *num);
void c_left(char *num);

#endif /* _CORE_H_*/