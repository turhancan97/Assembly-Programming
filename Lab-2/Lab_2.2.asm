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
	 ;initialization steps
	 BANKSEL ANSELD	
	 CLRF ANSELD
	 CLRF TRISD ; portd is output
	 BANKSEL ANSELB
	 CLRF ANSELB
	 CLRF TRISB ; portd is output
	 BANKSEL ANSELC	
	 CLRF ANSELC
	 CLRF TRISC ; portdc is output
LOOP	 MOVLW 0X55 ; wreg = 55h
	 MOVWF PORTB ; put 55h on port b pins
	 MOVWF PORTC ; put 55h on port c pins
	 MOVWF PORTD ; put 55h on port d pins
	 CALL DELAY ; putting delay
	 MOVLW 0XAA ; wreg = AAh
	 MOVWF PORTB ; put AAh on port b pins
	 MOVWF PORTC ; put AAh on port c pins
	 MOVWF PORTD ; put AAh on port d pins
	 CALL DELAY ; putting delay
	 GOTO LOOP ; for infinite loop
	;-----------delay subroutine
DELAY	 MOVLW .15 ; first loop is starting
	 MOVWF 0x01 ; 0x01 is 15	
LOOP_3	 MOVLW .255 ; second loop starts	
	 MOVWF 0x02 ; 0x02 is 255
LOOP_2	 MOVLW .255 ; third loop starts
	 MOVWF 0x03 ; 0x02 is 255
LOOP_1	 NOP ; wasting 1 us 2 times
	 NOP
	 DECF  0x03,F ; repeat until 0x03 is zero
	 BNZ LOOP_1
	 DECF 0x02,F ; repeat until 0x02 is zero
	 BNZ LOOP_2
	 DECF 0x01,F ; repeat until 0x01 is zero
	 BNZ LOOP_3
	 RETURN ; return to caller
	 END ; end of asm file


