;/////////////////////////////////////////////////////////////////////////////////
;// Code Generator: BoostC Compiler - http://www.sourceboost.com
;// Version       : 8.01
;// License Type  : Pro License
;// Limitations   : PIC12,PIC16 max code size:Unlimited, max RAM banks:Unlimited
;/////////////////////////////////////////////////////////////////////////////////

	include "P12F675.inc"
; Heap block 0, size:23 (0x00000048 - 0x0000005E)
__HEAP_BLOCK0_BANK               EQU	0x00000000
__HEAP_BLOCK0_START_OFFSET       EQU	0x00000048
__HEAP_BLOCK0_END_OFFSET         EQU	0x0000005E
; Heap block 1, size:17 (0x0000002F - 0x0000003F)
__HEAP_BLOCK1_BANK               EQU	0x00000000
__HEAP_BLOCK1_START_OFFSET       EQU	0x0000002F
__HEAP_BLOCK1_END_OFFSET         EQU	0x0000003F
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
gbl_iSec                         EQU	0x00000023 ; bytes:1
gbl_iMin                         EQU	0x00000024 ; bytes:1
gbl_iSetTime                     EQU	0x00000025 ; bytes:1
gbl_cTask                        EQU	0x00000026 ; bytes:1
gbl_iDebounceCounter             EQU	0x00000027 ; bytes:1
gbl_swi2c_SSPCON1                EQU	0x00000040 ; bytes:2
gbl_swi2c_SSPCON2                EQU	0x00000041 ; bytes:2
gbl_swi2c_SSPSTAT                EQU	0x00000042 ; bytes:2
gbl_swi2c_SSPBUF                 EQU	0x00000043 ; bytes:2
gbl_swi2c_SSPIF_PIR              EQU	0x00000044 ; bytes:2
gbl_swi2c_BCLIF_PIR              EQU	0x00000045 ; bytes:2
gbl_swi2c_SSPADD                 EQU	0x00000046 ; bytes:2
interrupt_2_readgpio             EQU	0x0000002E ; bytes:1
ds3231Writ_00013_arg_ds3231Reg   EQU	0x00000028 ; bytes:1
ds3231Writ_00013_arg_byteOut     EQU	0x00000029 ; bytes:1
i2c_START_00000_1_l_scl          EQU	0x00000005 ; bit:0
i2c_START_00000_1_l_sda          EQU	0x00000005 ; bit:1
i2c_START_00000_1_l_scl_tris     EQU	0x00000085 ; bit:0
i2c_START_00000_1_l_sda_tris     EQU	0x00000085 ; bit:1
i2c_START_00000_1_l_sspif        EQU	0x00000045 ; bit:3
i2c_START_00000_1_l_bclif        EQU	0x00000046 ; bit:3
i2c_START_00000_1_l_rw           EQU	0x00000042 ; bit:2
i2c_START_00000_1_l_s            EQU	0x00000042 ; bit:3
i2c_START_00000_1_l_sen          EQU	0x00000041 ; bit:0
i2c_START_00000_1_l_rcen         EQU	0x00000041 ; bit:3
i2c_START_00000_1_l_pen          EQU	0x00000041 ; bit:2
i2c_START_00000_1_l_rsen         EQU	0x00000041 ; bit:1
i2c_START_00000_1_l_acken        EQU	0x00000041 ; bit:4
i2c_WRITE_00000_arg_i2c_data     EQU	0x0000002A ; bytes:1
CompTempVarRet548                EQU	0x0000002D ; bytes:1
i2c_WRITE_00000_1_i2c_SSPBUF     EQU	0x00000044 ; bytes:1
i2c_WRITE_00000_1_l_scl          EQU	0x00000005 ; bit:0
i2c_WRITE_00000_1_l_sda          EQU	0x00000005 ; bit:1
i2c_WRITE_00000_1_l_scl_tris     EQU	0x00000085 ; bit:0
i2c_WRITE_00000_1_l_sda_tris     EQU	0x00000085 ; bit:1
i2c_WRITE_00000_1_l_bf           EQU	0x00000042 ; bit:0
i2c_WRITE_00000_1_l_ackdt        EQU	0x00000041 ; bit:5
i2c_WRITE_00000_1_l_sspif        EQU	0x00000045 ; bit:3
i2c_WRITE_00000_1_l_bclif        EQU	0x00000046 ; bit:3
i2c_WRITE_00000_1_l_rw           EQU	0x00000042 ; bit:2
i2c_WRITE_00000_1_l_wcol         EQU	0x00000040 ; bit:7
i2c_WRITE_00000_1_l_rcen         EQU	0x00000041 ; bit:3
i2c_WRITE_00000_1_l_pen          EQU	0x00000041 ; bit:2
i2c_WRITE_00000_1_l_sen          EQU	0x00000041 ; bit:0
i2c_WRITE_00000_1_l_rsen         EQU	0x00000041 ; bit:1
i2c_WRITE_00000_1_l_acken        EQU	0x00000041 ; bit:4
i2c_WRITE_00000_1_BitMask        EQU	0x0000002B ; bytes:1
i2c_WRITE_00000_1_local_ack      EQU	0x0000002C ; bit:0
i2c_STOP_00000_1_l_scl           EQU	0x00000005 ; bit:0
i2c_STOP_00000_1_l_sda           EQU	0x00000005 ; bit:1
i2c_STOP_00000_1_l_scl_tris      EQU	0x00000085 ; bit:0
i2c_STOP_00000_1_l_sda_tris      EQU	0x00000085 ; bit:1
i2c_STOP_00000_1_l_sspif         EQU	0x00000045 ; bit:3
i2c_STOP_00000_1_l_bclif         EQU	0x00000046 ; bit:3
i2c_STOP_00000_1_l_rw            EQU	0x00000042 ; bit:2
i2c_STOP_00000_1_l_s             EQU	0x00000042 ; bit:3
i2c_STOP_00000_1_l_p             EQU	0x00000042 ; bit:4
i2c_STOP_00000_1_l_rcen          EQU	0x00000041 ; bit:3
i2c_STOP_00000_1_l_pen           EQU	0x00000041 ; bit:2
i2c_STOP_00000_1_l_sen           EQU	0x00000041 ; bit:0
i2c_STOP_00000_1_l_rsen          EQU	0x00000041 ; bit:1
i2c_STOP_00000_1_l_acken         EQU	0x00000041 ; bit:4
i2c_INIT_00000_arg_i2c_divisor   EQU	0x00000028 ; bytes:1
i2c_INIT_00000_1_i2c_SSPADD      EQU	0x00000043 ; bytes:1
i2c_INIT_00000_1_i2c_SSPSTAT     EQU	0x00000042 ; bytes:1
i2c_INIT_00000_1_i2c_SSPCON1     EQU	0x00000040 ; bytes:1
i2c_INIT_00000_1_i2c_SSPCON2     EQU	0x00000041 ; bytes:1
i2c_INIT_00000_1_l_scl           EQU	0x00000005 ; bit:0
i2c_INIT_00000_1_l_sda           EQU	0x00000005 ; bit:1
i2c_INIT_00000_1_l_scl_tris      EQU	0x00000085 ; bit:0
i2c_INIT_00000_1_l_sda_tris      EQU	0x00000085 ; bit:1
i2c_INIT_00000_1_l_sspif         EQU	0x00000045 ; bit:3
i2c_INIT_00000_1_l_bclif         EQU	0x00000046 ; bit:3
i2c_INIT_00000_1_l_sspen         EQU	0x00000040 ; bit:5
i2c_INIT_00000_1_l_smp           EQU	0x00000042 ; bit:7
delay_us_00000_arg_del           EQU	0x0000002D ; bytes:1
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
delay_us_00000
; { delay_us ; function begin
	MOVLW 0x03
	ADDWF delay_us_00000_arg_del, F
	RRF delay_us_00000_arg_del, F
	RRF delay_us_00000_arg_del, F
	MOVLW 0x7F
	ANDWF delay_us_00000_arg_del, F
label1
	NOP
	DECFSZ delay_us_00000_arg_del, F
	GOTO	label1
	RETURN
; } delay_us function end

	ORG 0x0000001A
