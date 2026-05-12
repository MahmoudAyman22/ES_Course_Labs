#line 1 "C:/Users/Z B O O K/OneDrive/Desktop/Final Project/ES_Course_Labs-main/MCAL/ADC/ADC_program.c"
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
#line 1 "c:/users/z b o o k/onedrive/desktop/final project/es_course_labs-main/mcal/adc/adc_interface.h"
#line 1 "c:/users/z b o o k/onedrive/desktop/final project/es_course_labs-main/services/std_types.h"
#line 10 "c:/users/z b o o k/onedrive/desktop/final project/es_course_labs-main/mcal/adc/adc_interface.h"
void ADC_Init(void);
u16 ADC_ReadChannel(u8 Channel);
#line 1 "c:/users/z b o o k/onedrive/desktop/final project/es_course_labs-main/mcal/adc/adc_private.h"
#line 6 "C:/Users/Z B O O K/OneDrive/Desktop/Final Project/ES_Course_Labs-main/MCAL/ADC/ADC_program.c"
void ADC_Init(void) {
  *((volatile u8*)0x9F)  = 0b10000000;
  *((volatile u8*)0x1F)  = 0b01000001;
}

u16 ADC_ReadChannel(u8 Channel) {
  *((volatile u8*)0x1F)  &= 0b11000111;
  *((volatile u8*)0x1F)  |= (Channel << 3);
  ( ( *((volatile u8*)0x1F) ) |= (1U << (2)) ) ;
 while( ( (( *((volatile u8*)0x1F) ) >> (2)) & 1U )  == 1);
 return (( *((volatile u8*)0x1E)  << 8) |  *((volatile u8*)0x9E) );
}
