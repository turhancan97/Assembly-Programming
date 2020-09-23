
_interrupt:

;_dev61.c,2 :: 		void interrupt() // Interrupt
;_dev61.c,4 :: 		if(INT0IF_bit==1)
	BTFSS       INT0IF_bit+0, BitPos(INT0IF_bit+0) 
	GOTO        L_interrupt0
;_dev61.c,6 :: 		cntr++;
	INFSNZ      _cntr+0, 1 
	INCF        _cntr+1, 1 
;_dev61.c,7 :: 		if(cntr>=10) // Turning on LED after 10 packages
	MOVLW       0
	SUBWF       _cntr+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt8
	MOVLW       10
	SUBWF       _cntr+0, 0 
L__interrupt8:
	BTFSS       STATUS+0, 0 
	GOTO        L_interrupt1
;_dev61.c,9 :: 		PORTb.RB1=1;        // LED = 1
	BSF         PORTB+0, 1 
;_dev61.c,10 :: 		Delay_ms(5000);     // Wait 5sec
	MOVLW       51
	MOVWF       R11, 0
	MOVLW       187
	MOVWF       R12, 0
	MOVLW       223
	MOVWF       R13, 0
L_interrupt2:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt2
	DECFSZ      R12, 1, 1
	BRA         L_interrupt2
	DECFSZ      R11, 1, 1
	BRA         L_interrupt2
	NOP
	NOP
;_dev61.c,11 :: 		PORTB.RB1=0;        // LED = 0
	BCF         PORTB+0, 1 
;_dev61.c,12 :: 		Delay_ms(1000);     // wait 1sec
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_interrupt3:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt3
	DECFSZ      R12, 1, 1
	BRA         L_interrupt3
	DECFSZ      R11, 1, 1
	BRA         L_interrupt3
	NOP
	NOP
;_dev61.c,13 :: 		cntr=0;              // cntr = 0
	CLRF        _cntr+0 
	CLRF        _cntr+1 
;_dev61.c,14 :: 		}
L_interrupt1:
;_dev61.c,15 :: 		}
L_interrupt0:
;_dev61.c,16 :: 		INT0IF_bit=0;
	BCF         INT0IF_bit+0, BitPos(INT0IF_bit+0) 
;_dev61.c,17 :: 		}
L_end_interrupt:
L__interrupt7:
	RETFIE      1
; end of _interrupt

_main:

;_dev61.c,18 :: 		void main() {
;_dev61.c,19 :: 		ANSELB=0;               // Input - Output Configuration
	CLRF        ANSELB+0 
;_dev61.c,20 :: 		ANSELD=0;
	CLRF        ANSELD+0 
;_dev61.c,21 :: 		TRISB=0b00000001;
	MOVLW       1
	MOVWF       TRISB+0 
;_dev61.c,22 :: 		TRISD=0;
	CLRF        TRISD+0 
;_dev61.c,24 :: 		INTEDG0_bit=0;          // Interrupt Setup
	BCF         INTEDG0_bit+0, BitPos(INTEDG0_bit+0) 
;_dev61.c,25 :: 		INT0IF_bit=0;          // clear
	BCF         INT0IF_bit+0, BitPos(INT0IF_bit+0) 
;_dev61.c,26 :: 		INT0IE_bit=1;         // enable
	BSF         INT0IE_bit+0, BitPos(INT0IE_bit+0) 
;_dev61.c,27 :: 		GIE_bit=1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;_dev61.c,29 :: 		while(1)
L_main4:
;_dev61.c,31 :: 		PORTD=cntr; // To show how many packages we counted
	MOVF        _cntr+0, 0 
	MOVWF       PORTD+0 
;_dev61.c,32 :: 		}
	GOTO        L_main4
;_dev61.c,33 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
