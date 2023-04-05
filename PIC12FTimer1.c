/************************************************************************************************
  Code from www.electro-dan.co.uk - please credit me
  Free to use, modify and distribute
  NO WARRANTY
************************************************************************************************/

#include <system.h>
#include "PIC12FTimer1.h"

//Target PIC12F675 configuration word
#pragma DATA _CONFIG, _PWRTE_ON & _WDT_OFF & _XT_OSC & _CPD_OFF & _CP_OFF & _MCLRE_OFF & _BODEN_ON

//Set clock frequency
#pragma CLOCK_FREQ	4000000

void interrupt() {
    // Handle interrupt-on-change - button press
    if (intcon.GPIF && intcon.GPIE) {
        // Debounce - start timer0
        cTask.TASK_INT_IOC = 1;
        // read gpio
        char readgpio = gpio;
        intcon.GPIF = 0; // Clear interrupt flag
        intcon.GPIE = 0; // Disable interrupt (for de-bouncing)
    }

    // Handle timer0 interrupt
    if(intcon.T0IF && intcon.T0IE) {
        // uses 1 variable; unsigned 16 bit int bres
        // gets here every TMR0 int (every 256 ticks)
        // Count 1 second intervals
        bres += 16;	// add (256/16) ticks to bresenham total
        if (bres >= 62500) { // if reached 1 second (1000000/16)
            bres -= 62500; // subtract 1 second, retain error
            if (iSetTime) {
                // Tick 1 second
                iSec++;
                if (iSec == 60) {
                    // Tick minutes
                    iMin++;
                    iSec = 0;
                }
                cTask.TASK_TIMER0_SEC = 1;
            }
        }
        // Tick the debouce counter, if debounce counter less than 10x (500ms)
        if (iDebounceCounter < 10) {
            iDebounceTicks++;
            if (iDebounceTicks == 200) { // 200 ticks is roughly 50ms
                iDebounceCounter++;
                iDebounceTicks = 0;
                cTask.TASK_TIMER0_DEBOUNCE = 1;
            }
        }
        intcon.T0IF = 0; // Clear interrupt flag   
    }
}

void initialise() {

    // Use oscillator callibration value by copying it to OSCCAL
    asm {
        call 0x3FF
        bsf _status, RP0
        movwf _osccal
        bcf _status, RP0
    }
    // GP0 = OUT: LED1
    // GP1 = OUT: LED2
    // GP2 = OUT: Relay trigger
    // GP3 = IN: push button
    // GP4 = OUT: LED3 or OSC2: 32kHz crystal
    // GP5 = N/A, T1 in or OSC1: 32kHz crystal
    trisio = 0b00001000;
    gpio = 0b00001000; // all LEDs/outputs off by default

    ansel = 0; // configure A/D inputs as digital I/O
    cmcon = 7; // compartor off

    // OPTION register - for TMR0 and Weak pull-ups config
    // set the prescaler to the WDT
    // Therefore, timer0 has NO prescaler and will overflow every 256 instructions
    // Bit 7 NOT_GPPU = 1 : disable pull ups
    // Bit 5 T0CS = 0: TMR0 Clock Source Select bit...0 = Internal Clock (CLKO) 1 = Transition on T0CKI pin
    // Bit 4 T0SE = 0: TMR0 Source Edge Select bit 0 = low/high 1 = high/low
    // Bit 3 PSA = 1: Prescaler Assignment bit...0 = Prescaler is assigned to watchdog timer WDT
    // Bits 2-0 PS2:PS0 = 000: Prescaler Rate Select bits, 000 = 1:1 prescaler
    option_reg = 0b10001000; 
    
    // Setup for GP3 Interrupt [Button press]
    ioc.IOC3 = 1; // GP3 interrupt on change
    intcon.GPIE = 1; // GP3/RB0 Interrupt enabled (for button)
    
    // No task at initialisation
    cTask = 0;
    iDebounceCounter = 0;
    iDebounceTicks = 0;
    iSetTime = 0;
    iSec = 0;
    iMin = 0;
    
    // Enable interrupts
    intcon.GIE = 1;
    intcon.PEIE = 1;
}


void main() {
    initialise();

    // Endless loop
    while(1) {
        if (cTask.TASK_INT_IOC) {
            // Interrupt-on-change occured - start timer 0
            // Reset timer 0
            tmr0 = 0;
            iDebounceCounter = 0;
            iDebounceTicks = 0;
            // Enable timer 0 interrupt
            intcon.T0IE = 1;
            cTask.TASK_INT_IOC = 0;
        } else if (cTask.TASK_TIMER0_DEBOUNCE) {
            // Timer 0 counted 50ms
            // if debounce counter is 1, check state is still on
            if ((iDebounceCounter == 1) && (!BUTTON)) {
                // Button still pressed and debounced, set a timer
                if (iSetTime == 0) {
                    // This is the first timer, so reset seconds/minutes
                    iSec = 0;
                    iMin = 0;
                    // Also reset tmr0 and bresenham total
                    tmr0 = 0;
                    bres = 0;                    
                    // Set the timer to the first option
                    iSetTime = TIME1;
                    // Green LED
                    RED = 0;
                    YELLOW = 0;
                    GREEN = 1;
                } else if (iSetTime == TIME1) {
                    iSetTime = TIME2;
                    // Yellow LED
                    RED = 0;
                    YELLOW = 1;
                    GREEN = 0;
                } else if (iSetTime == TIME2) {
                    iSetTime = TIME3;
                    // Red LED
                    RED = 1;
                    YELLOW = 0;
                    GREEN = 0;
                } else {
                    iSetTime = 0;
                    // Off LEDs
                    RED = 0;
                    YELLOW = 0;
                    GREEN = 0;
                }
                    
                if (iSetTime > 0) {
                    // On relay and enable timer 1
                    RELAY = 1;
                } else {
                    // Off relay, disable timer 1
                    RELAY = 0;
                    intcon.T0IE = 0; // Disable timer 0 interrupt
                }
            } else if ((iDebounceCounter > 2) && (BUTTON)) {
                // Button released, interrupt can be enabled again
                intcon.GPIE = 1; // Enable interrupt
            }
            cTask.TASK_TIMER0_DEBOUNCE = 0;
        }
        
        if (cTask.TASK_TIMER0_SEC) {
            // Change LEDs based on minutes left
            if ((iSetTime - iMin) > TIME2) {
                RED ^= 1; // toggle the red LED
                YELLOW = 0;
                GREEN = 0;
            } else if ((iSetTime - iMin) > TIME1) {
                RED = 0;
                YELLOW ^= 1; // toggle the yellow LED
                GREEN = 0;
            } else {
                RED = 0;
                YELLOW = 0;
                GREEN ^= 1;  // toggle the green LED
            }
            
            // Check if iMin reached setting
            if (iMin >= iSetTime) {
                // Time reached, switch off relay and reset
                RELAY = 0;
                // Turn off timer settings
                iSetTime = 0;
                // Off LEDs
                RED = 0;
                YELLOW = 0;
                GREEN = 0;
                // Off timer
                intcon.T0IE = 0; // Disable timer 0 interrupt
            }
            cTask.TASK_TIMER0_SEC = 0;
        } 
        if (!intcon.T0IE) {
            // We can only sleep if the timer interrupt is off
            intcon.GPIE = 1; // ensure the button press interrupt is enabled before sleep
            sleep();
            nop(); // NOP must occur after wake up
        }
    }
}
