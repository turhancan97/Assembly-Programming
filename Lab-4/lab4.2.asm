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
COUNTREG    EQU 0X00 ; Define steps
CNTVAL	    EQU D'3' 
	    
	    MOVLW CNTVAL ; How many numbers to sum
	    MOVWF COUNTREG
	    
	    CLRF 0X90 ; Clearing locations
	    CLRF 0X91
	    CLRF WREG
	    CLRF 0X50
	    CLRF 0X51
	    CLRF 0X52
 
	    LFSR 0,0X10 ; Pointer for 10h locs
	    LFSR 1,0X30 ; Pointer for 30h locs
	    LFSR 2,0X50 ; Pointer for 50h locs
	    
	    
TURHAN	    MOVLW 0X00 ; W=0
	    MOVWF 0X90 ; 0x90 loc = 0
	    MOVWF 0X91 ; 0x91 loc = 0
	    BCF STATUS,C ; Clear carry
	    MOVF POSTINC0,W ; move 10h loc to wreg and increase
	    ADDWF POSTINC1,W ; add wreg to loc 30h and increase 
	    MOVWF POSTINC2 ; move wreg to loc 50h and increase
	    BNC OVER ; Check carry 
	    INCF 0X90,F ; If C = 1 increment loc 90h
OVER	    MOVF POSTINC0,W ; move 11h loc to wreg and increase
	    ADDWF POSTINC1,W ; add wreg to loc 31h and increase 
	    MOVWF INDF2 ; move wreg to loc 51h and stay the same
	    BNC OVER2 ; Check carry 
	    INCF 0X91,F ; If C = 1 increment loc 0x91
	    
OVER2	    MOVF 0X90,W ; Here for adding carries to bytes
	    ADDWF POSTINC2,F
	    MOVF 0X91,W
	    ADDWF POSTINC2,F
	    DECF COUNTREG,F
	    BNZ TURHAN
	    END

