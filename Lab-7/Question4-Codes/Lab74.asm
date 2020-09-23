
_main:

;Lab74.c,21 :: 		void main() {
;Lab74.c,22 :: 		ANSELB = 0;                              // Configure AN pins as digital I/O
	CLRF        ANSELB+0 
;Lab74.c,23 :: 		ANSELD = 0;
	CLRF        ANSELD+0 
;Lab74.c,24 :: 		ANSELE = 0;
	CLRF        ANSELE+0 
;Lab74.c,25 :: 		Lcd_Init(); // Initialize LCD
	CALL        _Lcd_Init+0, 0
;Lab74.c,26 :: 		Lcd_Cmd(_LCD_CLEAR); // Clear Display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Lab74.c,27 :: 		Lcd_Cmd(_LCD_CURSOR_OFF); // Cursor Off
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Lab74.c,28 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Lab74.c,31 :: 		Lcd_Out(2,1,"Decimal to Binary Converter”");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_Lab74+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_Lab74+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Lab74.c,32 :: 		Delay_ms(125);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       69
	MOVWF       R12, 0
	MOVLW       169
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
;Lab74.c,33 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Lab74.c,34 :: 		Lcd_Out(2,0,"Decimal to Binary Converter”");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	CLRF        FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_Lab74+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_Lab74+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Lab74.c,35 :: 		Delay_ms(125);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       69
	MOVWF       R12, 0
	MOVLW       169
	MOVWF       R13, 0
L_main1:
	DECFSZ      R13, 1, 1
	BRA         L_main1
	DECFSZ      R12, 1, 1
	BRA         L_main1
	DECFSZ      R11, 1, 1
	BRA         L_main1
	NOP
	NOP
;Lab74.c,36 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Lab74.c,37 :: 		Lcd_Out(2,-1,"Decimal to Binary Converter”");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       255
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr3_Lab74+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr3_Lab74+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Lab74.c,38 :: 		Delay_ms(125);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       69
	MOVWF       R12, 0
	MOVLW       169
	MOVWF       R13, 0
L_main2:
	DECFSZ      R13, 1, 1
	BRA         L_main2
	DECFSZ      R12, 1, 1
	BRA         L_main2
	DECFSZ      R11, 1, 1
	BRA         L_main2
	NOP
	NOP
;Lab74.c,39 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Lab74.c,40 :: 		Lcd_Out(2,-2,"Decimal to Binary Converter”");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       254
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr4_Lab74+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr4_Lab74+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Lab74.c,41 :: 		Delay_ms(125);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       69
	MOVWF       R12, 0
	MOVLW       169
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 1
	BRA         L_main3
	DECFSZ      R12, 1, 1
	BRA         L_main3
	DECFSZ      R11, 1, 1
	BRA         L_main3
	NOP
	NOP
;Lab74.c,42 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Lab74.c,43 :: 		Lcd_Out(2,-3,"Decimal to Binary Converter”");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       253
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr5_Lab74+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr5_Lab74+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Lab74.c,44 :: 		Delay_ms(125);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       69
	MOVWF       R12, 0
	MOVLW       169
	MOVWF       R13, 0
L_main4:
	DECFSZ      R13, 1, 1
	BRA         L_main4
	DECFSZ      R12, 1, 1
	BRA         L_main4
	DECFSZ      R11, 1, 1
	BRA         L_main4
	NOP
	NOP
;Lab74.c,45 :: 		Lcd_Out(2,-4,"Decimal to Binary Converter”");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       252
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr6_Lab74+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr6_Lab74+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Lab74.c,46 :: 		Delay_ms(125);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       69
	MOVWF       R12, 0
	MOVLW       169
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 1
	BRA         L_main5
	DECFSZ      R12, 1, 1
	BRA         L_main5
	DECFSZ      R11, 1, 1
	BRA         L_main5
	NOP
	NOP
;Lab74.c,47 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Lab74.c,48 :: 		Lcd_Out(2,-5,"Decimal to Binary Converter”");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       251
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr7_Lab74+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr7_Lab74+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Lab74.c,49 :: 		Delay_ms(125);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       69
	MOVWF       R12, 0
	MOVLW       169
	MOVWF       R13, 0
L_main6:
	DECFSZ      R13, 1, 1
	BRA         L_main6
	DECFSZ      R12, 1, 1
	BRA         L_main6
	DECFSZ      R11, 1, 1
	BRA         L_main6
	NOP
	NOP
;Lab74.c,50 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Lab74.c,51 :: 		Lcd_Out(2,-6,"Decimal to Binary Converter”");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       250
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr8_Lab74+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr8_Lab74+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Lab74.c,52 :: 		Delay_ms(125);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       69
	MOVWF       R12, 0
	MOVLW       169
	MOVWF       R13, 0
L_main7:
	DECFSZ      R13, 1, 1
	BRA         L_main7
	DECFSZ      R12, 1, 1
	BRA         L_main7
	DECFSZ      R11, 1, 1
	BRA         L_main7
	NOP
	NOP
;Lab74.c,53 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Lab74.c,54 :: 		Lcd_Out(2,-7,"Decimal to Binary Converter”");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       249
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr9_Lab74+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr9_Lab74+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Lab74.c,55 :: 		Delay_ms(125);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       69
	MOVWF       R12, 0
	MOVLW       169
	MOVWF       R13, 0
L_main8:
	DECFSZ      R13, 1, 1
	BRA         L_main8
	DECFSZ      R12, 1, 1
	BRA         L_main8
	DECFSZ      R11, 1, 1
	BRA         L_main8
	NOP
	NOP
;Lab74.c,56 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Lab74.c,57 :: 		Lcd_Out(2,-8,"Decimal to Binary Converter”");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       248
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr10_Lab74+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr10_Lab74+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Lab74.c,58 :: 		Delay_ms(125);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       69
	MOVWF       R12, 0
	MOVLW       169
	MOVWF       R13, 0
L_main9:
	DECFSZ      R13, 1, 1
	BRA         L_main9
	DECFSZ      R12, 1, 1
	BRA         L_main9
	DECFSZ      R11, 1, 1
	BRA         L_main9
	NOP
	NOP
;Lab74.c,59 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Lab74.c,60 :: 		Lcd_Out(2,-9,"Decimal to Binary Converter”");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       247
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr11_Lab74+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr11_Lab74+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Lab74.c,61 :: 		Delay_ms(125);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       69
	MOVWF       R12, 0
	MOVLW       169
	MOVWF       R13, 0
L_main10:
	DECFSZ      R13, 1, 1
	BRA         L_main10
	DECFSZ      R12, 1, 1
	BRA         L_main10
	DECFSZ      R11, 1, 1
	BRA         L_main10
	NOP
	NOP
;Lab74.c,62 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Lab74.c,63 :: 		Lcd_Out(2,-10,"Decimal to Binary Converter”");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       246
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr12_Lab74+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr12_Lab74+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Lab74.c,64 :: 		Delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main11:
	DECFSZ      R13, 1, 1
	BRA         L_main11
	DECFSZ      R12, 1, 1
	BRA         L_main11
	DECFSZ      R11, 1, 1
	BRA         L_main11
	NOP
	NOP
;Lab74.c,65 :: 		Lcd_Cmd(_LCD_CLEAR); // Clear Display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Lab74.c,66 :: 		delay_ms(500); // Delay of 0.5s
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main12:
	DECFSZ      R13, 1, 1
	BRA         L_main12
	DECFSZ      R12, 1, 1
	BRA         L_main12
	DECFSZ      R11, 1, 1
	BRA         L_main12
	NOP
	NOP
;Lab74.c,67 :: 		Keypad_Init(); // Initialize Keypad
	CALL        _Keypad_Init+0, 0
;Lab74.c,68 :: 		Lcd_Out(1,1,"Write a Number"); // Write "Write a Number" in the first row
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr13_Lab74+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr13_Lab74+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Lab74.c,69 :: 		Lcd_Out(2,1,"to Convert"); // Write "to Convert" in the first row
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr14_Lab74+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr14_Lab74+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Lab74.c,70 :: 		delay_ms(1000); // Delay of 0.5s
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_main13:
	DECFSZ      R13, 1, 1
	BRA         L_main13
	DECFSZ      R12, 1, 1
	BRA         L_main13
	DECFSZ      R11, 1, 1
	BRA         L_main13
	NOP
	NOP
;Lab74.c,71 :: 		Lcd_Cmd(_LCD_CLEAR); // Clear Display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Lab74.c,72 :: 		do
L_main14:
;Lab74.c,74 :: 		kpi = 0; // Reset key code variable
	CLRF        _kpi+0 
;Lab74.c,76 :: 		do
L_main17:
;Lab74.c,77 :: 		kpi = Keypad_Key_Click(); // Store key code in kpi variable
	CALL        _Keypad_Key_Click+0, 0
	MOVF        R0, 0 
	MOVWF       _kpi+0 
;Lab74.c,79 :: 		while (!kpi);
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main17
;Lab74.c,80 :: 		if (kpi <= 16) {
	MOVF        _kpi+0, 0 
	SUBLW       16
	BTFSS       STATUS+0, 0 
	GOTO        L_main20
;Lab74.c,81 :: 		kpi = lookup_table[kpi]; }
	MOVLW       _lookup_table+0
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_lookup_table+0)
	MOVWF       FSR0L+1 
	MOVF        _kpi+0, 0 
	ADDWF       FSR0L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0L+1, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       _kpi+0 
