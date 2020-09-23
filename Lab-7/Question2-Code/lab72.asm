
_main:

;lab72.c,21 :: 		void main() {
;lab72.c,23 :: 		ANSELB=0;
	CLRF        ANSELB+0 
;lab72.c,24 :: 		ANSELE=0;
	CLRF        ANSELE+0 
;lab72.c,25 :: 		TRISB=0x00;
	CLRF        TRISB+0 
;lab72.c,26 :: 		TRISE=0x00;
	CLRF        TRISE+0 
;lab72.c,27 :: 		PORTB=0x00;
	CLRF        PORTB+0 
;lab72.c,28 :: 		PORTE=0x00;
	CLRF        PORTE+0 
;lab72.c,29 :: 		Lcd_Init();                      // Initialize LCD
	CALL        _Lcd_Init+0, 0
;lab72.c,30 :: 		Lcd_Cmd(_LCD_CLEAR);             // Clear display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;lab72.c,31 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);        // Cursor off
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;lab72.c,32 :: 		Lcd_Out(1, 6, "02:00");        // It will start with 02:00
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       6
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_lab72+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_lab72+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;lab72.c,33 :: 		Delay_ms(750);                // delay
	MOVLW       8
	MOVWF       R11, 0
	MOVLW       157
	MOVWF       R12, 0
	MOVLW       5
	MOVWF       R13, 0
L_main0:
	DECFSZ      R13, 1, 1
	BRA         L_main0
	DECFSZ      R12, 1, 1
	BRA         L_main0
	DECFSZ      R11, 1, 1
	BRA         L_main0
	NOP
	NOP
;lab72.c,34 :: 		Lcd_Cmd(_LCD_CLEAR);           // Clear display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;lab72.c,36 :: 		for (j=59;j>=0;j--)            // count-down from 01.59
	MOVLW       59
	MOVWF       _j+0 
L_main1:
	MOVLW       0
	SUBWF       _j+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_main2
;lab72.c,38 :: 		ByteToStr(j, display1);          // We should convert char to string
	MOVF        _j+0, 0 
	MOVWF       FARG_ByteToStr_input+0 
	MOVLW       _display1+0
	MOVWF       FARG_ByteToStr_output+0 
	MOVLW       hi_addr(_display1+0)
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
;lab72.c,39 :: 		Lcd_Out(1, 8, display1);         // and show it in LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       8
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _display1+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_display1+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;lab72.c,40 :: 		Lcd_Out(1, 7, "1");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       7
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_lab72+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_lab72+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;lab72.c,41 :: 		Lcd_Out(1, 6, "0");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       6
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr3_lab72+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr3_lab72+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;lab72.c,42 :: 		Lcd_Out(1, 8, ":");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       8
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr4_lab72+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr4_lab72+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;lab72.c,43 :: 		Delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main4:
	DECFSZ      R13, 1, 1
	BRA         L_main4
	DECFSZ      R12, 1, 1
	BRA         L_main4
	DECFSZ      R11, 1, 1
	BRA         L_main4
	NOP
;lab72.c,45 :: 		if (j == 0)                     // when it will be 01:00
	MOVF        _j+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main5
;lab72.c,47 :: 		for (i=59;i>=0;i--)       // count-down from 00.59
	MOVLW       59
	MOVWF       _i+0 
L_main6:
	MOVLW       0
	SUBWF       _i+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_main7
;lab72.c,49 :: 		ByteToStr(i, display2);         // We should convert char to string
	MOVF        _i+0, 0 
	MOVWF       FARG_ByteToStr_input+0 
	MOVLW       _display2+0
	MOVWF       FARG_ByteToStr_output+0 
	MOVLW       hi_addr(_display2+0)
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
;lab72.c,50 :: 		Lcd_Out(1, 8, display2);        // and show it in LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       8
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _display2+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_display2+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;lab72.c,51 :: 		Lcd_Out(1, 7, "0");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       7
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr5_lab72+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr5_lab72+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;lab72.c,52 :: 		Lcd_Out(1, 6, "0");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       6
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr6_lab72+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr6_lab72+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;lab72.c,53 :: 		Lcd_Out(1, 8, ":");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       8
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr7_lab72+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr7_lab72+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;lab72.c,54 :: 		Delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main9:
	DECFSZ      R13, 1, 1
	BRA         L_main9
	DECFSZ      R12, 1, 1
	BRA         L_main9
	DECFSZ      R11, 1, 1
	BRA         L_main9
	NOP
;lab72.c,56 :: 		if (i <= 0)                    // when the count-down is over
	MOVF        _i+0, 0 
	SUBLW       0
	BTFSS       STATUS+0, 0 
	GOTO        L_main10
;lab72.c,58 :: 		goto turhan;                 // it will go to turhan go make 00:00 forever
	GOTO        ___main_turhan
;lab72.c,59 :: 		}
L_main10:
;lab72.c,47 :: 		for (i=59;i>=0;i--)       // count-down from 00.59
	DECF        _i+0, 1 
;lab72.c,60 :: 		}
	GOTO        L_main6
L_main7:
;lab72.c,61 :: 		}
L_main5:
;lab72.c,36 :: 		for (j=59;j>=0;j--)            // count-down from 01.59
	DECF        _j+0, 1 
;lab72.c,62 :: 		}
	GOTO        L_main1
L_main2:
;lab72.c,63 :: 		while(1){
L_main11:
;lab72.c,64 :: 		turhan:
___main_turhan:
;lab72.c,65 :: 		Lcd_Out(1, 6, "00:00");      // make 00:00 forever
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       6
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr8_lab72+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr8_lab72+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;lab72.c,66 :: 		}
	GOTO        L_main11
;lab72.c,67 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
