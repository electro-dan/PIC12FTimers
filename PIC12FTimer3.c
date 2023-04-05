/************************************************************************************************
  Code from www.electro-dan.co.uk - please credit me
  Free to use, modify and distribute
  NO WARRANTY
************************************************************************************************/

#include <system.h>
#include "PIC12FTimer3.h"

//Target PIC12F675 configuration word
#pragma DATA _CONFIG, _PWRTE_ON & _WDT_OFF & _INTRC_OSC_NOCLKOUT & _CPD_OFF & _CP_OFF & _MCLRE_OFF & _BODEN_ON

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

    // Handle timer0 interrupt - button debounce
    if(intcon.T0IF && intcon.T0IE) {
        tmr0 = TMR0PRESET; // preset for timer0 register
        iDebounceCounter++;
        intcon.T0IF = 0; // Clear interrupt flag
        cTask.TASK_TIMER0 = 1;
    }
    
    // Handle timer1 interrupt - delay counter
    if (pir1.TMR1IF && pie1.TMR1IE) {
        tmr1h = TMR1HV;      // preset for timer1 MSB register
        tmr1l = TMR1LV;      // preset for timer1 LSB register

        // Tick seconds
        iSec++;
        if (iSec >= 60) {
            // Tick minutes
            iMin++;
            iSec = 0;
        }
        pir1.TMR1IF = 0;     // Clear interrupt flag
        cTask.TASK_TIMER1 = 1;
    }
}

void initialise() {
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
    // Bit 7 NOT_GPPU = 1 : disable pull ups
    // Bit 5 T0CS = 0: TMR0 Clock Source Select bit...0 = Internal Clock (CLKO) 1 = Transition on T0CKI pin
    // Bit 4 T0SE = 0: TMR0 Source Edge Select bit 0 = low/high 1 = high/low
    // Bit 3 PSA = 0: Prescaler Assignment bit...0 = Prescaler is assigned to the Timer0
    // Bits 2-0 PS2:PS0 = 111: Prescaler Rate Select bits, 111 = 1:256 prescaler
    option_reg = 0x1000111; 
    //Timer0 Registers Prescaler= 256 - TMR0 Preset = 61 - Freq = 20.03 Hz - Period = 0.049920 seconds
    tmr0 = TMR0PRESET; // preset for timer0 register
    
    // Timer 1 setup - interrupt on AC 50Hz
    // Timer1 Registers Prescaler= 1 - TMR1 Preset = 65486 - Freq = 1 Hz from 50Hz
    // Bits 5-4 T1CKPS1:T1CKPS0 = 00: Prescaler Rate Select bits, 00 = 1:1 prescaler
    // Bit 3 T1OSCEN = 0: Timer1 LP Oscillator Enable Control bit, 0 = off
    // Bit 2 NOT_T1SYNC = 1: Timer1 External Clock Input Synchronization Control bit, 1 = Do not synchronize external clock input
    // Bit 1 TMR1CS = 1: Timer1 Clock Source Select bit, 1 = External clock from T1OSO/T1CKI pin (on the rising edge)
    // Bit 0 TMR1ON = 0: Timer1 On Bit, 0 = off
    t1con = 0b00000110;
    tmr1h = TMR1HV;      // preset for timer1 MSB register
    tmr1l = TMR1LV;      // preset for timer1 LSB register
    pie1.TMR1IE = 1;     // Timer 1 interrupt
    
    // Setup for GP3 Interrupt [Button press]
    ioc.IOC3 = 1; // GP3 interrupt on change
    intcon.GPIE = 1; // GP3/RB0 Interrupt enabled (for button)
    
    // No task at initialisation
    cTask = 0;
    iDebounceCounter = 0;
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
            tmr0 = TMR0PRESET;
            // Enable timer 0 interrupt
            intcon.T0IE = 1;
            cTask.TASK_INT_IOC = 0;
        } else if (cTask.TASK_TIMER0) {
            // Timer complete
            // if debounce counter is 1, check state is still on
            if ((iDebounceCounter == 1) && (!BUTTON)) {
                // Button still pressed and debounced, set a timer
                if (iSetTime == 0) {
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
                    t1con.TMR1ON = 1; // Enable Timer 1
                } else {
                    // Off relay, disable timer 1
                    RELAY = 0;
                    iSec = 0;
                    iMin = 0;
                    t1con.TMR1ON = 0; // Disable Timer 1
                }
            } else if ((iDebounceCounter > 2) && (BUTTON)) {
                // Button released, interrupt can be enabled again
                intcon.GPIE = 1; // Enable interrupt
                intcon.T0IE = 0; // Disable timer 0 interrupt
                iDebounceCounter = 0;
            }
            cTask.TASK_TIMER0 = 0;
        }
        
        if (cTask.TASK_TIMER1) {			
            
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
                // Reset time
                iSec = 0;
                iMin = 0;
                iSetTime = 0;
                // Off LEDs
                RED = 0;
                YELLOW = 0;
                GREEN = 0;
                // Off timer
                t1con.TMR1ON = 0;
            }
            cTask.TASK_TIMER1 = 0;
        } 
        if (!t1con.TMR1ON && !intcon.T0IE) {
            // We can only sleep if the timers are off
            intcon.GPIE = 1; // ensure the button press interrupt is enabled
            sleep();
            nop(); // NOP must occur after wake up
        }
    }
}
