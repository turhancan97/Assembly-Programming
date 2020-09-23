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
	 NUMBER1.1 EQU 0XFF ; first lower
	 NUMBER1.2 EQU 0X7F ; first higher
	 NUMBER2.1 EQU 0XFF ; second lower
	 NUMBER2.2 EQU 0X7F ; second higher

	 RESULT_4  EQU 0X10 ; MSB
	 RESULT_3  EQU 0X11 ; 2.bit
	 RESULT_2  EQU 0X12 ; 3.bit
	 RESULT_1  EQU 0X13 ; LSB
	
	 
  
  
         MOVLW NUMBER1.1 ; 1st low byte moved to wreg
	 MULLW NUMBER2.1 ; 2nd x 1st low byte
	  
	 MOVFF PRODL,RESULT_1 ; result of low byte is directly to lowest byte
	 MOVFF PRODH,0X20 ; result of higher byte is at 0x20 loc.
	 
	 MOVLW NUMBER1.2 ; 1st higher byte moved to wreg
	 MULLW NUMBER2.1 ; 2nd low byte x 1st high byte
	 
	 MOVFF PRODL,0X22 ; result of low byte is at 0x22
	 MOVFF PRODH,0X21 ; result of high byte is 0x21
	 
	 MOVLW NUMBER1.1 ; 1st lower byte moved to wreg
	 MULLW NUMBER2.2 ; 1st low byte x 2nd high byte
	 
	 MOVFF PRODL,0X24  ; result of low byte is at 0x24
	 MOVFF PRODH,0X23  ; result of high byte is 0x23
	 
	 MOVLW NUMBER1.2 ; 1st higher byte moved to wreg
	 MULLW NUMBER2.2 ; 1st high byte x 2nd high byte
	 
	 MOVFF PRODL,0X25 ; result of low byte is at 0x25
	 MOVFF PRODH,RESULT_4  ; result of high byte is directly to highest byte
	 
	 ; Summing numbers and carry controls
	 MOVF 0X22,0 
	 ADDWF 0X24,F ; adding location 22h and location 24h
	 BNC NO_CARRY0
	 INCF 0x21,F ; ?f carry exist, +1
NO_CARRY0 MOVF 0X21,0
	 ADDWF 0X23,F ; adding location 21h and location 23h
	 BNC NO_CARRY1
	 INCF RESULT_4,F ; ?f carry exist, +1
	 
NO_CARRY1 MOVF 0X20,0
	 ADDWFC 0X24,F ; adding location 20h and location 24h
	 BNC NO_CARRY2
	 INCF 0x25,F ; ?f carry exist, +1
NO_CARRY2 MOVF 0X25,0
	 ADDWF 0X23,F ; adding location 25h and location 23h
	 BNC NO_CARRY3
	 INCF RESULT_4,F ; ?f carry exist, +1
	 
NO_CARRY3 MOVFF 0X23,RESULT_3 ; moving result location
	  MOVFF 0X24,RESULT_2 ; moving result location
	  
	END


