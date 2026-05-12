#line 1 "C:/Users/Z B O O K/OneDrive/Desktop/Final Project/ES_Course_Labs-main/MCAL/UART/UART_program.c"
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
#line 1 "c:/users/z b o o k/onedrive/desktop/final project/es_course_labs-main/mcal/uart/uart_interface.h"
#line 1 "c:/users/z b o o k/onedrive/desktop/final project/es_course_labs-main/services/std_types.h"
#line 6 "c:/users/z b o o k/onedrive/desktop/final project/es_course_labs-main/mcal/uart/uart_interface.h"
void UART_Init(u16 BaudRate_CalculatedValue);
void UART_Transmit(u8 Data);
u8 UART_Receive(void);
#line 1 "c:/users/z b o o k/onedrive/desktop/final project/es_course_labs-main/mcal/uart/uart_private.h"
#line 6 "C:/Users/Z B O O K/OneDrive/Desktop/Final Project/ES_Course_Labs-main/MCAL/UART/UART_program.c"
void UART_Init(u16 BaudRate_CalculatedValue) {

  *((volatile u8*)0x99)  = BaudRate_CalculatedValue;

  ( ( *((volatile u8*)0x87) ) |= (1U << (6)) ) ;
  ( ( *((volatile u8*)0x87) ) |= (1U << (7)) ) ;
  *((volatile u8*)0x98)  = 0b00100100;
  *((volatile u8*)0x18)  = 0b10010000;
}

void UART_Transmit(u8 Data) {
 while ( ( (( *((volatile u8*)0x0C) ) >> (4)) & 1U )  == 0);
  *((volatile u8*)0x19)  = Data;
}

u8 UART_Receive(void) {
 while ( ( (( *((volatile u8*)0x0C) ) >> (5)) & 1U )  == 0);
 return  *((volatile u8*)0x1A) ;
}
