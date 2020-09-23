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
	 
	 
	    org 0h
COUNTREG    EQU 0X00 ; Define processes
CNTVAL	    EQU D'5'  
COUNTREG1   EQU 0X10
L_BYTE      EQU 0X16 
H_BYTE      EQU 0X15
CNTVAL1     EQU 0X0A
NUM         EQU 0X52
MYQ         EQU 0X50
	    
	    MOVLW CNTVAL ; for looping
	    MOVWF COUNTREG
	    
	    LFSR 0,0X20 ; Pointer for 0x20
	    LFSR 2,0X60 ; Pointer for 0x60
	    
	    
TURHAN	    MOVFF POSTINC0,POSTINC2 ; Here we saved the numbers from loc 20-24 to 60-64
	    DECF COUNTREG,F
	    BNZ TURHAN	    
	    
	    MOVLW CNTVAL ; Loop
	    MOVWF COUNTREG
	    LFSR 1,0X30 ; Pointer for 0x30
	    LFSR 2,0X70 ; Pointer for 0x70
	    
	    
TURHAN1	    MOVFF POSTINC1,POSTINC2 ; Here we saved the numbers from loc 30-34 to 70-74
	    DECF COUNTREG,F
	    BNZ TURHAN1
	    
	    
	    LFSR 2,0X60 ; Pointer for 0x60
	    LFSR 1,0X70 ; Pointer for 0x70
	    LFSR 0,0X20 ; Pointer for 0x20
	    
	    MOVFF POSTINC2,POSTINC0 ; Here we put the numbers from 0x60-0x64 and 0x70-0x74
	    MOVFF POSTINC1,POSTINC0 ; to loc 0x20-0x29
	    MOVFF POSTINC2,POSTINC0
	    MOVFF POSTINC1,POSTINC0
	    MOVFF POSTINC2,POSTINC0
	    MOVFF POSTINC1,POSTINC0
	    MOVFF POSTINC2,POSTINC0
	    MOVFF POSTINC1,POSTINC0
	    MOVFF POSTINC2,POSTINC0
	    MOVFF POSTINC1,POSTINC0 
	 
	    MOVLW CNTVAL1  ; Loop
            MOVWF COUNTREG1 
            LFSR 0,0X20    ; Pointer for 0x20
            CLRF WREG      ; W=0
	    CLRF H_BYTE    ; Clear High Byte
B5          ADDWF POSTINC0, W ; Here is to sum all numbers in loc 0x20 - 0x29
	    BNC OVER
	    INCF H_BYTE,F
OVER	    DECF COUNTREG1,F
	    BNZ B5
	    MOVWF L_BYTE
	 
	    CLRF MYQ ; Here is for taking average of these numbers
	    MOVFF L_BYTE, NUM
      	    MOVLW CNTVAL1
B9          INCF MYQ, F
            SUBWF NUM,F
            BC B9
	    DECF MYQ,F
	    END