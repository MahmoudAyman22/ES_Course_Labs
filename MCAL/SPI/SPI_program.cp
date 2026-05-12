#line 1 "C:/Users/Z B O O K/OneDrive/Desktop/Final Project/ES_Course_Labs-main/MCAL/SPI/SPI_program.c"
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
#line 1 "c:/users/z b o o k/onedrive/desktop/final project/es_course_labs-main/mcal/spi/spi_interface.h"
#line 1 "c:/users/z b o o k/onedrive/desktop/final project/es_course_labs-main/services/std_types.h"
#line 6 "c:/users/z b o o k/onedrive/desktop/final project/es_course_labs-main/mcal/spi/spi_interface.h"
void SPI_InitMaster(void);
void SPI_InitSlave(void);
u8 SPI_Transfer(u8 Data);
#line 1 "c:/users/z b o o k/onedrive/desktop/final project/es_course_labs-main/mcal/spi/spi_private.h"
#line 6 "C:/Users/Z B O O K/OneDrive/Desktop/Final Project/ES_Course_Labs-main/MCAL/SPI/SPI_program.c"
void SPI_InitMaster(void) {

  ( ( *((volatile u8*)0x87) ) &= ~(1U << (5)) ) ;
  ( ( *((volatile u8*)0x87) ) |= (1U << (4)) ) ;
  ( ( *((volatile u8*)0x87) ) &= ~(1U << (3)) ) ;

  *((volatile u8*)0x94)  = 0b00000000;

  *((volatile u8*)0x14)  = 0b00100000;
}
void SPI_InitSlave(void) {

  ( ( *((volatile u8*)0x87) ) &= ~(1U << (5)) ) ;
  ( ( *((volatile u8*)0x87) ) |= (1U << (4)) ) ;
  ( ( *((volatile u8*)0x87) ) |= (1U << (3)) ) ;

  *((volatile u8*)0x94)  = 0b00000000;

  *((volatile u8*)0x14)  = 0b00100101;
}
u8 SPI_Transfer(u8 Data) {

  *((volatile u8*)0x13)  = Data;

 while ( ( (( *((volatile u8*)0x94) ) >> (0)) & 1U )  == 0);

 return  *((volatile u8*)0x13) ;
}