i2c_WRITE_00000
; { i2c_WRITE ; function begin
	BCF i2c_WRITE_00000_1_l_bclif,3
	BCF i2c_WRITE_00000_1_l_sspif,3
	BCF i2c_WRITE_00000_1_l_wcol,7
	MOVF i2c_WRITE_00000_arg_i2c_data, W
	MOVWF i2c_WRITE_00000_1_i2c_SSPBUF
	BCF i2c_WRITE_00000_1_l_scl,0
	BCF i2c_WRITE_00000_1_l_sda,1
	BCF i2c_WRITE_00000_1_l_rw,2
	MOVLW 0x80
	MOVWF i2c_WRITE_00000_1_BitMask
label2
	MOVF i2c_WRITE_00000_1_BitMask, F
	BTFSC STATUS,Z
	GOTO	label7
	MOVF i2c_WRITE_00000_1_BitMask, W
	ANDWF i2c_WRITE_00000_arg_i2c_data, W
	BTFSC STATUS,Z
	GOTO	label3
	BSF STATUS, RP0
	BSF i2c_WRITE_00000_1_l_sda_tris,1
	GOTO	label4
label3
	BSF STATUS, RP0
	BCF i2c_WRITE_00000_1_l_sda_tris,1
label4
	MOVLW 0x0A
	BCF STATUS, RP0
	MOVWF delay_us_00000_arg_del
	CALL delay_us_00000
	BSF STATUS, RP0
	BSF i2c_WRITE_00000_1_l_scl_tris,0
label5
	BCF STATUS, RP0
	BTFSC i2c_WRITE_00000_1_l_scl,0
	GOTO	label6
	CLRWDT
	GOTO	label5
label6
	MOVLW 0x0A
	MOVWF delay_us_00000_arg_del
	CALL delay_us_00000
	BSF STATUS, RP0
	BCF i2c_WRITE_00000_1_l_scl_tris,0
	MOVLW 0x0A
	BCF STATUS, RP0
	MOVWF delay_us_00000_arg_del
	CALL delay_us_00000
	BCF STATUS,C
	RRF i2c_WRITE_00000_1_BitMask, F
	GOTO	label2
label7
	BSF i2c_WRITE_00000_1_l_sspif,3
	BSF i2c_WRITE_00000_1_l_acken,4
	BCF i2c_WRITE_00000_1_l_ackdt,5
	BSF STATUS, RP0
	BSF i2c_WRITE_00000_1_l_sda_tris,1
	MOVLW 0x0A
	BCF STATUS, RP0
	MOVWF delay_us_00000_arg_del
	CALL delay_us_00000
	BSF STATUS, RP0
	BSF i2c_WRITE_00000_1_l_scl_tris,0
label8
	BCF STATUS, RP0
	BTFSC i2c_WRITE_00000_1_l_scl,0
	GOTO	label9
	CLRWDT
	GOTO	label8
label9
	MOVLW 0x0A
	MOVWF delay_us_00000_arg_del
	CALL delay_us_00000
	BCF i2c_WRITE_00000_1_local_ack,0
	BTFSC i2c_WRITE_00000_1_l_sda,1
	BSF i2c_WRITE_00000_1_local_ack,0
	MOVLW 0x0A
	MOVWF delay_us_00000_arg_del
	CALL delay_us_00000
	BSF STATUS, RP0
	BCF i2c_WRITE_00000_1_l_scl_tris,0
	BCF STATUS, RP0
	BCF i2c_WRITE_00000_1_l_acken,4
	MOVLW 0x0A
	MOVWF delay_us_00000_arg_del
	CALL delay_us_00000
	CLRF CompTempVarRet548
	BTFSC i2c_WRITE_00000_1_local_ack,0
	INCF CompTempVarRet548, F
	RETURN
; } i2c_WRITE function end

	ORG 0x0000006B
