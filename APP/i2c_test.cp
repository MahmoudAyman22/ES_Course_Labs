#line 1 "C:/Users/Z B O O K/OneDrive/Desktop/Final Project/ES_Course_Labs-main/APP/i2c_test.c"
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
#line 1 "c:/users/z b o o k/onedrive/desktop/final project/es_course_labs-main/mcal/i2c/i2c_interface.h"
#line 1 "c:/users/z b o o k/onedrive/desktop/final project/es_course_labs-main/services/std_types.h"
#line 6 "c:/users/z b o o k/onedrive/desktop/final project/es_course_labs-main/mcal/i2c/i2c_interface.h"
void I2C_InitMaster(u8 Address_BaudRate_Calculated);
void I2C_Start(void);
void I2C_Stop(void);
void I2C_Write(u8 Data);
u8 I2C_Read(u8 Ack);
#line 3 "C:/Users/Z B O O K/OneDrive/Desktop/Final Project/ES_Course_Labs-main/APP/i2c_test.c"
void I2C_Test(void) {
 I2C_InitMaster(0x09);
 while(1) {
 I2C_Start();
 I2C_Write(0xA0);
 I2C_Write(0x00);
 I2C_Write(0x55);
 I2C_Stop();
 }
}
