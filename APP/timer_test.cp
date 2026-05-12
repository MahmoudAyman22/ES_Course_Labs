#line 1 "C:/Users/Z B O O K/OneDrive/Desktop/Final Project/ES_Course_Labs-main/APP/timer_test.c"
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
#line 1 "c:/users/z b o o k/onedrive/desktop/final project/es_course_labs-main/mcal/timer0/timer0_interface.h"



void TIMER0_voidInit(void);
void TIMER0_voidSetPreload(unsigned char Copy_u8Preload);
void TIMER0_voidEnableInterrupt(void);
void TIMER0_voidSetCallBack(void (*Copy_ptrToFunc)(void));
#line 1 "c:/users/z b o o k/onedrive/desktop/final project/es_course_labs-main/mcal/gpio/gpio_interface.h"
#line 1 "c:/users/z b o o k/onedrive/desktop/final project/es_course_labs-main/services/std_types.h"
#line 31 "c:/users/z b o o k/onedrive/desktop/final project/es_course_labs-main/mcal/gpio/gpio_interface.h"
void GPIO_SetPinDirection(u8 Port, u8 Pin, u8 Direction);
void GPIO_SetPinValue(u8 Port, u8 Pin, u8 Value);
u8 GPIO_GetPinValue(u8 Port, u8 Pin);
void GPIO_Init(void);
#line 1 "c:/users/z b o o k/onedrive/desktop/final project/es_course_labs-main/mcal/gie/gie_interface.h"



void GIE_voidEnable(void);
void GIE_voidDisable(void);
#line 5 "C:/Users/Z B O O K/OneDrive/Desktop/Final Project/ES_Course_Labs-main/APP/timer_test.c"
volatile u16 Timer_Counter = 0;
void APP_Timer_ISR(void) {
 u8 current;
 Timer_Counter++;
 if(Timer_Counter >= 500) {
 Timer_Counter = 0;
 current = GPIO_GetPinValue( 1 ,  0 );
 if(current ==  1 ) {
 GPIO_SetPinValue( 1 ,  0 ,  0 );
 } else {
 GPIO_SetPinValue( 1 ,  0 ,  1 );
 }
 }
}
void Timer_Test(void) {
 GPIO_SetPinDirection( 1 ,  0 ,  0 );
 TIMER0_voidSetCallBack(APP_Timer_ISR);
 TIMER0_voidSetPreload(6);
 TIMER0_voidInit();
 TIMER0_voidEnableInterrupt();
 GIE_voidEnable();
 while(1) {
 }
}