i2c_STOP_00000
; { i2c_STOP ; function begin
	BCF STATUS, RP0
	BCF i2c_STOP_00000_1_l_bclif,3
	BCF i2c_STOP_00000_1_l_sspif,3
	BSF i2c_STOP_00000_1_l_pen,2
	MOVLW 0x0A
	MOVWF delay_us_00000_arg_del
	CALL delay_us_00000
	BCF i2c_STOP_00000_1_l_scl,0
	BCF i2c_STOP_00000_1_l_sda,1
	BSF STATUS, RP0
	BCF i2c_STOP_00000_1_l_scl_tris,0
	BCF i2c_STOP_00000_1_l_sda_tris,1
	MOVLW 0x0A
	BCF STATUS, RP0
	MOVWF delay_us_00000_arg_del
	CALL delay_us_00000
	BSF STATUS, RP0
	BSF i2c_STOP_00000_1_l_scl_tris,0
label10
	BCF STATUS, RP0
	BTFSC i2c_STOP_00000_1_l_scl,0
	GOTO	label11
	CLRWDT
	GOTO	label10
label11
	MOVLW 0x0A
	MOVWF delay_us_00000_arg_del
	CALL delay_us_00000
	BSF STATUS, RP0
	BSF i2c_STOP_00000_1_l_sda_tris,1
	MOVLW 0x0A
	BCF STATUS, RP0
	MOVWF delay_us_00000_arg_del
	CALL delay_us_00000
	BTFSS i2c_STOP_00000_1_l_sda,1
	GOTO	label12
	BTFSC i2c_STOP_00000_1_l_scl,0
	GOTO	label13
label12
	BSF i2c_STOP_00000_1_l_bclif,3
	BCF i2c_STOP_00000_1_l_s,3
	BCF i2c_STOP_00000_1_l_pen,2
	RETURN
label13
	BSF i2c_STOP_00000_1_l_p,4
	BCF i2c_STOP_00000_1_l_pen,2
	BCF i2c_STOP_00000_1_l_sen,0
	BCF i2c_STOP_00000_1_l_rsen,1
	BCF i2c_STOP_00000_1_l_rcen,3
	BCF i2c_STOP_00000_1_l_acken,4
	RETURN
; } i2c_STOP function end

	ORG 0x0000009A
