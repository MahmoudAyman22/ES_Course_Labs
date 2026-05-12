#line 1 "C:/Users/Z B O O K/OneDrive/Desktop/Final Project/ES_Course_Labs-main/APP/pwm_test.c"
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
#line 1 "c:/users/z b o o k/onedrive/desktop/final project/es_course_labs-main/mcal/pwm/pwm_interface.h"
#line 1 "c:/users/z b o o k/onedrive/desktop/final project/es_course_labs-main/services/std_types.h"
#line 6 "c:/users/z b o o k/onedrive/desktop/final project/es_course_labs-main/mcal/pwm/pwm_interface.h"
void PWM_Init(void);
void PWM_SetDutyCycle(u8 DutyCycle_Percent);
#line 1 "c:/users/z b o o k/onedrive/desktop/final project/es_course_labs-main/mcal/ext_int/ext_int0_interface.h"
#line 1 "c:/users/z b o o k/onedrive/desktop/final project/es_course_labs-main/services/std_types.h"
#line 11 "c:/users/z b o o k/onedrive/desktop/final project/es_course_labs-main/mcal/ext_int/ext_int0_interface.h"
void EXT_INT0_Init(void);
void EXT_INT0_Enable(void);
void EXT_INT0_Disable(void);
void EXT_INT0_SetEdge(u8 edge_type);
void EXT_INT0_SetCallback(void (*ptr)(void));
#line 1 "c:/users/z b o o k/onedrive/desktop/final project/es_course_labs-main/mcal/gpio/gpio_interface.h"
#line 1 "c:/users/z b o o k/onedrive/desktop/final project/es_course_labs-main/services/std_types.h"
#line 31 "c:/users/z b o o k/onedrive/desktop/final project/es_course_labs-main/mcal/gpio/gpio_interface.h"
void GPIO_SetPinDirection(u8 Port, u8 Pin, u8 Direction);
void GPIO_SetPinValue(u8 Port, u8 Pin, u8 Value);
u8 GPIO_GetPinValue(u8 Port, u8 Pin);
void GPIO_Init(void);
#line 5 "C:/Users/Z B O O K/OneDrive/Desktop/Final Project/ES_Course_Labs-main/APP/pwm_test.c"
volatile u8 Duty_State = 0;
void APP_ChangeSpeed_ISR(void) {
 Duty_State++;
 if(Duty_State > 3) {
 Duty_State = 0;
 }
 if(Duty_State == 0) PWM_SetDutyCycle(25);
 else if(Duty_State == 1) PWM_SetDutyCycle(50);
 else if(Duty_State == 2) PWM_SetDutyCycle(75);
 else if(Duty_State == 3) PWM_SetDutyCycle(100);
}
void PWM_Test(void) {
 PWM_Init();
 EXT_INT0_Init();
 EXT_INT0_SetCallback(APP_ChangeSpeed_ISR);
 EXT_INT0_Enable();
 PWM_SetDutyCycle(25);
 while(1) {
 }
}
