
_main:

;_dev62.c,7 :: 		void main() {
;_dev62.c,9 :: 		ANSELA=0;                        // Configure pins as digital I/O
	CLRF        ANSELA+0 
;_dev62.c,10 :: 		ANSELB=0;
	CLRF        ANSELB+0 
;_dev62.c,11 :: 		ANSELC=0;
	CLRF        ANSELC+0 
;_dev62.c,12 :: 		ANSELD=0;
	CLRF        ANSELD+0 
;_dev62.c,13 :: 		ANSELE=0;
	CLRF        ANSELE+0 
;_dev62.c,14 :: 		TRISA=0xFF;
	MOVLW       255
	MOVWF       TRISA+0 
;_dev62.c,15 :: 		TRISB=0b00000001;
	MOVLW       1
	MOVWF       TRISB+0 
;_dev62.c,16 :: 		TRISC=0;
	CLRF        TRISC+0 
;_dev62.c,17 :: 		TRISD=0;
	CLRF        TRISD+0 
;_dev62.c,18 :: 		TRISE=0;
	CLRF        TRISE+0 
;_dev62.c,19 :: 		PORTA=0x00;
	CLRF        PORTA+0 
;_dev62.c,20 :: 		PORTE=0x00;
	CLRF        PORTE+0 
;_dev62.c,21 :: 		PORTC=0x99;
	MOVLW       153
	MOVWF       PORTC+0 
;_dev62.c,22 :: 		PORTD=0x99;
	MOVLW       153
	MOVWF       PORTD+0 
;_dev62.c,23 :: 		Delay_ms(80);
	MOVLW       208
	MOVWF       R12, 0
	MOVLW       201
	MOVWF       R13, 0
L_main0:
	DECFSZ      R13, 1, 1
	BRA         L_main0
	DECFSZ      R12, 1, 1
	BRA         L_main0
	NOP
	NOP
;_dev62.c,24 :: 		PORTC=0x88;
	MOVLW       136
	MOVWF       PORTC+0 
;_dev62.c,25 :: 		PORTD=0x88;
	MOVLW       136
	MOVWF       PORTD+0 
;_dev62.c,26 :: 		Delay_ms(80);
	MOVLW       208
	MOVWF       R12, 0
	MOVLW       201
	MOVWF       R13, 0
L_main1:
	DECFSZ      R13, 1, 1
	BRA         L_main1
	DECFSZ      R12, 1, 1
	BRA         L_main1
	NOP
	NOP
;_dev62.c,27 :: 		PORTC=0x77;
	MOVLW       119
	MOVWF       PORTC+0 
;_dev62.c,28 :: 		PORTD=0x77;
	MOVLW       119
	MOVWF       PORTD+0 
;_dev62.c,29 :: 		Delay_ms(80);
	MOVLW       208
	MOVWF       R12, 0
	MOVLW       201
	MOVWF       R13, 0
L_main2:
	DECFSZ      R13, 1, 1
	BRA         L_main2
	DECFSZ      R12, 1, 1
	BRA         L_main2
	NOP
	NOP
;_dev62.c,30 :: 		PORTC=0x66;
	MOVLW       102
	MOVWF       PORTC+0 
;_dev62.c,31 :: 		PORTD=0x66;
	MOVLW       102
	MOVWF       PORTD+0 
;_dev62.c,32 :: 		Delay_ms(80);
	MOVLW       208
	MOVWF       R12, 0
	MOVLW       201
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 1
	BRA         L_main3
	DECFSZ      R12, 1, 1
	BRA         L_main3
	NOP
	NOP
;_dev62.c,33 :: 		PORTC=0x55;
	MOVLW       85
	MOVWF       PORTC+0 
;_dev62.c,34 :: 		PORTD=0x55;
	MOVLW       85
	MOVWF       PORTD+0 
;_dev62.c,35 :: 		Delay_ms(80);
	MOVLW       208
	MOVWF       R12, 0
	MOVLW       201
	MOVWF       R13, 0
L_main4:
	DECFSZ      R13, 1, 1
	BRA         L_main4
	DECFSZ      R12, 1, 1
	BRA         L_main4
	NOP
	NOP
;_dev62.c,36 :: 		PORTC=0x44;
	MOVLW       68
	MOVWF       PORTC+0 
;_dev62.c,37 :: 		PORTD=0x44;
	MOVLW       68
	MOVWF       PORTD+0 
;_dev62.c,38 :: 		Delay_ms(80);
	MOVLW       208
	MOVWF       R12, 0
	MOVLW       201
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 1
	BRA         L_main5
	DECFSZ      R12, 1, 1
	BRA         L_main5
	NOP
	NOP
;_dev62.c,39 :: 		PORTC=0x33;
	MOVLW       51
	MOVWF       PORTC+0 
;_dev62.c,40 :: 		PORTD=0x33;
	MOVLW       51
	MOVWF       PORTD+0 
;_dev62.c,41 :: 		Delay_ms(80);
	MOVLW       208
	MOVWF       R12, 0
	MOVLW       201
	MOVWF       R13, 0
L_main6:
	DECFSZ      R13, 1, 1
	BRA         L_main6
	DECFSZ      R12, 1, 1
	BRA         L_main6
	NOP
	NOP
;_dev62.c,42 :: 		PORTC=0x22;
	MOVLW       34
	MOVWF       PORTC+0 
;_dev62.c,43 :: 		PORTD=0x22;
	MOVLW       34
	MOVWF       PORTD+0 
;_dev62.c,44 :: 		Delay_ms(80);
	MOVLW       208
	MOVWF       R12, 0
	MOVLW       201
	MOVWF       R13, 0
L_main7:
	DECFSZ      R13, 1, 1
	BRA         L_main7
	DECFSZ      R12, 1, 1
	BRA         L_main7
	NOP
	NOP
;_dev62.c,45 :: 		PORTC=0x11;
	MOVLW       17
	MOVWF       PORTC+0 
;_dev62.c,46 :: 		PORTD=0x11;
	MOVLW       17
	MOVWF       PORTD+0 
;_dev62.c,47 :: 		Delay_ms(80);
	MOVLW       208
	MOVWF       R12, 0
	MOVLW       201
	MOVWF       R13, 0
L_main8:
	DECFSZ      R13, 1, 1
	BRA         L_main8
	DECFSZ      R12, 1, 1
	BRA         L_main8
	NOP
	NOP
;_dev62.c,48 :: 		PORTC=0x00;
	CLRF        PORTC+0 
;_dev62.c,49 :: 		PORTD=0x00;
	CLRF        PORTD+0 
;_dev62.c,52 :: 		T0CON=0b10101000;
	MOVLW       168
	MOVWF       T0CON+0 
;_dev62.c,53 :: 		TMR0H=0x77;
	MOVLW       119
	MOVWF       TMR0H+0 
;_dev62.c,54 :: 		TMR0L=0x77;
	MOVLW       119
	MOVWF       TMR0L+0 
;_dev62.c,56 :: 		TMR1H=0x3C;
	MOVLW       60
	MOVWF       TMR1H+0 
;_dev62.c,57 :: 		TMR1L=0xB0;
	MOVLW       176
	MOVWF       TMR1L+0 
;_dev62.c,58 :: 		T1CON = 0b00000111;
	MOVLW       7
	MOVWF       T1CON+0 
;_dev62.c,59 :: 		INTCON=0xC0;
	MOVLW       192
	MOVWF       INTCON+0 
;_dev62.c,60 :: 		TMR1IE_bit = 1;
	BSF         TMR1IE_bit+0, BitPos(TMR1IE_bit+0) 
;_dev62.c,62 :: 		PORTC=0x77;
	MOVLW       119
	MOVWF       PORTC+0 
;_dev62.c,63 :: 		PORTD=0x77;
	MOVLW       119
	MOVWF       PORTD+0 
;_dev62.c,66 :: 		while(1)
L_main9:
;_dev62.c,68 :: 		low=TMR0L;
	MOVF        TMR0L+0, 0 
	MOVWF       _low+0 
	MOVLW       0
	MOVWF       _low+1 
;_dev62.c,69 :: 		high=TMR0H;
	MOVF        TMR0H+0, 0 
	MOVWF       _high+0 
	MOVLW       0
	MOVWF       _high+1 
;_dev62.c,70 :: 		if(cnt >=20) // 10 ms * 100 = 1000 ms 0 1 sn
	MOVLW       0
	SUBWF       _cnt+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main27
	MOVLW       20
	SUBWF       _cnt+0, 0 
L__main27:
	BTFSS       STATUS+0, 0 
	GOTO        L_main11
;_dev62.c,72 :: 		PORTE.RE2 = ~ PORTE.RE2;
	BTG         PORTE+0, 2 
;_dev62.c,73 :: 		freq=low-0x77+(256*(high-0x77));  // Calculating Frequency
	MOVLW       119
	SUBWF       _low+0, 0 
	MOVWF       R5 
	MOVLW       0
	SUBWFB      _low+1, 0 
	MOVWF       R6 
	MOVLW       119
	SUBWF       _high+0, 0 
	MOVWF       R3 
	MOVLW       0
	SUBWFB      _high+1, 0 
	MOVWF       R4 
	MOVF        R3, 0 
	MOVWF       R1 
	CLRF        R0 
	MOVF        R5, 0 
	ADDWF       R0, 1 
	MOVF        R6, 0 
	ADDWFC      R1, 1 
	MOVF        R0, 0 
	MOVWF       _freq+0 
	MOVF        R1, 0 
	MOVWF       _freq+1 
;_dev62.c,75 :: 		IntToStr(freq,hex);
	MOVF        R0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _hex+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_hex+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;_dev62.c,76 :: 		while(cnt>=20)
L_main12:
	MOVLW       0
	SUBWF       _cnt+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main28
	MOVLW       20
	SUBWF       _cnt+0, 0 
L__main28:
	BTFSS       STATUS+0, 0 
	GOTO        L_main13
;_dev62.c,78 :: 		IntToStr(freq,hex);
	MOVF        _freq+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _freq+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _hex+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_hex+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;_dev62.c,79 :: 		if(freq>100&&freq<200)           // frequency value between 100-200Hz
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _freq+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main29
	MOVF        _freq+0, 0 
	SUBLW       100
L__main29:
	BTFSC       STATUS+0, 0 
	GOTO        L_main16
	MOVLW       128
	XORWF       _freq+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main30
	MOVLW       200
	SUBWF       _freq+0, 0 
L__main30:
	BTFSC       STATUS+0, 0 
	GOTO        L_main16
L__main25:
;_dev62.c,81 :: 		PORTC=PORTC-0x01;
	DECF        PORTC+0, 1 
;_dev62.c,82 :: 		if(PORTC==0x00)
	MOVF        PORTC+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main17
;_dev62.c,84 :: 		PORTD=PORTD-0x01;
	DECF        PORTD+0, 1 
;_dev62.c,85 :: 		}
L_main17:
;_dev62.c,86 :: 		}
L_main16:
;_dev62.c,87 :: 		if(freq>200&&freq<300)         // frequency value between 200-300Hz
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _freq+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main31
	MOVF        _freq+0, 0 
	SUBLW       200
