#line 1 "C:/Users/Z B O O K/OneDrive/Desktop/Final Project/ES_Course_Labs-main/APP/adc_test.c"
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
#line 1 "c:/users/z b o o k/onedrive/desktop/final project/es_course_labs-main/mcal/adc/adc_interface.h"
#line 1 "c:/users/z b o o k/onedrive/desktop/final project/es_course_labs-main/services/std_types.h"
#line 10 "c:/users/z b o o k/onedrive/desktop/final project/es_course_labs-main/mcal/adc/adc_interface.h"
void ADC_Init(void);
u16 ADC_ReadChannel(u8 Channel);
#line 1 "c:/users/z b o o k/onedrive/desktop/final project/es_course_labs-main/mcal/gpio/gpio_interface.h"
#line 1 "c:/users/z b o o k/onedrive/desktop/final project/es_course_labs-main/services/std_types.h"
#line 31 "c:/users/z b o o k/onedrive/desktop/final project/es_course_labs-main/mcal/gpio/gpio_interface.h"
void GPIO_SetPinDirection(u8 Port, u8 Pin, u8 Direction);
void GPIO_SetPinValue(u8 Port, u8 Pin, u8 Value);
u8 GPIO_GetPinValue(u8 Port, u8 Pin);
void GPIO_Init(void);
#line 5 "C:/Users/Z B O O K/OneDrive/Desktop/Final Project/ES_Course_Labs-main/APP/adc_test.c"
void ADC_Test(void) {
 u16 Digital_Value = 0;
 u16 Temperature = 0;
 GPIO_SetPinDirection( 0 ,  0 ,  1 );
 ADC_Init();
 while(1) {
 Digital_Value = ADC_ReadChannel( 0 );
 Temperature = (Digital_Value * 500) / 1024;

 }
}