i2c_START_00000
; { i2c_START ; function begin
	MOVLW 0x0A
	BCF STATUS, RP0
	MOVWF delay_us_00000_arg_del
	CALL delay_us_00000
	BCF i2c_START_00000_1_l_bclif,3
	BCF i2c_START_00000_1_l_sspif,3
	BSF i2c_START_00000_1_l_sen,0
	BSF STATUS, RP0
	BSF i2c_START_00000_1_l_scl_tris,0
	BSF i2c_START_00000_1_l_sda_tris,1
	BCF STATUS, RP0
	BCF i2c_START_00000_1_l_scl,0
	BCF i2c_START_00000_1_l_sda,1
	BTFSS i2c_START_00000_1_l_scl,0
	GOTO	label15
	BTFSS i2c_START_00000_1_l_sda,1
	GOTO	label15
	MOVLW 0x0A
	MOVWF delay_us_00000_arg_del
	CALL delay_us_00000
	BTFSC i2c_START_00000_1_l_scl,0
	GOTO	label14
	BSF i2c_START_00000_1_l_bclif,3
	BSF i2c_START_00000_1_l_s,3
	BCF i2c_START_00000_1_l_sen,0
	RETURN
label14
	BCF i2c_START_00000_1_l_sda,1
	BSF STATUS, RP0
	BCF i2c_START_00000_1_l_sda_tris,1
	MOVLW 0x0A
	BCF STATUS, RP0
	MOVWF delay_us_00000_arg_del
	CALL delay_us_00000
	BCF i2c_START_00000_1_l_scl,0
	BSF STATUS, RP0
	BCF i2c_START_00000_1_l_scl_tris,0
	MOVLW 0x0A
	BCF STATUS, RP0
	MOVWF delay_us_00000_arg_del
	CALL delay_us_00000
	BSF i2c_START_00000_1_l_s,3
	BCF i2c_START_00000_1_l_sen,0
	BSF i2c_START_00000_1_l_sspif,3
	RETURN
label15
	BSF i2c_START_00000_1_l_bclif,3
	BSF i2c_START_00000_1_l_s,3
	BCF i2c_START_00000_1_l_sen,0
	BCF i2c_START_00000_1_l_rsen,1
	BCF i2c_START_00000_1_l_pen,2
	BCF i2c_START_00000_1_l_rcen,3
	BCF i2c_START_00000_1_l_acken,4
	RETURN
; } i2c_START function end

	ORG 0x000000CE
ds3231Writ_00013
; { ds3231Write ; function begin
	CALL i2c_START_00000
	MOVLW 0xD0
	MOVWF i2c_WRITE_00000_arg_i2c_data
	CALL i2c_WRITE_00000
	MOVF ds3231Writ_00013_arg_ds3231Reg, W
	MOVWF i2c_WRITE_00000_arg_i2c_data
	CALL i2c_WRITE_00000
	MOVF ds3231Writ_00013_arg_byteOut, W
	MOVWF i2c_WRITE_00000_arg_i2c_data
	CALL i2c_WRITE_00000
	CALL i2c_STOP_00000
	RETURN
; } ds3231Write function end

	ORG 0x000000DA
