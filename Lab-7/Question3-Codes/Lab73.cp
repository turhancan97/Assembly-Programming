#line 1 "C:/Users/asus/Desktop/Mikro Lablar/Lab7/Question3-Codes/Lab73.c"

char keypadPort at PORTD;


sbit LCD_RS at RE1_bit;
sbit LCD_EN at RE0_bit;
sbit LCD_D4 at RB4_bit;
sbit LCD_D5 at RB5_bit;
sbit LCD_D6 at RB6_bit;
sbit LCD_D7 at RB7_bit;

sbit LCD_RS_Direction at TRISE0_bit;
sbit LCD_EN_Direction at TRISE1_bit;
sbit LCD_D4_Direction at TRISB4_bit;
sbit LCD_D5_Direction at TRISB5_bit;
sbit LCD_D6_Direction at TRISB6_bit;
sbit LCD_D7_Direction at TRISB7_bit;

char display1[4];
char display2[4];
char i;
char j;
char k;
unsigned short kp, count, oldstate = 0;
char txt[6];
void main() {
 count = 5;
 Keypad_Init();
 ANSELB = 0;
 ANSELD = 0;
 ANSELE = 0;
 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);

 Lcd_Out(1, 1, "Enter Four Digits");
 Lcd_Out(2, 1, "After 2 seconds");
 delay_ms(2000);
 Lcd_Cmd(_LCD_CLEAR);

 do {
 kp = 0;


 do
 kp = Keypad_Key_Click();
 while (!kp);

 switch (kp) {
 case 1: kp = 49; break;
 case 2: kp = 50; break;
 case 3: kp = 51; break;
 case 4: kp = 65; break;
 case 5: kp = 52; break;
 case 6: kp = 53; break;
 case 7: kp = 54; break;
 case 8: kp = 66; break;
 case 9: kp = 55; break;
 case 10: kp = 56; break;
 case 11: kp = 57; break;
 case 12: kp = 67; break;
 case 13: kp = 42; break;
 case 14: kp = 48; break;
 case 15: kp = 35; break;
 case 16: kp = 68; break;

 }

 Lcd_Chr(1,++count, kp);
 Lcd_Out(1,8, ":");
 delay_ms(100);

 if (count == 10) {

 Lcd_Cmd(_LCD_CLEAR);
 for (j=59;j>=0;j--)
 {
 ByteToStr(j, display1);
 Lcd_Out(1, 8, display1);
 Lcd_Out(1, 7, "1");
 Lcd_Out(1, 6, "0");
 Lcd_Out(1, 8, ":");
 Delay_ms(250);

 if (j == 0)
 {
 Lcd_Cmd(_LCD_CLEAR);
 for (i=59;i>=0;i--)
 {
 ByteToStr(i, display2);
 Lcd_Out(1, 8, display2);
 Lcd_Out(1, 7, "0");
 Lcd_Out(1, 6, "0");
 Lcd_Out(1, 8, ":");
 Delay_ms(250);
 if (i <= 0)
 {
 goto turhan;
 }
}
}
}
 while(1){
 turhan:
 Lcd_Out(1, 6, "00:00");
 }
}
 } while (1);
}
