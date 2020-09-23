
_main:

;Lab73.c,26 :: 		void main() {
;Lab73.c,27 :: 		count = 5;                                // To write Counter in 5. columns
	MOVLW       5
	MOVWF       _count+0 
;Lab73.c,28 :: 		Keypad_Init();                           // Initialize Keypad
	CALL        _Keypad_Init+0, 0
;Lab73.c,29 :: 		ANSELB = 0;                              // Configure AN pins as digital I/O
	CLRF        ANSELB+0 
;Lab73.c,30 :: 		ANSELD = 0;
	CLRF        ANSELD+0 
;Lab73.c,31 :: 		ANSELE = 0;
	CLRF        ANSELE+0 
;Lab73.c,32 :: 		Lcd_Init();                              // Initialize LCD
	CALL        _Lcd_Init+0, 0
;Lab73.c,33 :: 		Lcd_Cmd(_LCD_CLEAR);                     // Clear display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Lab73.c,34 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);                // Cursor off
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Lab73.c,36 :: 		Lcd_Out(1, 1, "Enter Four Digits");                 // Write message text on LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_Lab73+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_Lab73+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Lab73.c,37 :: 		Lcd_Out(2, 1, "After 2 seconds");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_Lab73+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_Lab73+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Lab73.c,38 :: 		delay_ms(2000);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_main0:
	DECFSZ      R13, 1, 1
	BRA         L_main0
	DECFSZ      R12, 1, 1
	BRA         L_main0
	DECFSZ      R11, 1, 1
	BRA         L_main0
	NOP
;Lab73.c,39 :: 		Lcd_Cmd(_LCD_CLEAR);                     // Clear display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Lab73.c,41 :: 		do {
L_main1:
;Lab73.c,42 :: 		kp = 0;                                // Reset key code variable
	CLRF        _kp+0 
;Lab73.c,45 :: 		do
L_main4:
;Lab73.c,46 :: 		kp = Keypad_Key_Click();             // Store key code in kp variable
	CALL        _Keypad_Key_Click+0, 0
	MOVF        R0, 0 
	MOVWF       _kp+0 
;Lab73.c,47 :: 		while (!kp);
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main4
;Lab73.c,49 :: 		switch (kp) {
	GOTO        L_main7
;Lab73.c,50 :: 		case  1: kp = 49; break; // 1
L_main9:
	MOVLW       49
	MOVWF       _kp+0 
	GOTO        L_main8
;Lab73.c,51 :: 		case  2: kp = 50; break; // 2
L_main10:
	MOVLW       50
	MOVWF       _kp+0 
	GOTO        L_main8
;Lab73.c,52 :: 		case  3: kp = 51; break; // 3
L_main11:
	MOVLW       51
	MOVWF       _kp+0 
	GOTO        L_main8
;Lab73.c,53 :: 		case  4: kp = 65; break; // A
L_main12:
	MOVLW       65
	MOVWF       _kp+0 
	GOTO        L_main8
;Lab73.c,54 :: 		case  5: kp = 52; break; // 4
L_main13:
	MOVLW       52
	MOVWF       _kp+0 
	GOTO        L_main8
;Lab73.c,55 :: 		case  6: kp = 53; break; // 5
L_main14:
	MOVLW       53
	MOVWF       _kp+0 
	GOTO        L_main8
;Lab73.c,56 :: 		case  7: kp = 54; break; // 6
L_main15:
	MOVLW       54
	MOVWF       _kp+0 
	GOTO        L_main8
;Lab73.c,57 :: 		case  8: kp = 66; break; // B
L_main16:
	MOVLW       66
	MOVWF       _kp+0 
	GOTO        L_main8
;Lab73.c,58 :: 		case  9: kp = 55; break; // 7
L_main17:
	MOVLW       55
	MOVWF       _kp+0 
	GOTO        L_main8
;Lab73.c,59 :: 		case 10: kp = 56; break; // 8
L_main18:
	MOVLW       56
	MOVWF       _kp+0 
	GOTO        L_main8
;Lab73.c,60 :: 		case 11: kp = 57; break; // 9
L_main19:
	MOVLW       57
	MOVWF       _kp+0 
	GOTO        L_main8
;Lab73.c,61 :: 		case 12: kp = 67; break; // C
L_main20:
	MOVLW       67
	MOVWF       _kp+0 
	GOTO        L_main8
;Lab73.c,62 :: 		case 13: kp = 42; break; // *
L_main21:
	MOVLW       42
	MOVWF       _kp+0 
	GOTO        L_main8
;Lab73.c,63 :: 		case 14: kp = 48; break; // 0
L_main22:
	MOVLW       48
	MOVWF       _kp+0 
	GOTO        L_main8
;Lab73.c,64 :: 		case 15: kp = 35; break; // #
L_main23:
	MOVLW       35
	MOVWF       _kp+0 
	GOTO        L_main8
;Lab73.c,65 :: 		case 16: kp = 68; break; // D
L_main24:
	MOVLW       68
	MOVWF       _kp+0 
	GOTO        L_main8
;Lab73.c,67 :: 		}
L_main7:
	MOVF        _kp+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_main9
	MOVF        _kp+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_main10
	MOVF        _kp+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_main11
	MOVF        _kp+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_main12
	MOVF        _kp+0, 0 
	XORLW       5
	BTFSC       STATUS+0, 2 
	GOTO        L_main13
	MOVF        _kp+0, 0 
	XORLW       6
	BTFSC       STATUS+0, 2 
	GOTO        L_main14
	MOVF        _kp+0, 0 
	XORLW       7
	BTFSC       STATUS+0, 2 
	GOTO        L_main15
	MOVF        _kp+0, 0 
	XORLW       8
	BTFSC       STATUS+0, 2 
	GOTO        L_main16
	MOVF        _kp+0, 0 
	XORLW       9
	BTFSC       STATUS+0, 2 
	GOTO        L_main17
	MOVF        _kp+0, 0 
	XORLW       10
	BTFSC       STATUS+0, 2 
	GOTO        L_main18
	MOVF        _kp+0, 0 
	XORLW       11
	BTFSC       STATUS+0, 2 
	GOTO        L_main19
	MOVF        _kp+0, 0 
	XORLW       12
	BTFSC       STATUS+0, 2 
	GOTO        L_main20
	MOVF        _kp+0, 0 
	XORLW       13
	BTFSC       STATUS+0, 2 
	GOTO        L_main21
	MOVF        _kp+0, 0 
	XORLW       14
	BTFSC       STATUS+0, 2 
	GOTO        L_main22
	MOVF        _kp+0, 0 
	XORLW       15
	BTFSC       STATUS+0, 2 
	GOTO        L_main23
	MOVF        _kp+0, 0 
	XORLW       16
	BTFSC       STATUS+0, 2 
	GOTO        L_main24
L_main8:
;Lab73.c,69 :: 		Lcd_Chr(1,++count, kp);                    // Print key ASCII value on LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_row+0 
	INCF        _count+0, 1 
	MOVF        _count+0, 0 
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVF        _kp+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;Lab73.c,70 :: 		Lcd_Out(1,8, ":");                         // for count-down
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       8
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr3_Lab73+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr3_Lab73+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Lab73.c,71 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main25:
	DECFSZ      R13, 1, 1
	BRA         L_main25
	DECFSZ      R12, 1, 1
	BRA         L_main25
	DECFSZ      R11, 1, 1
	BRA         L_main25
	NOP
;Lab73.c,73 :: 		if (count == 10) {                        //  when you enter four digit it will come here
	MOVF        _count+0, 0 
	XORLW       10
	BTFSS       STATUS+0, 2 
	GOTO        L_main26
;Lab73.c,75 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Lab73.c,76 :: 		for (j=59;j>=0;j--)
	MOVLW       59
	MOVWF       _j+0 
L_main27:
	MOVLW       0
	SUBWF       _j+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_main28
;Lab73.c,78 :: 		ByteToStr(j, display1);
	MOVF        _j+0, 0 
	MOVWF       FARG_ByteToStr_input+0 
	MOVLW       _display1+0
	MOVWF       FARG_ByteToStr_output+0 
	MOVLW       hi_addr(_display1+0)
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
;Lab73.c,79 :: 		Lcd_Out(1, 8, display1);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       8
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _display1+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_display1+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Lab73.c,80 :: 		Lcd_Out(1, 7, "1");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       7
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr4_Lab73+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr4_Lab73+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Lab73.c,81 :: 		Lcd_Out(1, 6, "0");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       6
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr5_Lab73+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr5_Lab73+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Lab73.c,82 :: 		Lcd_Out(1, 8, ":");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       8
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr6_Lab73+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr6_Lab73+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Lab73.c,83 :: 		Delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main30:
	DECFSZ      R13, 1, 1
	BRA         L_main30
	DECFSZ      R12, 1, 1
	BRA         L_main30
	DECFSZ      R11, 1, 1
	BRA         L_main30
	NOP
	NOP
;Lab73.c,85 :: 		if (j == 0)
	MOVF        _j+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main31
;Lab73.c,87 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Lab73.c,88 :: 		for (i=59;i>=0;i--)
	MOVLW       59
	MOVWF       _i+0 
L_main32:
	MOVLW       0
	SUBWF       _i+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_main33
;Lab73.c,90 :: 		ByteToStr(i, display2);
	MOVF        _i+0, 0 
	MOVWF       FARG_ByteToStr_input+0 
	MOVLW       _display2+0
	MOVWF       FARG_ByteToStr_output+0 
	MOVLW       hi_addr(_display2+0)
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
;Lab73.c,91 :: 		Lcd_Out(1, 8, display2);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       8
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _display2+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_display2+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Lab73.c,92 :: 		Lcd_Out(1, 7, "0");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       7
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr7_Lab73+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr7_Lab73+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Lab73.c,93 :: 		Lcd_Out(1, 6, "0");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       6
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr8_Lab73+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr8_Lab73+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Lab73.c,94 :: 		Lcd_Out(1, 8, ":");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       8
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr9_Lab73+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr9_Lab73+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Lab73.c,95 :: 		Delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main35:
	DECFSZ      R13, 1, 1
	BRA         L_main35
	DECFSZ      R12, 1, 1
	BRA         L_main35
	DECFSZ      R11, 1, 1
	BRA         L_main35
	NOP
	NOP
;Lab73.c,96 :: 		if (i <= 0)
	MOVF        _i+0, 0 
	SUBLW       0
	BTFSS       STATUS+0, 0 
	GOTO        L_main36
;Lab73.c,98 :: 		goto turhan;
	GOTO        ___main_turhan
;Lab73.c,99 :: 		}
L_main36:
;Lab73.c,88 :: 		for (i=59;i>=0;i--)
	DECF        _i+0, 1 
;Lab73.c,100 :: 		}
	GOTO        L_main32
L_main33:
;Lab73.c,101 :: 		}
L_main31:
;Lab73.c,76 :: 		for (j=59;j>=0;j--)
	DECF        _j+0, 1 
;Lab73.c,102 :: 		}
	GOTO        L_main27
L_main28:
;Lab73.c,103 :: 		while(1){
L_main37:
;Lab73.c,104 :: 		turhan:
___main_turhan:
;Lab73.c,105 :: 		Lcd_Out(1, 6, "00:00");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       6
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr10_Lab73+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr10_Lab73+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Lab73.c,106 :: 		}
	GOTO        L_main37
;Lab73.c,107 :: 		}
L_main26:
;Lab73.c,108 :: 		} while (1);
	GOTO        L_main1
;Lab73.c,109 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
