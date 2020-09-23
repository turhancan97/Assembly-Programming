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
	 
	 
INPUT	 equ 0x00 ; DEFINE LOCATIONS
H_BYTE	 equ 0x10
L_BYTE	 equ 0x11
C_Cont1	 equ 0x30
C_Cont2	 equ 0x31
	 
	 org 0h
	 CLRF H_BYTE
	 CLRF C_Cont1
	 CLRF C_Cont2
	 CLRF L_BYTE
	 CLRF 0X01
	 
	 MOVLW 0X24 ; INPUT VALUE
	 MOVWF INPUT
	 
	 decf INPUT,F
	 decf INPUT,F
	 
	
         MOVLW .1 ; move wreg 1
	 MOVWF 0X01 ; First number is 1
	 MOVWF L_BYTE ; Second number is 1
LOOP	 BCF STATUS,0 ; clear carry
	 ADDWF 0X01,W ; sum first and second number 
	 MOVWF 0X03   ; send summat?on to 0x03 location
	 MOVFF L_BYTE,0X01 ; second number = first number
	 MOVFF 0X03,L_BYTE ; summation = second number
	 
	 movf C_Cont1,W ; For carries
	 addwfc C_Cont2,W
	 movff C_Cont1,C_Cont2
	 movwf C_Cont1
	 movff C_Cont1,H_BYTE ; we moved carries to H_BYTE
	 
	 MOVF L_BYTE,W ; move second number to wreg
	 
	 DECF INPUT ; loop input times
	 BNZ LOOP
	 
	 END