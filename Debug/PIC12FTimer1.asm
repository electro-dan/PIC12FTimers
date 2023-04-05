;/////////////////////////////////////////////////////////////////////////////////
;// Code Generator: BoostC Compiler - http://www.sourceboost.com
;// Version       : 8.01
;// License Type  : Pro License
;// Limitations   : PIC12,PIC16 max code size:Unlimited, max RAM banks:Unlimited
;/////////////////////////////////////////////////////////////////////////////////

	include "P12F675.inc"
; Heap block 0, size:49 (0x0000002E - 0x0000005E)
__HEAP_BLOCK0_BANK               EQU	0x00000000
__HEAP_BLOCK0_START_OFFSET       EQU	0x0000002E
__HEAP_BLOCK0_END_OFFSET         EQU	0x0000005E
; Heap block 1, size:0 (0x00000000 - 0x00000000)
__HEAP_BLOCK1_BANK               EQU	0x00000000
__HEAP_BLOCK1_START_OFFSET       EQU	0x00000000
__HEAP_BLOCK1_END_OFFSET         EQU	0x00000000
; Heap block 2, size:0 (0x00000000 - 0x00000000)
__HEAP_BLOCK2_BANK               EQU	0x00000000
__HEAP_BLOCK2_START_OFFSET       EQU	0x00000000
__HEAP_BLOCK2_END_OFFSET         EQU	0x00000000
; Heap block 3, size:0 (0x00000000 - 0x00000000)
__HEAP_BLOCK3_BANK               EQU	0x00000000
__HEAP_BLOCK3_START_OFFSET       EQU	0x00000000
__HEAP_BLOCK3_END_OFFSET         EQU	0x00000000
gbl_status                       EQU	0x00000003 ; bytes:1
gbl_indf                         EQU	0x00000000 ; bytes:1
gbl_tmr0                         EQU	0x00000001 ; bytes:1
gbl_pcl                          EQU	0x00000002 ; bytes:1
gbl_fsr                          EQU	0x00000004 ; bytes:1
gbl_gpio                         EQU	0x00000005 ; bytes:1
gbl_pclath                       EQU	0x0000000A ; bytes:1
gbl_intcon                       EQU	0x0000000B ; bytes:1
gbl_pir1                         EQU	0x0000000C ; bytes:1
gbl_tmr1l                        EQU	0x0000000E ; bytes:1
gbl_tmr1h                        EQU	0x0000000F ; bytes:1
gbl_t1con                        EQU	0x00000010 ; bytes:1
gbl_cmcon                        EQU	0x00000019 ; bytes:1
gbl_adresh                       EQU	0x0000001E ; bytes:1
gbl_adcon0                       EQU	0x0000001F ; bytes:1
gbl_option_reg                   EQU	0x00000081 ; bytes:1
gbl_trisio                       EQU	0x00000085 ; bytes:1
gbl_pie1                         EQU	0x0000008C ; bytes:1
gbl_pcon                         EQU	0x0000008E ; bytes:1
gbl_osccal                       EQU	0x00000090 ; bytes:1
gbl_wpu                          EQU	0x00000095 ; bytes:1
gbl_ioc                          EQU	0x00000096 ; bytes:1
gbl_iocb                         EQU	0x00000096 ; bytes:1
gbl_vrcon                        EQU	0x00000099 ; bytes:1
gbl_eedata                       EQU	0x0000009A ; bytes:1
gbl_eeadr                        EQU	0x0000009B ; bytes:1
gbl_eecon1                       EQU	0x0000009C ; bytes:1
gbl_eecon2                       EQU	0x0000009D ; bytes:1
gbl_adresl                       EQU	0x0000009E ; bytes:1
gbl_ansel                        EQU	0x0000009F ; bytes:1
gbl_iSec                         EQU	0x00000025 ; bytes:1
gbl_iMin                         EQU	0x00000026 ; bytes:1
gbl_iSetTime                     EQU	0x00000027 ; bytes:1
gbl_cTask                        EQU	0x00000028 ; bytes:1
gbl_iDebounceCounter             EQU	0x00000029 ; bytes:1
gbl_iDebounceTicks               EQU	0x0000002A ; bytes:1
gbl_bres                         EQU	0x00000023 ; bytes:2
interrupt_2_readgpio             EQU	0x0000002D ; bytes:1
CompTempVar548                   EQU	0x0000002B ; bytes:1
CompTempVar549                   EQU	0x0000002C ; bytes:1
Int1Context                      EQU	0x0000005F ; bytes:1
Int1BContext                     EQU	0x00000020 ; bytes:3
	ORG 0x00000000
	GOTO	_startup
	ORG 0x00000004
	MOVWF Int1Context
	SWAPF STATUS, W
	BCF STATUS, RP0
	MOVWF Int1BContext
	SWAPF PCLATH, W
	MOVWF Int1BContext+D'1'
	SWAPF FSR, W
	MOVWF Int1BContext+D'2'
	BCF PCLATH,3
	BCF PCLATH,4
	GOTO	interrupt
	ORG 0x00000010
