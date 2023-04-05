/************************************************************************************************
  Code from www.electro-dan.co.uk - please credit me
  Free to use, modify and distribute
  NO WARRANTY
************************************************************************************************/

#ifndef _PIC12FTimer2_H_
#define _PIC12FTimer2_H_

#define TASK_INT_IOC 0
#define TASK_TIMER0_SEC 1
#define TASK_TIMER0_DEBOUNCE 2
#define RELAY (gpio.2)
#define BUTTON (gpio.3)
#define YELLOW (gpio.0)
#define GREEN (gpio.1)
#define TIME1 10  // First push timer - 10 minutes
#define TIME2 20  // Second push timer - 20 minutes

char iSec;
char iMin;
char iSetTime; 
char cTask;
char iDebounceCounter;
char iDebounceTicks;

unsigned int bres = 0;

#endif //_PIC12FTimer2_H_
