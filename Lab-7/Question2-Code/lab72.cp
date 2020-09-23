#line 1 "C:/Users/asus/Desktop/Mikro Lablar/Lab7/Question2-Code/lab72.c"

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
void main() {

 ANSELB=0;
 ANSELE=0;
 TRISB=0x00;
 TRISE=0x00;
 PORTB=0x00;
 PORTE=0x00;
 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1, 6, "02:00");
 Delay_ms(750);
 Lcd_Cmd(_LCD_CLEAR);

 for (j=59;j>=0;j--)
 {
 ByteToStr(j, display1);
 Lcd_Out(1, 8, display1);
 Lcd_Out(1, 7, "1");
 Lcd_Out(1, 6, "0");
 Lcd_Out(1, 8, ":");
 Delay_ms(100);

 if (j == 0)
 {
 for (i=59;i>=0;i--)
 {
 ByteToStr(i, display2);
 Lcd_Out(1, 8, display2);
 Lcd_Out(1, 7, "0");
 Lcd_Out(1, 6, "0");
 Lcd_Out(1, 8, ":");
 Delay_ms(100);

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