i2c_INIT_00000
; { i2c_INIT ; function begin
	BSF STATUS, RP0
	BSF i2c_INIT_00000_1_l_sda_tris,1
	BSF i2c_INIT_00000_1_l_scl_tris,0
	BCF STATUS, RP0
	CLRF i2c_INIT_00000_1_i2c_SSPCON1
	MOVF i2c_INIT_00000_arg_i2c_divisor, W
	MOVWF i2c_INIT_00000_1_i2c_SSPADD
	MOVLW 0x08
	MOVWF i2c_INIT_00000_1_i2c_SSPCON1
	CLRF i2c_INIT_00000_1_i2c_SSPCON2
	CLRF i2c_INIT_00000_1_i2c_SSPSTAT
	BSF i2c_INIT_00000_1_l_smp,7
	BCF i2c_INIT_00000_1_l_sspif,3
	BCF i2c_INIT_00000_1_l_bclif,3
	BCF i2c_INIT_00000_1_l_sda,1
	BCF i2c_INIT_00000_1_l_scl,0
	BSF i2c_INIT_00000_1_l_sspen,5
	CALL i2c_STOP_00000
	RETURN
; } i2c_INIT function end

	ORG 0x000000ED
ds3231Writ_00015
; { ds3231WriteDate ; function begin
	CALL i2c_START_00000
	MOVLW 0xD0
	MOVWF i2c_WRITE_00000_arg_i2c_data
	CALL i2c_WRITE_00000
	CLRF i2c_WRITE_00000_arg_i2c_data
	CALL i2c_WRITE_00000
	CLRF i2c_WRITE_00000_arg_i2c_data
	CALL i2c_WRITE_00000
	CLRF i2c_WRITE_00000_arg_i2c_data
	CALL i2c_WRITE_00000
	CLRF i2c_WRITE_00000_arg_i2c_data
	CALL i2c_WRITE_00000
	MOVLW 0x01
	MOVWF i2c_WRITE_00000_arg_i2c_data
	CALL i2c_WRITE_00000
	MOVLW 0x01
	MOVWF i2c_WRITE_00000_arg_i2c_data
	CALL i2c_WRITE_00000
	CLRF i2c_WRITE_00000_arg_i2c_data
	CALL i2c_WRITE_00000
	CALL i2c_STOP_00000
	RETURN
; } ds3231WriteDate function end

	ORG 0x00000103
ds3231Init_00000
; { ds3231Init ; function begin
	MOVLW 0x0E
	BCF STATUS, RP0
	MOVWF ds3231Writ_00013_arg_ds3231Reg
	MOVLW 0x80
	MOVWF ds3231Writ_00013_arg_byteOut
	CALL ds3231Writ_00013
	MOVLW 0x0F
	MOVWF ds3231Writ_00013_arg_ds3231Reg
	MOVLW 0x80
	MOVWF ds3231Writ_00013_arg_byteOut
	CALL ds3231Writ_00013
	RETURN
; } ds3231Init function end

	ORG 0x0000010F
initialise_00000
; { initialise ; function begin
	CALL 0x000003FF
	BCF STATUS, RP0
	BSF gbl_status,5
	BSF STATUS, RP0
	MOVWF gbl_osccal
	BCF STATUS, RP0
	BCF gbl_status,5
	MOVLW 0x2B
	BSF STATUS, RP0
	MOVWF gbl_trisio
	MOVLW 0x08
	BCF STATUS, RP0
	MOVWF gbl_gpio
	BSF STATUS, RP0
	CLRF gbl_ansel
	MOVLW 0x07
	BCF STATUS, RP0
	MOVWF gbl_cmcon
	MOVLW 0x11
	BSF STATUS, RP0
	MOVWF gbl_option_reg
	MOVLW 0x3D
	BCF STATUS, RP0
	MOVWF gbl_tmr0
	MOVLW 0x06
	MOVWF gbl_t1con
	MOVLW 0xFF
	MOVWF gbl_tmr1h
	MOVWF gbl_tmr1l
	BSF STATUS, RP0
	BSF gbl_pie1,0
	BSF gbl_ioc,3
	BCF STATUS, RP0
	BSF gbl_intcon,3
	CLRF gbl_cTask
	CLRF gbl_iDebounceCounter
	CLRF gbl_iSetTime
	CLRF gbl_iSec
	CLRF gbl_iMin
	MOVLW 0x01
	MOVWF i2c_INIT_00000_arg_i2c_divisor
	BCF PCLATH,3
	BCF PCLATH,4
	CALL i2c_INIT_00000
	CALL ds3231Writ_00015
	CALL ds3231Init_00000
	BSF gbl_intcon,7
	BSF gbl_intcon,6
	RETURN
; } initialise function end

	ORG 0x00000140
