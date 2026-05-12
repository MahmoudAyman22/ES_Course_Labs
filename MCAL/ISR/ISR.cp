#line 1 "C:/Users/Z B O O K/OneDrive/Desktop/Final Project/ES_Course_Labs-main/MCAL/ISR/ISR.c"
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
#line 1 "c:/users/z b o o k/onedrive/desktop/final project/es_course_labs-main/services/bit_math.h"
#line 8 "C:/Users/Z B O O K/OneDrive/Desktop/Final Project/ES_Course_Labs-main/MCAL/ISR/ISR.c"
extern void (*EXT_INT0_Callback)(void);
extern void (*TIMER0_CallBack)(void);

void interrupt(void) {

 if ( ( (( *((volatile u8*)0x0B) ) >> (1)) & 1U )  == 1) {

  ( ( *((volatile u8*)0x0B) ) &= ~(1U << (1)) ) ;

 if (EXT_INT0_Callback !=  ((void*)0) ) {
 EXT_INT0_Callback();
 }
 }

 if ( ( (( *((volatile u8*)0x0B) ) >> (2)) & 1U )  == 1) {
  ( ( *((volatile u8*)0x0B) ) &= ~(1U << (2)) ) ;

  *((volatile u8*)0x01)  = 6;

 if (TIMER0_CallBack !=  ((void*)0) ) {
 TIMER0_CallBack();
 }
 }
}