L__main31:
	BTFSC       STATUS+0, 0 
	GOTO        L_main20
	MOVLW       128
	XORWF       _freq+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORLW       1
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main32
	MOVLW       44
	SUBWF       _freq+0, 0 
L__main32:
	BTFSC       STATUS+0, 0 
	GOTO        L_main20
L__main24:
;_dev62.c,89 :: 		PORTC=PORTC+0x01;
	INCF        PORTC+0, 1 
;_dev62.c,90 :: 		if(PORTC==0xFF)
	MOVF        PORTC+0, 0 
	XORLW       255
	BTFSS       STATUS+0, 2 
	GOTO        L_main21
;_dev62.c,92 :: 		PORTD=PORTD+0x01;
	INCF        PORTD+0, 1 
;_dev62.c,93 :: 		}
L_main21:
;_dev62.c,94 :: 		}
L_main20:
;_dev62.c,96 :: 		}
	GOTO        L_main12
L_main13:
;_dev62.c,97 :: 		cnt=0;
	CLRF        _cnt+0 
	CLRF        _cnt+1 
;_dev62.c,98 :: 		}
L_main11:
;_dev62.c,100 :: 		IntToStr(cnt,txt);
	MOVF        _cnt+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _cnt+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;_dev62.c,102 :: 		}
	GOTO        L_main9