L_main20:
;Lab74.c,82 :: 		Lcd_Chr(1, 2, kpi); // Print key ASCII value on Lcd
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVF        _kpi+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;Lab74.c,83 :: 		kpi1= 0; // Reset key code variable
	CLRF        _kpi1+0 
	CLRF        _kpi1+1 
;Lab74.c,85 :: 		do
L_main21:
;Lab74.c,86 :: 		kpi1 = Keypad_Key_Click(); // Store key code in kpi variable
	CALL        _Keypad_Key_Click+0, 0
	MOVF        R0, 0 
	MOVWF       _kpi1+0 
	MOVLW       0
	MOVWF       _kpi1+1 
;Lab74.c,88 :: 		while (!kpi1);
	MOVF        _kpi1+0, 0 
	IORWF       _kpi1+1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_main21
;Lab74.c,89 :: 		if (kpi1<= 16) {
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _kpi1+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main36
	MOVF        _kpi1+0, 0 
	SUBLW       16
L__main36:
	BTFSS       STATUS+0, 0 
	GOTO        L_main24
;Lab74.c,90 :: 		kpi1= lookup_table[kpi1];
	MOVLW       _lookup_table+0
	ADDWF       _kpi1+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_lookup_table+0)
	ADDWFC      _kpi1+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       _kpi1+0 
	MOVLW       0
	MOVWF       _kpi1+1 
	MOVLW       0
	MOVWF       _kpi1+1 
