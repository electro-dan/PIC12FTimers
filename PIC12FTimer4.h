/************************************************************************************************
  Code from www.electro-dan.co.uk - please credit me
  Free to use, modify and distribute
  NO WARRANTY
************************************************************************************************/

#ifndef _PIC12FTimer4_H_
#define _PIC12FTimer4_H_

#define TASK_INT_IOC 0
#define TASK_TIMER0 1
#define TASK_TIMER1 2
#define RELAY (gpio.2)
#define BUTTON (gpio.3)
#define RED (gpio.4)
#define TIME1 1  // First push timer - 10 minutes
// For DS321 1Hz square wave, set both TMR1H and TRM1L to 0xFF
// This means timer 1 will overflow when 1 cycle completes, generating the interrupt
#define TMR1HV 0xFF
#define TMR1LV 0xFF
#define TMR0PRESET 61

char iSec;
char iMin;
char iSetTime; 
char cTask;
char iDebounceCounter;

// i2c options
#define use_i2c_SW
// clock SCL on GP0, data SDA on GP1
#define i2c_ARGS	0, GPIO, TRISIO, 1, GPIO, TRISIO, e_SSPCON1, e_SSPCON2, \
					e_SSPSTAT, e_SSPBUF, e_SSPIF_BIT, e_SSPIF_PIR,			\
					e_BCLIF_BIT, e_BCLIF_PIR, 7, e_SSPADD, (i2c_reset_wdt | i2c_SMP)
// RAM used by the software i2c driver to emulate the equivalent i2c hardware registers					
unsigned short swi2c_SSPCON1@0x40;	// define location for the emulated SSPCON1
unsigned short swi2c_SSPCON2@0x41;	// define location for the emulated SSPCON2
unsigned short swi2c_SSPSTAT@0x42;	// define location for the emulated SSPSTAT
unsigned short swi2c_SSPBUF@0x43;	// define location for the emulated SSPBUF
unsigned short swi2c_SSPIF_PIR@0x44;// define location for the emulated SSPIF_PIR
unsigned short swi2c_BCLIF_PIR@0x45;// define location for the emulated BCLIF_PIR
unsigned short swi2c_SSPADD@0x46;	// define location for the emulated SSPADD
#define e_SSPCON1	0x40
#define e_SSPCON2	0x41
#define e_SSPSTAT	0x42
#define e_SSPADD	0x43
#define e_SSPBUF	0x44
#define e_SSPIF_PIR	0x45
#define e_BCLIF_PIR	0x46
#define e_SSPIF_BIT	3
#define e_BCLIF_BIT	3

#define ds3231_addr 0xD0

#endif //_PIC12FTimer4_H_