;_dev62.c,103 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_interrupt:

;_dev62.c,104 :: 		void interrupt()  // Interrupt
;_dev62.c,106 :: 		if(TMR0IF_bit)
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_interrupt22
;_dev62.c,108 :: 		TMR0H= 0x77;
	MOVLW       119
	MOVWF       TMR0H+0 
;_dev62.c,109 :: 		TMR0L= 0x77;
	MOVLW       119
	MOVWF       TMR0L+0 
;_dev62.c,110 :: 		TMR0IF_bit=0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;_dev62.c,111 :: 		}
L_interrupt22:
;_dev62.c,112 :: 		if(TMR1IF_bit)
	BTFSS       TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
	GOTO        L_interrupt23
;_dev62.c,114 :: 		cnt++;
	INFSNZ      _cnt+0, 1 
	INCF        _cnt+1, 1 
;_dev62.c,115 :: 		TMR1H=0X3C;
	MOVLW       60
	MOVWF       TMR1H+0 
;_dev62.c,116 :: 		TMR1L=0xB0;
	MOVLW       176
	MOVWF       TMR1L+0 
;_dev62.c,117 :: 		TMR1IF_bit=0;
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;_dev62.c,118 :: 		}
L_interrupt23:
;_dev62.c,119 :: 		}
L_end_interrupt:
L__interrupt34:
	RETFIE      1
; end of _interrupt