;Lab74.c,91 :: 		}
L_main24:
;Lab74.c,93 :: 		Lcd_Chr(1, 3, kpi1); // Print key ASCII value on Lcd
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       3
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVF        _kpi1+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;Lab74.c,95 :: 		kpi2 = 0;
	CLRF        _kpi2+0 
	CLRF        _kpi2+1 
;Lab74.c,96 :: 		do
L_main25:
;Lab74.c,97 :: 		kpi2 = Keypad_Key_Click();
	CALL        _Keypad_Key_Click+0, 0
	MOVF        R0, 0 
	MOVWF       _kpi2+0 
	MOVLW       0
	MOVWF       _kpi2+1 
;Lab74.c,98 :: 		while(!kpi2);
	MOVF        _kpi2+0, 0 
	IORWF       _kpi2+1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_main25
;Lab74.c,99 :: 		if(kpi2<= 16){
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _kpi2+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main37
	MOVF        _kpi2+0, 0 
	SUBLW       16
L__main37:
	BTFSS       STATUS+0, 0 
	GOTO        L_main28
;Lab74.c,101 :: 		kpi2 = lookup_table[kpi2];
	MOVLW       _lookup_table+0
	ADDWF       _kpi2+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_lookup_table+0)
	ADDWFC      _kpi2+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       _kpi2+0 
	MOVLW       0
	MOVWF       _kpi2+1 
	MOVLW       0
	MOVWF       _kpi2+1 
;Lab74.c,102 :: 		}
L_main28:
;Lab74.c,103 :: 		Lcd_Chr(1, 4, kpi2);
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVF        _kpi2+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;Lab74.c,104 :: 		kpi &= 0x0F;
	MOVLW       15
	ANDWF       _kpi+0, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	MOVWF       _kpi+0 
