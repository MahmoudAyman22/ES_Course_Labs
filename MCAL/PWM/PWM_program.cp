#line 1 "C:/Users/Z B O O K/OneDrive/Desktop/Final Project/ES_Course_Labs-main/MCAL/PWM/PWM_program.c"
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
#line 1 "c:/users/z b o o k/onedrive/desktop/final project/es_course_labs-main/mcal/pwm/pwm_interface.h"
#line 1 "c:/users/z b o o k/onedrive/desktop/final project/es_course_labs-main/services/std_types.h"
#line 6 "c:/users/z b o o k/onedrive/desktop/final project/es_course_labs-main/mcal/pwm/pwm_interface.h"
void PWM_Init(void);
void PWM_SetDutyCycle(u8 DutyCycle_Percent);
#line 1 "c:/users/z b o o k/onedrive/desktop/final project/es_course_labs-main/mcal/pwm/pwm_private.h"
#line 6 "C:/Users/Z B O O K/OneDrive/Desktop/Final Project/ES_Course_Labs-main/MCAL/PWM/PWM_program.c"
void PWM_Init(void) {

  *((volatile u8*)0x92)  = 255;
  *((volatile u8*)0x17)  = 0b00001100;
  *((volatile u8*)0x12)  = 0b00000110;
}

void PWM_SetDutyCycle(u8 DutyCycle_Percent) {
 u16 Total_Value;
 if(DutyCycle_Percent > 100) {
 DutyCycle_Percent = 100;
 }

 Total_Value = ((u16)( *((volatile u8*)0x92)  + 1) * 4 * DutyCycle_Percent) / 100;
  *((volatile u8*)0x15)  = (u8)(Total_Value >> 2);
  *((volatile u8*)0x17)  &= 0b11001111;
  *((volatile u8*)0x17)  |= ((Total_Value & 0x03) << 4);
}