ds3231Stop_00000
; { ds3231Stop ; function begin
	MOVLW 0x0F
	BCF STATUS, RP0
	MOVWF ds3231Writ_00013_arg_ds3231Reg
	MOVLW 0x80
	MOVWF ds3231Writ_00013_arg_byteOut
	CALL ds3231Writ_00013
	RETURN
; } ds3231Stop function end

	ORG 0x00000147
ds3231Star_00014
; { ds3231Start ; function begin
	MOVLW 0x0F
	BCF STATUS, RP0
	MOVWF ds3231Writ_00013_arg_ds3231Reg
	CLRF ds3231Writ_00013_arg_byteOut
	CALL ds3231Writ_00013
	RETURN
; } ds3231Start function end

	ORG 0x0000014D
main
; { main ; function begin
	CALL initialise_00000
label16
	BTFSS gbl_cTask,0
	GOTO	label17
	MOVLW 0x3D
	MOVWF gbl_tmr0
	BSF gbl_intcon,5
	BCF gbl_cTask,0
	GOTO	label21
label17
	BTFSS gbl_cTask,1
	GOTO	label21
	DECF gbl_iDebounceCounter, W
	BTFSS STATUS,Z
	GOTO	label19
	BTFSC gbl_gpio,3
	GOTO	label19
	MOVF gbl_iSetTime, F
	BTFSS STATUS,Z
	GOTO	label18
	MOVLW 0x01
	MOVWF gbl_iSetTime
	CALL ds3231Star_00014
	BSF gbl_gpio,4
	BSF gbl_gpio,2
	BSF gbl_t1con,0
	GOTO	label20
label18
	CLRF gbl_iSetTime
	BCF gbl_gpio,4
	BCF gbl_gpio,2
	CLRF gbl_iSec
	CLRF gbl_iMin
	BCF gbl_t1con,0
	CALL ds3231Stop_00000
	GOTO	label20
label19
	MOVF gbl_iDebounceCounter, W
	SUBLW 0x02
	BTFSC STATUS,C
	GOTO	label20
	BTFSS gbl_gpio,3
	GOTO	label20
	BSF gbl_intcon,3
	BCF gbl_intcon,5
	CLRF gbl_iDebounceCounter
label20
	BCF gbl_cTask,1
label21
	BTFSS gbl_cTask,2
	GOTO	label23
	MOVF gbl_gpio, W
	XORLW 0x10
	MOVWF gbl_gpio
	MOVF gbl_iSetTime, W
	SUBWF gbl_iMin, W
	BTFSS STATUS,C
	GOTO	label22
	BCF gbl_gpio,2
	CLRF gbl_iSec
	CLRF gbl_iMin
	CLRF gbl_iSetTime
	BCF gbl_gpio,4
	BCF gbl_t1con,0
	CALL ds3231Stop_00000
label22
	BCF gbl_cTask,2
label23
	BTFSC gbl_t1con,0
	GOTO	label16
	BTFSC gbl_intcon,5
	GOTO	label16
	BSF gbl_intcon,3
	SLEEP
	NOP
	GOTO	label16
; } main function end

	ORG 0x00000191
_startup
	BCF PCLATH,3
	BCF PCLATH,4
	GOTO	main
	ORG 0x00000194
interrupt
; { interrupt ; function begin
	BCF STATUS, RP0
	BTFSS gbl_intcon,0
	GOTO	label25
	BTFSS gbl_intcon,3
	GOTO	label25
	BSF gbl_cTask,0
	MOVF gbl_gpio, W
	MOVWF interrupt_2_readgpio
	BCF gbl_intcon,0
	BCF gbl_intcon,3
label25
	BTFSS gbl_intcon,2
	GOTO	label26
	BTFSS gbl_intcon,5
	GOTO	label26
	MOVLW 0x3D
	MOVWF gbl_tmr0
	INCF gbl_iDebounceCounter, F
	BCF gbl_intcon,2
	BSF gbl_cTask,1
label26
	BTFSS gbl_pir1,0
	GOTO	label28
	BSF STATUS, RP0
	BTFSS gbl_pie1,0
	GOTO	label28
	MOVLW 0xFF
	BCF STATUS, RP0
	MOVWF gbl_tmr1h
	MOVWF gbl_tmr1l
	INCF gbl_iSec, F
	MOVLW 0x3C
	SUBWF gbl_iSec, W
	BTFSS STATUS,C
	GOTO	label27
	INCF gbl_iMin, F
	CLRF gbl_iSec
label27
	BCF gbl_pir1,0
	BSF gbl_cTask,2
label28
	BCF STATUS, RP0
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
	DW 0x3FC4
	END