;Lab74.c,105 :: 		kpi1 &= 0x0F;
	MOVLW       15
	ANDWF       _kpi1+0, 0 
	MOVWF       R0 
	MOVF        _kpi1+1, 0 
	MOVWF       R1 
	MOVLW       0
	ANDWF       R1, 1 
	MOVF        R0, 0 
	MOVWF       _kpi1+0 
	MOVF        R1, 0 
	MOVWF       _kpi1+1 
;Lab74.c,106 :: 		kpi2 &= 0x0F;
	MOVLW       15
	ANDWF       _kpi2+0, 0 
	MOVWF       FLOC__main+0 
	MOVF        _kpi2+1, 0 
	MOVWF       FLOC__main+1 
	MOVLW       0
	ANDWF       FLOC__main+1, 1 
	MOVF        FLOC__main+0, 0 
	MOVWF       _kpi2+0 
	MOVF        FLOC__main+1, 0 
	MOVWF       _kpi2+1 
;Lab74.c,107 :: 		total = 0;
	CLRF        _total+0 
	CLRF        _total+1 
;Lab74.c,108 :: 		total = (kpi*100) + (kpi1*10) + kpi2 ;
	MOVLW       100
	MULWF       R2 
	MOVF        PRODL+0, 0 
	MOVWF       _total+0 
	MOVF        PRODH+0, 0 
	MOVWF       _total+1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVF        R0, 0 
	ADDWF       _total+0, 1 
	MOVF        R1, 0 
	ADDWFC      _total+1, 1 
	MOVF        FLOC__main+0, 0 
	ADDWF       _total+0, 1 
	MOVF        FLOC__main+1, 0 
	ADDWFC      _total+1, 1 
;Lab74.c,110 :: 		for (b = 8; b != 0; b--) //loop 8 times
	MOVLW       8
	MOVWF       _b+0 
	MOVLW       0
	MOVWF       _b+1 
L_main29:
	MOVLW       0
	XORWF       _b+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main38
	MOVLW       0
	XORWF       _b+0, 0 
L__main38:
	BTFSC       STATUS+0, 2 
	GOTO        L_main30
;Lab74.c,112 :: 		remainder = total%2;
	MOVLW       2
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        _total+0, 0 
	MOVWF       R0 
	MOVF        _total+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       _remainder+0 
	MOVF        R1, 0 
	MOVWF       _remainder+1 
;Lab74.c,113 :: 		total = total/2;
	RRCF        _total+1, 1 
	RRCF        _total+0, 1 
	BCF         _total+1, 7 
	BTFSC       _total+1, 6 
	BSF         _total+1, 7 
	BTFSS       _total+1, 7 
	GOTO        L__main39
	BTFSS       STATUS+0, 0 
	GOTO        L__main39
	INFSNZ      _total+0, 1 
	INCF        _total+1, 1 
L__main39:
;Lab74.c,114 :: 		if (remainder==1)
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main40
	MOVLW       1
	XORWF       R0, 0 
L__main40:
	BTFSS       STATUS+0, 2 
	GOTO        L_main32
;Lab74.c,116 :: 		Lcd_Chr(2,b,'1');
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVF        _b+0, 0 
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       49
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;Lab74.c,117 :: 		}
	GOTO        L_main33
L_main32:
;Lab74.c,120 :: 		Lcd_Chr( 2,b,'0');
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVF        _b+0, 0 
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       48
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
L_main33:
;Lab74.c,110 :: 		for (b = 8; b != 0; b--) //loop 8 times
	MOVLW       1
	SUBWF       _b+0, 1 
	MOVLW       0
	SUBWFB      _b+1, 1 
;Lab74.c,123 :: 		}
	GOTO        L_main29
L_main30:
;Lab74.c,124 :: 		delay_ms(3000);
	MOVLW       31
	MOVWF       R11, 0
	MOVLW       113
	MOVWF       R12, 0
	MOVLW       30
	MOVWF       R13, 0
L_main34:
	DECFSZ      R13, 1, 1
	BRA         L_main34
	DECFSZ      R12, 1, 1
	BRA         L_main34
	DECFSZ      R11, 1, 1
	BRA         L_main34
	NOP
;Lab74.c,125 :: 		Lcd_Cmd(_LCD_CLEAR); // Clear Display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Lab74.c,126 :: 		} while(1);
	GOTO        L_main14
;Lab74.c,128 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
