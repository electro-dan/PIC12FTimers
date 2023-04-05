/************************************************************************************************
  Code from www.electro-dan.co.uk - please credit me
  Free to use, modify and distribute
  NO WARRANTY
************************************************************************************************/

#ifndef _PIC12FTimer3_H_
#define _PIC12FTimer3_H_

#define MAINS_FREQ 50 // the local mains supply frequency
#define MAINS_DLY 0xFF - MAINS_FREQ + 1 // the delay value for timer 1 based on local supply

#define TASK_INT_IOC 0
#define TASK_TIMER0 1
#define TASK_TIMER1 2
#define RELAY (gpio.2)
#define BUTTON (gpio.3)
#define RED (gpio.4)
#define YELLOW (gpio.0)
#define GREEN (gpio.1)
#define TIME1 1  // First push timer - 10 minutes
#define TIME2 2  // Second push timer - 30 minutes
#define TIME3 3  // Third push timer - 45 minutes
// For mains, set TMR1H to 0xFF and TMR1L to MAINS_DLY
// This means timer 1 will overflow when 50 cycles are complete, generating the interrupt
#define TMR1HV 0xFF
#define TMR1LV MAINS_DLY
#define TMR0PRESET 61

char iSec;
char iMin;
char iSetTime; 
char cTask;
char iDebounceCounter;

#endif //_PIC12FTimer3_H_
