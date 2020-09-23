list P=18F45K22, r=dec, n=0
     #include <P18F45K22.INC>

     ;   /* setup to use the 4xPLL with a 16MHz internal oscillator for a 64MHz system clock */

         config FOSC = INTIO67       ;/* Internal oscillator block, port function on RA6 and RA7          */
         config PLLCFG = ON          ;/* Oscillator multiplied by 4                                       */
         config PRICLKEN = ON        ;/* Primary clock is always enabled                                  */
         config HFOFST = OFF         ;/* HFINTOSC delayed by the oscillator stable status                 */
         config FCMEN = OFF          ;/* Fail-Safe Clock Monitor disabled                                 */
         config IESO = ON            ;/* Oscillator Switchover mode enabled                               */
         config PWRTEN = ON          ;/* Power up timer enabled                                           */
         config BOREN = OFF          ;/* Brown-out Reset disabled in hardware and software                */
         config BORV = 190           ;/* VBOR set to 1.90 V nominal                                       */
                                     ;
         config WDTEN = OFF          ;/* Watch dog timer is always disabled. SWDTEN has no effect.        */
         config WDTPS = 32768        ;/* 1:32768                                                          */
         config CCP2MX = PORTC1      ;/* CCP2 input/output is multiplexed with RC1                        */
         config CCP3MX = PORTB5      ;/* P3A/CCP3 input/output is multiplexed with RB5                    */
         config PBADEN = OFF         ;/* PORTB<5:0> pins are configured as digital I/O on Reset           */
         config T3CMX = PORTC0       ;/* T3CKI is on RC0                                                  */
         config P2BMX = PORTC0       ;/* P2B is on RC0                                                    */
         config LVP = OFF            ;/* Single-Supply ICSP disabled                                      */
         config STVREN = ON          ;/* Stack full/underflow will cause Reset                            */
         config MCLRE = INTMCLR      ;/* RE3 input pin enabled; MCLR disabled                             */
         config XINST = OFF          ;/* Instruction set extension and Indexed Addressing mode disabled   */

     ;   /* Turn off all code protection */
         config CP0   = OFF, CP1   = OFF, CP2   = OFF, CP3   = OFF, CPB   = OFF, CPD   = OFF
         config WRT0  = OFF, WRT1  = OFF, WRT2  = OFF, WRT3  = OFF, WRTB  = OFF, WRTC  = OFF
         config EBTR0 = OFF, EBTR1 = OFF, EBTR2 = OFF, EBTR3 = OFF, EBTRB = OFF
	 
	 
	 org 0000H ; burn into ROM starting at 0
	 
	 ;Turhan Can
	 MOVLW 0X00 ; Wreg = 0 Look-?p table low-byte addr
	 MOVWF TBLPTRL ; Look-up table low-byte addr
	 MOVLW 0X04 ; Wreg = 5 look-up table high-byte addr
	 MOVWF TBLPTRH ; Look-up table high-byte addr
	 TBLRD* ; TABLAT = 'T' char pointed to TABPTR
	 MOVFF TABLAT,0x00 ; Send it to loc 0x00
	 INCF TBLPTRL,F ; TBLPTRL = 01 pointing to next (401)
	 TBLRD* ; TABLAT = 'U' char pointed to TABPTR
	 MOVFF TABLAT,0x01 ; Send it to loc 0x01
	 INCF TBLPTRL,F ; TBLPTRL = 02 pointing to next (402)
	 TBLRD* ; TABLAT = 'R' char pointed to TABPTR
	 MOVFF TABLAT,0x02 ; Send it to loc 0x02
	 INCF TBLPTRL,F ; TBLPTRL = 03 pointing to next (403)
	 TBLRD* ; TABLAT = 'H' char pointed to TABPTR
	 MOVFF TABLAT,0x03 ; Send it to loc 0x03
	 INCF TBLPTRL,F ; TBLPTRL = 04 pointing to next (404)
	 TBLRD* ; TABLAT = 'A' char pointed to TABPTR
	 MOVFF TABLAT,0x04 ; Send it to loc 0x04
	 INCF TBLPTRL,F ; TBLPTRL = 05 pointing to next (405)
	 TBLRD* ; TABLAT = 'N' char pointed to TABPTR
	 MOVFF TABLAT,0x05 ; Send it to loc 0x05
	 INCF TBLPTRL,F ; TBLPTRL = 06 pointing to next (406)
	 TBLRD* ; TABLAT = ' ' char pointed to TABPTR
	 MOVFF TABLAT,0x06 ; Send it to loc 0x06
	 INCF TBLPTRL,F ; TBLPTRL = 07 pointing to next (407)
	 TBLRD* ; TABLAT = ' ' char pointed to TABPTR
	 MOVFF TABLAT,0x07 ; Send it to loc 0x07
	 INCF TBLPTRL,F ; TBLPTRL = 08 pointing to next (408)
	 TBLRD* ; TABLAT = 'C' char pointed to TABPTR
	 MOVFF TABLAT,0x08 ; Send it to loc 0x08
	 INCF TBLPTRL,F ; TBLPTRL = 09 pointing to next (409)
	 TBLRD* ; TABLAT = 'A' char pointed to TABPTR
	 MOVFF TABLAT,0x09 ; Send it to loc 0x09
	 INCF TBLPTRL,F ; TBLPTRL = 10 pointing to next (410)
	 TBLRD* ; TABLAT = 'N' char pointed to TABPTR
	 MOVFF TABLAT,0x0A ; Send it to loc 0x0A
	 
	 ;Kargin
	 MOVLW 0X10
	 MOVWF TBLPTRL
	 MOVLW 0X04
	 MOVWF TBLPTRH
	 TBLRD*
	 MOVFF TABLAT,0x10
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x11
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x12
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x13
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x14
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x15
	 
	 ;Student
	 MOVLW 0X20
	 MOVWF TBLPTRL
	 MOVLW 0X04
	 MOVWF TBLPTRH
	 TBLRD*
	 MOVFF TABLAT,0x20
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x21
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x22
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x23
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x24
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x25
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x26
	 
	 
	 ;E.E.E
	 MOVLW 0X30
	 MOVWF TBLPTRL
	 MOVLW 0X04
	 MOVWF TBLPTRH
	 TBLRD*
	 MOVFF TABLAT,0x30
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x31
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x32
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x33
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x34
	 
	 ;I.K.C.U
	 MOVLW 0X40
	 MOVWF TBLPTRL
	 MOVLW 0X04
	 MOVWF TBLPTRH
	 TBLRD*
	 MOVFF TABLAT,0x40
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x41
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x42
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x43
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x44
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x45
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x46
	 
	 ;Logo
	 MOVLW 0X50
	 MOVWF TBLPTRL
	 MOVLW 0X04
	 MOVWF TBLPTRH
	 TBLRD*
	 MOVFF TABLAT,0x50
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x51
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x52
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x53
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x54
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x55
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x56
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x57
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x58
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x59
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x5A
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x5B
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x5C
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x5D
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x5E
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x5F
	 
	 
	 
	 
	 
	 
	 MOVLW 0X60
	 MOVWF TBLPTRL
	 MOVLW 0X04
	 MOVWF TBLPTRH
	 TBLRD*
	 MOVFF TABLAT,0x60
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x61
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x62
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x63
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x64
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x65
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x66
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x67
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x68
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x69
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x6A
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x6B
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x6C
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x6D
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x6E
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x6F
	 
	 
	 
	 MOVLW 0X70
	 MOVWF TBLPTRL
	 MOVLW 0X04
	 MOVWF TBLPTRH
	 TBLRD*
	 MOVFF TABLAT,0x70
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x71
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x72
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x73
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x74
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x75
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x76
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x77
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x78
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x79
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x7A
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x7B
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x7C
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x7D
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x7E
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x7F
	 
	 
	 
	 MOVLW 0X80
	 MOVWF TBLPTRL
	 MOVLW 0X04
	 MOVWF TBLPTRH
	 TBLRD*
	 MOVFF TABLAT,0x80
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x81
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x82
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x83
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x84
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x85
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x86
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x87
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x88
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x89
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x8A
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x8B
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x8C
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x8D
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x8E
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x8F
	 
	 
	 
	 
	 MOVLW 0X90
	 MOVWF TBLPTRL
	 MOVLW 0X04
	 MOVWF TBLPTRH
	 TBLRD*
	 MOVFF TABLAT,0x90
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x91
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x92
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x93
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x94
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x95
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x96
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x97
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x98
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x99
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x9A
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x9B
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x9C
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x9D
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x9E
	 INCF TBLPTRL,F
	 TBLRD*
	 MOVFF TABLAT,0x9F
HERE     GOTO HERE
	 
	 
	 ;Data is burned into code space starting at 400H
	ORG 400H
MYDATA  DB "TURHAN  CAN"
	ORG 410H
MYDATA1 DB "KARGIN"
	ORG 420H
MYDATA2 DB "STUDENT"
	ORG 430H
MYDATA3 DB "E.E.E"
	ORG 440H
MYDATA4 DB "I.K.C.U"
	ORG 450H
MYDATA5 DB ".------. -------"
        ORG 460H
MYDATA6 DB "|.    .||       "
	ORG 470H
MYDATA7 DB "   ||   |       "
	ORG 480H
MYDATA8 DB "   ||   |       "
	ORG 490H
MYDATA9 DB "   ||    -------"
	END

