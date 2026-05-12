#line 1 "C:/Users/Z B O O K/OneDrive/Desktop/Final Project/ES_Course_Labs-main/MCAL/I2C/I2C_program.c"
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
#line 1 "c:/users/z b o o k/onedrive/desktop/final project/es_course_labs-main/mcal/i2c/i2c_interface.h"
#line 1 "c:/users/z b o o k/onedrive/desktop/final project/es_course_labs-main/services/std_types.h"
#line 6 "c:/users/z b o o k/onedrive/desktop/final project/es_course_labs-main/mcal/i2c/i2c_interface.h"
void I2C_InitMaster(u8 Address_BaudRate_Calculated);
void I2C_Start(void);
void I2C_Stop(void);
void I2C_Write(u8 Data);
u8 I2C_Read(u8 Ack);
#line 1 "c:/users/z b o o k/onedrive/desktop/final project/es_course_labs-main/mcal/i2c/i2c_private.h"
#line 5 "C:/Users/Z B O O K/OneDrive/Desktop/Final Project/ES_Course_Labs-main/MCAL/I2C/I2C_program.c"
void I2C_InitMaster(u8 Address_BaudRate_Calculated) {
  ( ( *((volatile u8*)0x87) ) |= (1U << (3)) ) ;
  ( ( *((volatile u8*)0x87) ) |= (1U << (4)) ) ;
  *((volatile u8*)0x93)  = Address_BaudRate_Calculated;
  *((volatile u8*)0x14)  = 0b00101000;
  *((volatile u8*)0x94)  = 0b00000000;
}
void I2C_Start(void) {
  ( ( *((volatile u8*)0x91) ) |= (1U << (0)) ) ;
 while( ( (( *((volatile u8*)0x91) ) >> (0)) & 1U )  == 1);
}
void I2C_Stop(void) {
  ( ( *((volatile u8*)0x91) ) |= (1U << (2)) ) ;
 while( ( (( *((volatile u8*)0x91) ) >> (2)) & 1U )  == 1);
}
void I2C_Write(u8 Data) {
  *((volatile u8*)0x13)  = Data;
 while( ( (( *((volatile u8*)0x94) ) >> (2)) & 1U )  == 1);
}
u8 I2C_Read(u8 Ack) {
 u8 received_data;
  ( ( *((volatile u8*)0x91) ) |= (1U << (3)) ) ;
 while( ( (( *((volatile u8*)0x94) ) >> (0)) & 1U )  == 0);
 received_data =  *((volatile u8*)0x13) ;
 if(Ack) {
  ( ( *((volatile u8*)0x91) ) &= ~(1U << (5)) ) ;
 } else {
  ( ( *((volatile u8*)0x91) ) |= (1U << (5)) ) ;
 }
  ( ( *((volatile u8*)0x91) ) |= (1U << (4)) ) ;
 while( ( (( *((volatile u8*)0x91) ) >> (4)) & 1U )  == 1);

 return received_data;
}
