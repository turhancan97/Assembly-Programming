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
	 BANKSEL ANSELC	;initialization steps
	 CLRF ANSELC
	 BANKSEL ANSELB
	 CLRF ANSELB
	 BANKSEL ANSELA
	 CLRF ANSELA
	 CLRF TRISC	;make PORTC output
	 CLRF TRISB	;make PORTB output
	 SETF TRISA	;set PORTA as input
	 
COUNT1	 EQU 0X25 ; COUNT1 = 25H
   
	; FIRST PART   
	
Start	 movlw B'00000000' ; WREG = 00000000
	 movwf PORTB	; SET PORTB '00000000'
	 movwf PORTC	; SET PORTB '00000000'
	 CALL DELAY	; DELAY
	 BTFSC PORTA,0  ; checking portc RA0 pin 
	 BRA AGAIN      ; if it is SET go to AGAIN, otherwise continue
	 BTFSC PORTA,1  ; checking portc RA1 pin 
	 BRA AGAIN2     ; if it is SET go to AGAIN2, otherwise continue
	 BTFSC PORTA,2  ; checking portc RA2 pin 
	 BRA AGAIN3     ; if it is SET go to AGAIN3, otherwise continue
	 
	 MOVLW .8 ; we have 8 leds and bits for port
	 MOVWF COUNT1 
LOP1	 RRCF PORTB ; For rotating 8 times from left to right
	 BSF STATUS, C ; C=1
	 RLCF PORTC ; For rotating 8 times from right to left
	 BSF STATUS, C ; C=1
	 CALL DELAY
	 DECF COUNT1 ; setting 8 times 
	 BNZ LOP1 
	 
	 MOVLW .8
	 MOVWF COUNT1
LOP2	 BCF STATUS, C ;C=0
	 RRCF PORTB ;rotate PORTB 8 times to right
	 BCF STATUS, C ;C=0
	 RLCF PORTC ;rotate PORTC 8 times to LEFT
	 BCF STATUS, C ;C=0
	 CALL DELAY
	 DECF COUNT1
	 BNZ LOP2
	 
	 MOVLW .8
	 MOVWF COUNT1
LOP3	 BSF STATUS, C ;C=1
	 RLCF PORTB ;rotate portB 8 times to LEFT
	 BSF STATUS, C ;C=1
	 RRCF PORTC ;rotate portC 8 times to RIGHT
	 BSF STATUS, C ;C=1
	 CALL DELAY
	 DECF COUNT1
	 BNZ LOP3
	 
	 
	 MOVLW .8
	 MOVWF COUNT1
LOP4	 BCF STATUS, C ;C=1
	 RLCF PORTB ;rotate portB 8 times to LEFT
	 BCF STATUS, C ;C=1
	 RRCF PORTC ;rotate portC 8 times to RIGHT
	 BCF STATUS, C ;C=1
	 CALL DELAY
	 DECF COUNT1
	 BNZ LOP4
	 GOTO Start ; go to begining of this part
	
	; SECOND PART
	
AGAIN	 BTFSS PORTA,0   ; checking portc RA0 pin 
	 BRA Start       ; if it is RESET go to START, otherwise continue
	 movlw B'00000001' ;set PORTC 00000001
	 movwf PORTC	;light it with delay
	 CALL DELAY
	 
	 MOVLW .7
	 MOVWF COUNT1
LOP5	 RLNCF PORTC ; rotate portb 7 times to left
	 CALL DELAY  ; with delay
	 DECF COUNT1
	 BNZ LOP5
	 CLRF PORTC ; PORTC is 00000000
	 CALL DELAY
	 MOVLW B'00000001' ; start lighting portb with delay
	 MOVWF PORTB
	 CALL DELAY
	 
	 MOVLW .7
	 MOVWF COUNT1
LOP6	 RLNCF PORTB   ; rotate portb 7 times to left
	 CALL DELAY    ; with delay
	 DECF COUNT1
	 BNZ LOP6
	 MOVLW B'10000000'
	 MOVWF PORTB
	 
	 MOVLW .7
	 MOVWF COUNT1
LOP7	 RRNCF PORTB   ; rotate portb 7 times to right
	 CALL DELAY    ; with delay
	 DECF COUNT1
	 BNZ LOP7
	 CALL DELAY
	 CLRF PORTB
	 MOVLW B'10000000' 
	 MOVWF PORTC
	 CALL DELAY 
	 
	 MOVLW .7
	 MOVWF COUNT1
LOP8	 RRNCF PORTC   ; rotate portb 7 times to right
	 CALL DELAY    ; with delay
	 DECF COUNT1
	 BNZ LOP8
	 GOTO AGAIN    ; go to begining of this part
	 
	;THIRD PART
	 
AGAIN2   BTFSS PORTA,1   ;checking portc RA1 pin 
	 BRA Start       ; if it is RESET go to START, otherwise continue
	 MOVLW .8
	 MOVWF COUNT1
LOP9	 RLCF PORTC    ; rotate portB 7 times to LEFT
	 BSF STATUS, C ; C=1
	 CALL DELAY    ; with delay
	 DECF COUNT1
	 BNZ LOP9 
	 
	 MOVLW .8
	 MOVWF COUNT1
LOP10	 RLCF PORTB    ; rotate portB 7 times to LEFT
	 BSF STATUS, C ; C=1
	 CALL DELAY    ; with delay
	 DECF COUNT1
	 BNZ LOP10
	 
	 MOVLW .8
	 MOVWF COUNT1
LOP11	 BCF STATUS, C ; C=0
	 RRCF PORTB    ; rotate portB 7 times to RIGHT
	 CALL DELAY    ; with delay
	 DECF COUNT1
	 BNZ LOP11
	 
	 MOVLW .8
	 MOVWF COUNT1
LOP12	 BCF STATUS, C ; C=0
	 RRCF PORTC    ; rotate portB 7 times to right
	 CALL DELAY    ; with delay
	 DECF COUNT1
	 BNZ LOP12
	 GOTO AGAIN2  ; go to beginig of this part
	 
	;FORTH PART
	
AGAIN3   BTFSS PORTA,2   ; checking portc RA2 pin 
	 BRA Start       ; if it is RESET go to START, otherwise continue
	 
         MOVLW .8
	 MOVWF COUNT1
LOP13	 BSF STATUS, C ; C=1
	 RLCF PORTB    ; rotate portB 8 times to LEFT
	 BSF STATUS, C ; C=1
	 RRCF PORTC    ; rotate portC 8 times to RIGHT
	 BSF STATUS, C ; C=1
	 CALL DELAY
	 DECF COUNT1
	 BNZ LOP13
	 
	 
	 MOVLW .7
	 MOVWF COUNT1
LOP14	 BCF STATUS, C   ; C=0
	 RRCF PORTB      ; rotate portB 7 times to RIGHT
	 BCF STATUS, C   ; C=0
	 RLCF PORTC      ; rotate portC 7 times to LEFT
	 BCF STATUS, C   ; C=0
	 CALL DELAY
	 DECF COUNT1
	 BNZ LOP14
	 
	 GOTO AGAIN3    ; GO TO BEGINNINGOF THIS PART
  
 ;_____________Delay
DELAY	 movlw .40	;I calculated these loop values to look better on proteus
	 movwf 0x21	
For5	 movlw .50
	 movwf 0x22
For4	 movlw .1
	 movwf 0x23
For3	 nop
	 nop
	 DECF  0x23,f
	 BNZ For3
	 decf 0x22,f
	 BNZ For4
	 decf 0x21,f
	 BNZ For5
	 RETURN
	 end

