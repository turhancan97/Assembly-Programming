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
	 
	 org 0h ; Used to indicate the beginning of the adress which is '00000000'
	 movlw 0x00 ;to make wreg 0
	 movwf 0x35 ; we came to 35H adress
	 movlw 0x15 ; wreg is 15H
	 addwf 0x35, F ; we add 15H to address of 35H
	 movlw b'11011001' ; wreg is b'11011001'
	 addwf 0x35, F ; we add b'11011001' to address of 35H 
	 movlw .16 ; wreg is 16 Decimal
	 addwf 0x35, F ; we add D'16' to address of 35H and all summation is done in 35H
	 movf 0x35, 0 ; we moved summantion to wreg
	 movwf 0x36 ; we moved to 36H adress
	 INCF 0x36, F ; increment
	 movf 0x36, 0 ; we moved summantion to wreg
	 movwf 0x37 ; we moved to 37H adress and saved it
	 decf 0x37, F ; decrement
	 end
	 
	 
	 