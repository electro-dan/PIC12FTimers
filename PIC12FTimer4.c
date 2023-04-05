/************************************************************************************************
  Code from www.electro-dan.co.uk - please credit me
  Free to use, modify and distribute
  NO WARRANTY
************************************************************************************************/

#include <system.h>
#include <i2c_driver.h>
#include "PIC12FTimer4.h"

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

void ds3231Write(char ds3231Reg, char byteOut) {
	i2c_start();
	i2c_write(ds3231_addr); // address + write
	i2c_write(ds3231Reg); // start at address
	i2c_write(byteOut); // start at address
	i2c_stop();
}

void ds3231Init() {
	/* control register 0Eh
    bit7 EOSC   Enable Oscillator (1 if oscillator must be stopped when on battery)
    bit6 BBSQW  Battery Backed Square Wave
    bit5 CONV   Convert temperature (1 forces a conversion NOW)
    bit4 RS2    Rate select - frequency of square wave output
    bit3 RS1    Rate select
    bit2 INTCN  Interrupt control (1 for use of the alarms and to disable square wave)
    bit1 A2IE   Alarm2 interrupt enable (1 to enable)
    bit0 A1IE   Alarm1 interrupt enable (1 to enable)
    */
	ds3231Write(0x0E, 0x80);
	/* Status Register 0Fh
    bit7 OSF     Oscillator Stop Flag
    bit3 EN32kHz Enable 32kHz Output
    bit2 BSY     Busy
    bit1 A2F     Alarm 2 Flag
    bit0 A1F     Alarm 1 Flag
    */
	ds3231Write(0x0F, 0x80);
}

void ds3231Start() {
	ds3231Write(0x0F, 0x00);
}

void ds3231Stop() {
	ds3231Write(0x0F, 0x80);
}

void ds3231WriteDate() {
	i2c_start();
	i2c_write(ds3231_addr); // address + write
	i2c_write(0); // start at address 0
	i2c_write(0); // seconds
	i2c_write(0); // minutes
	i2c_write(0); // hours
	i2c_write(1); // day
	i2c_write(1); // month + century
	i2c_write(0); // year - 0
	i2c_stop();
}

void initialise() {
    // Use oscillator callibration value by copying it to OSCCAL
    asm {
        call 0x3FF
        bsf _status, RP0
        movwf _osccal
        bcf _status, RP0
    }
    // GP0 = IN/OUT: I2C SCL
    // GP1 = IN/OUT, I2C SDA
    // GP2 = OUT: Relay trigger
    // GP3 = IN: push button
    // GP4 = OUT: LED
    // GP5 = IN: SQW input
    trisio = 0b00101011;
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
    
    // Timer 1 setup - interrupt on DS3231 SQW 1Hz
    // Timer1 Registers Prescaler= 1 - TMR1 Preset = 65535 - Freq = 1 Hz
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
    
	i2c_init(1); 
	ds3231WriteDate();
	ds3231Init();

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
                    // Start the DS3231 on the first timer
                    ds3231Start();
                    // Red LED
                    RED = 1;
                    // On relay and enable timer 1
                    RELAY = 1;
                    t1con.TMR1ON = 1; // Enable Timer 1
                } else {
                    iSetTime = 0;
                    // Off LEDs
                    RED = 0;
                    // Off relay, disable timer 1
                    RELAY = 0;
                    iSec = 0;
                    iMin = 0;
                    // Disable Timer 1
                    t1con.TMR1ON = 0;
                    // Stop DS3231
                    ds3231Stop();
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
            RED ^= 1; // toggle the red LED
            
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
                // Disable Timer 1
                t1con.TMR1ON = 0;
                // Stop DS3231
                ds3231Stop();
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
