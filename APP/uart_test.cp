#line 1 "C:/Users/Z B O O K/OneDrive/Desktop/Final Project/ES_Course_Labs-main/APP/uart_test.c"
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
#line 1 "c:/users/z b o o k/onedrive/desktop/final project/es_course_labs-main/mcal/uart/uart_interface.h"
#line 1 "c:/users/z b o o k/onedrive/desktop/final project/es_course_labs-main/services/std_types.h"
#line 6 "c:/users/z b o o k/onedrive/desktop/final project/es_course_labs-main/mcal/uart/uart_interface.h"
void UART_Init(u16 BaudRate_CalculatedValue);
void UART_Transmit(u8 Data);
u8 UART_Receive(void);
#line 3 "C:/Users/Z B O O K/OneDrive/Desktop/Final Project/ES_Course_Labs-main/APP/uart_test.c"
void UART_Test(void) {
 u8 Received_Char;
 UART_Init(25);
 UART_Transmit('H');
 UART_Transmit('i');
 while(1) {
 Received_Char = UART_Receive();
 UART_Transmit(Received_Char);
 }
}
