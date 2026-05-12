#line 1 "C:/Users/Z B O O K/OneDrive/Desktop/Final Project/ES_Course_Labs-main/MCAL/EXT_INT/EXT_INT0.c"
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
#line 1 "c:/users/z b o o k/onedrive/desktop/final project/es_course_labs-main/mcal/ext_int/ext_int0_interface.h"
#line 1 "c:/users/z b o o k/onedrive/desktop/final project/es_course_labs-main/services/std_types.h"
#line 11 "c:/users/z b o o k/onedrive/desktop/final project/es_course_labs-main/mcal/ext_int/ext_int0_interface.h"
void EXT_INT0_Init(void);
void EXT_INT0_Enable(void);
void EXT_INT0_Disable(void);
void EXT_INT0_SetEdge(u8 edge_type);
void EXT_INT0_SetCallback(void (*ptr)(void));
#line 1 "c:/users/z b o o k/onedrive/desktop/final project/es_course_labs-main/mcal/ext_int/ext_int0_config.h"
#line 1 "c:/users/z b o o k/onedrive/desktop/final project/es_course_labs-main/mcal/ext_int/ext_int0_private.h"
#line 7 "C:/Users/Z B O O K/OneDrive/Desktop/Final Project/ES_Course_Labs-main/MCAL/EXT_INT/EXT_INT0.c"
void (*EXT_INT0_Callback)(void) =  ((void*)0) ;

void EXT_INT0_Init(void) {
  ( ( *((volatile u8*)0x86) ) |= (1U << (0)) ) ;




  ( ( *((volatile u8*)0x81) ) &= ~(1U << (6)) ) ;


  ( ( *((volatile u8*)0x0B) ) &= ~(1U << (1)) ) ;
}

void EXT_INT0_Enable(void) {
  ( ( *((volatile u8*)0x0B) ) |= (1U << (4)) ) ;
  ( ( *((volatile u8*)0x0B) ) |= (1U << (7)) ) ;
}

void EXT_INT0_Disable(void) {
  ( ( *((volatile u8*)0x0B) ) &= ~(1U << (4)) ) ;
}

void EXT_INT0_SetEdge(u8 edge_type) {
 if (edge_type ==  1 ) {
  ( ( *((volatile u8*)0x81) ) |= (1U << (6)) ) ;
 }
 else if (edge_type ==  0 ) {
  ( ( *((volatile u8*)0x81) ) &= ~(1U << (6)) ) ;
 }
}

void EXT_INT0_SetCallback(void (*ptr)(void)) {
 if (ptr !=  ((void*)0) ) {
 EXT_INT0_Callback = ptr;
 }
}
