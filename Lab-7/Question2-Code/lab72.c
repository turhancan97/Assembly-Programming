// LCD module connections
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
// Assignments
char display1[4];
char display2[4];
char i;
char j;
char k;
void main() {
  // Configure AN pins as digital I/O
  ANSELB=0;
  ANSELE=0;
  TRISB=0x00;
  TRISE=0x00;
  PORTB=0x00;
  PORTE=0x00;
  Lcd_Init();                      // Initialize LCD
  Lcd_Cmd(_LCD_CLEAR);             // Clear display
  Lcd_Cmd(_LCD_CURSOR_OFF);        // Cursor off
    Lcd_Out(1, 6, "02:00");        // It will start with 02:00
    Delay_ms(750);                // delay
    Lcd_Cmd(_LCD_CLEAR);           // Clear display
    // For loop for counter
    for (j=59;j>=0;j--)            // count-down from 01.59
    {
  ByteToStr(j, display1);          // We should convert char to string
  Lcd_Out(1, 8, display1);         // and show it in LCD
  Lcd_Out(1, 7, "1");
  Lcd_Out(1, 6, "0");
  Lcd_Out(1, 8, ":");
  Delay_ms(100);
  
  if (j == 0)                     // when it will be 01:00
  {
        for (i=59;i>=0;i--)       // count-down from 00.59
    {
  ByteToStr(i, display2);         // We should convert char to string
  Lcd_Out(1, 8, display2);        // and show it in LCD
  Lcd_Out(1, 7, "0");
  Lcd_Out(1, 6, "0");
  Lcd_Out(1, 8, ":");
  Delay_ms(100);
  
  if (i <= 0)                    // when the count-down is over
  {
    goto turhan;                 // it will go to turhan go make 00:00 forever
  }
}
}
}
  while(1){
  turhan:
  Lcd_Out(1, 6, "00:00");      // make 00:00 forever
  }
}