initialise_00000
; { initialise ; function begin
	CALL 0x000003FF
	BCF STATUS, RP0
	BSF gbl_status,5
	BSF STATUS, RP0
	MOVWF gbl_osccal
	BCF STATUS, RP0
	BCF gbl_status,5
	MOVLW 0x08
	BSF STATUS, RP0
	MOVWF gbl_trisio
	BCF STATUS, RP0
	MOVWF gbl_gpio
	BSF STATUS, RP0
	CLRF gbl_ansel
	MOVLW 0x07
	BCF STATUS, RP0
	MOVWF gbl_cmcon
	MOVLW 0x88
	BSF STATUS, RP0
	MOVWF gbl_option_reg
	BSF gbl_ioc,3
	BCF STATUS, RP0
	BSF gbl_intcon,3
	CLRF gbl_cTask
	CLRF gbl_iDebounceCounter
	CLRF gbl_iDebounceTicks
	CLRF gbl_iSetTime
	CLRF gbl_iSec
	CLRF gbl_iMin
	BSF gbl_intcon,7
	BSF gbl_intcon,6
	RETURN
; } initialise function end

	ORG 0x00000030
main
; { main ; function begin
	CALL initialise_00000
label1
	BCF PCLATH,3
	BCF PCLATH,4
	BTFSS gbl_cTask,0
	GOTO	label2
	CLRF gbl_tmr0
	CLRF gbl_iDebounceCounter
	CLRF gbl_iDebounceTicks
	BSF gbl_intcon,5
	BCF gbl_cTask,0
	GOTO	label10
label2
	BTFSS gbl_cTask,2
	GOTO	label10
	DECF gbl_iDebounceCounter, W
	BTFSS STATUS,Z
	GOTO	label8
	BTFSC gbl_gpio,3
	GOTO	label8
	MOVF gbl_iSetTime, F
	BTFSS STATUS,Z
	GOTO	label3
	CLRF gbl_iSec
	CLRF gbl_iMin
	CLRF gbl_tmr0
	CLRF gbl_bres
	CLRF gbl_bres+D'1'
	MOVLW 0x0A
	MOVWF gbl_iSetTime
	BCF gbl_gpio,4
	BCF gbl_gpio,0
	BSF gbl_gpio,1
	GOTO	label6
label3
	MOVF gbl_iSetTime, W
	XORLW 0x0A
	BTFSS STATUS,Z
	GOTO	label4
	MOVLW 0x14
	MOVWF gbl_iSetTime
	BCF gbl_gpio,4
	BSF gbl_gpio,0
	BCF gbl_gpio,1
	GOTO	label6
label4
	MOVF gbl_iSetTime, W
	XORLW 0x14
	BTFSS STATUS,Z
	GOTO	label5
	MOVLW 0x1E
	MOVWF gbl_iSetTime
	BSF gbl_gpio,4
	BCF gbl_gpio,0
	BCF gbl_gpio,1
	GOTO	label6
label5
	CLRF gbl_iSetTime
	BCF gbl_gpio,4
	BCF gbl_gpio,0
	BCF gbl_gpio,1
label6
	MOVF gbl_iSetTime, W
	SUBLW 0x00
	BTFSC STATUS,C
	GOTO	label7
	BSF gbl_gpio,2
	GOTO	label9
label7
	BCF gbl_gpio,2
	BCF gbl_intcon,5
	GOTO	label9
label8
	MOVF gbl_iDebounceCounter, W
	SUBLW 0x02
	BTFSC STATUS,C
	GOTO	label9
	BTFSC gbl_gpio,3
	BSF gbl_intcon,3
label9
	BCF gbl_cTask,2
label10
	BTFSS gbl_cTask,1
	GOTO	label15
	MOVF gbl_iMin, W
	SUBWF gbl_iSetTime, W
	MOVWF CompTempVar548
	MOVF CompTempVar548, W
	SUBLW 0x14
	BTFSC STATUS,C
	GOTO	label11
	MOVF gbl_gpio, W
	XORLW 0x10
	MOVWF gbl_gpio
	BCF gbl_gpio,0
	BCF gbl_gpio,1
	GOTO	label13
label11
	MOVF gbl_iMin, W
	SUBWF gbl_iSetTime, W
	MOVWF CompTempVar549
	MOVF CompTempVar549, W
	SUBLW 0x0A
	BTFSC STATUS,C
	GOTO	label12
	BCF gbl_gpio,4
	MOVF gbl_gpio, W
	XORLW 0x01
	MOVWF gbl_gpio
	BCF gbl_gpio,1
	GOTO	label13
label12
	BCF gbl_gpio,4
	BCF gbl_gpio,0
	MOVF gbl_gpio, W
	XORLW 0x02
	MOVWF gbl_gpio
label13
	MOVF gbl_iSetTime, W
	SUBWF gbl_iMin, W
	BTFSS STATUS,C
	GOTO	label14
	BCF gbl_gpio,2
	CLRF gbl_iSetTime
	BCF gbl_gpio,4
	BCF gbl_gpio,0
	BCF gbl_gpio,1
	BCF gbl_intcon,5
label14
	BCF gbl_cTask,1
label15
	BTFSC gbl_intcon,5
	GOTO	label1
	BSF gbl_intcon,3
	SLEEP
	NOP
	GOTO	label1
; } main function end

	ORG 0x000000AA
