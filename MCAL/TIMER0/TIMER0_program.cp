#line 1 "C:/Users/Z B O O K/OneDrive/Desktop/Final Project/ES_Course_Labs-main/MCAL/TIMER0/TIMER0_program.c"
#line 1 "c:/users/z b o o k/onedrive/desktop/final project/es_course_labs-main/services/std_types.h"




typedef signed char s8;
typedef signed short int s16;
typedef signed long int s32;


typedef unsigned char u8;
typedef unsigned short int u16;
typedef unsigned long int u32;


typedef float f32;
typedef double f64;
typedef long double f128;
#line 1 "c:/users/z b o o k/onedrive/desktop/final project/es_course_labs-main/mcal/timer0/timer0_private.h"
#line 1 "c:/users/z b o o k/onedrive/desktop/final project/es_course_labs-main/mcal/timer0/timer0_interface.h"



void TIMER0_voidInit(void);
void TIMER0_voidSetPreload(unsigned char Copy_u8Preload);
void TIMER0_voidEnableInterrupt(void);
void TIMER0_voidSetCallBack(void (*Copy_ptrToFunc)(void));
#line 5 "C:/Users/Z B O O K/OneDrive/Desktop/Final Project/ES_Course_Labs-main/MCAL/TIMER0/TIMER0_program.c"
void (*TIMER0_CallBack)(void) = 0;

void TIMER0_voidInit(void) {

  *((volatile unsigned char*)0x81)  &= 0b11000000;
  *((volatile unsigned char*)0x81)  |= 0b00000010;
}

void TIMER0_voidSetPreload(unsigned char Copy_u8Preload) {
  *((volatile unsigned char*)0x01)  = Copy_u8Preload;
}

void TIMER0_voidEnableInterrupt(void) {

  *((volatile unsigned char*)0x0B)  |= (1 << 5);
}

void TIMER0_voidSetCallBack(void (*Copy_ptrToFunc)(void)) {
 if (Copy_ptrToFunc != 0) {
 TIMER0_CallBack = Copy_ptrToFunc;
 }
}