_startup
	BCF STATUS, RP0
	CLRF gbl_bres
	CLRF gbl_bres+D'1'
	BCF PCLATH,3
	BCF PCLATH,4
	GOTO	main
	ORG 0x000000B0
interrupt
; { interrupt ; function begin
	BCF STATUS, RP0
	BTFSS gbl_intcon,0
	GOTO	label17
	BTFSS gbl_intcon,3
	GOTO	label17
	BSF gbl_cTask,0
	MOVF gbl_gpio, W
	MOVWF interrupt_2_readgpio
	BCF gbl_intcon,0
	BCF gbl_intcon,3
label17
	BTFSS gbl_intcon,2
	GOTO	label22
	BTFSS gbl_intcon,5
	GOTO	label22
	MOVLW 0x10
	ADDWF gbl_bres, F
	BTFSC STATUS,C
	INCF gbl_bres+D'1', F
	MOVLW 0xF4
	SUBWF gbl_bres+D'1', W
	BTFSS STATUS,Z
	GOTO	label18
	MOVLW 0x24
	SUBWF gbl_bres, W
label18
	BTFSS STATUS,C
	GOTO	label20
	MOVLW 0x24
	SUBWF gbl_bres, F
	MOVLW 0xF4
	BTFSS STATUS,C
	DECF gbl_bres+D'1', F
	SUBWF gbl_bres+D'1', F
	MOVF gbl_iSetTime, F
	BTFSC STATUS,Z
	GOTO	label20
	INCF gbl_iSec, F
	MOVF gbl_iSec, W
	XORLW 0x3C
	BTFSS STATUS,Z
	GOTO	label19
	INCF gbl_iMin, F
	CLRF gbl_iSec
label19
	BSF gbl_cTask,1
label20
	MOVLW 0x0A
	SUBWF gbl_iDebounceCounter, W
	BTFSC STATUS,C
	GOTO	label21
	INCF gbl_iDebounceTicks, F
	MOVF gbl_iDebounceTicks, W
	XORLW 0xC8
	BTFSS STATUS,Z
	GOTO	label21
	INCF gbl_iDebounceCounter, F
	CLRF gbl_iDebounceTicks
	BSF gbl_cTask,2
label21
	BCF gbl_intcon,2
label22
	SWAPF Int1BContext+D'2', W
	MOVWF FSR
	SWAPF Int1BContext+D'1', W
	MOVWF PCLATH
	SWAPF Int1BContext, W
	MOVWF STATUS
	SWAPF Int1Context, F
	SWAPF Int1Context, W
	RETFIE
; } interrupt function end

	ORG 0x00002007
	DW 0x3FC1
	END
