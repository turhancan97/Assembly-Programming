// Keypad module connections
char keypadPort at PORTD;
// LCD Module connections
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
// Asignments
char kpi; kpi1; kpi2; total1; total; counter; remainder;
char lookup_table[] = " 741 8520963=/*-+" ;
int i ; b;
void main() {
ANSELB = 0;                              // Configure AN pins as digital I/O
ANSELD = 0;
ANSELE = 0;
Lcd_Init(); // Initialize LCD
Lcd_Cmd(_LCD_CLEAR); // Clear Display
Lcd_Cmd(_LCD_CURSOR_OFF); // Cursor Off
Lcd_Cmd(_LCD_CLEAR);
// When power is applied to the system, 
// the LCD displays text “Decimal to Binary Converter” for 2 seconds by scrolling
  Lcd_Out(2,1,"Decimal to Binary Converter”");
  Delay_ms(125);
  Lcd_Cmd(_LCD_CLEAR);
  Lcd_Out(2,0,"Decimal to Binary Converter”");
  Delay_ms(125);
  Lcd_Cmd(_LCD_CLEAR);
  Lcd_Out(2,-1,"Decimal to Binary Converter”");
  Delay_ms(125);
  Lcd_Cmd(_LCD_CLEAR);
  Lcd_Out(2,-2,"Decimal to Binary Converter”");
  Delay_ms(125);
  Lcd_Cmd(_LCD_CLEAR);
  Lcd_Out(2,-3,"Decimal to Binary Converter”");
  Delay_ms(125);
  Lcd_Out(2,-4,"Decimal to Binary Converter”");
  Delay_ms(125);
  Lcd_Cmd(_LCD_CLEAR);
  Lcd_Out(2,-5,"Decimal to Binary Converter”");
  Delay_ms(125);
  Lcd_Cmd(_LCD_CLEAR);
  Lcd_Out(2,-6,"Decimal to Binary Converter”");
  Delay_ms(125);
  Lcd_Cmd(_LCD_CLEAR);
  Lcd_Out(2,-7,"Decimal to Binary Converter”");
  Delay_ms(125);
  Lcd_Cmd(_LCD_CLEAR);
  Lcd_Out(2,-8,"Decimal to Binary Converter”");
  Delay_ms(125);
  Lcd_Cmd(_LCD_CLEAR);
  Lcd_Out(2,-9,"Decimal to Binary Converter”");
  Delay_ms(125);
  Lcd_Cmd(_LCD_CLEAR);
  Lcd_Out(2,-10,"Decimal to Binary Converter”");
  Delay_ms(250);
Lcd_Cmd(_LCD_CLEAR); // Clear Display
delay_ms(500); // Delay of 0.5s
Keypad_Init(); // Initialize Keypad
Lcd_Out(1,1,"Write a Number"); // Write "Write a Number" in the first row
Lcd_Out(2,1,"to Convert"); // Write "to Convert" in the first row
delay_ms(1000); // Delay of 0.5s
Lcd_Cmd(_LCD_CLEAR); // Clear Display
do
{
kpi = 0; // Reset key code variable
// Wait for key to be pressed and released
do
kpi = Keypad_Key_Click(); // Store key code in kpi variable

while (!kpi);
if (kpi <= 16) {
kpi = lookup_table[kpi]; }
Lcd_Chr(1, 2, kpi); // Print key ASCII value on Lcd
kpi1= 0; // Reset key code variable
// Wait for key to be pressed and released
do
kpi1 = Keypad_Key_Click(); // Store key code in kpi variable

while (!kpi1);
if (kpi1<= 16) {
kpi1= lookup_table[kpi1];
}

Lcd_Chr(1, 3, kpi1); // Print key ASCII value on Lcd

kpi2 = 0;
do
kpi2 = Keypad_Key_Click();
while(!kpi2);
if(kpi2<= 16){

kpi2 = lookup_table[kpi2];
}
Lcd_Chr(1, 4, kpi2);
kpi &= 0x0F;
kpi1 &= 0x0F;
kpi2 &= 0x0F;
total = 0;
total = (kpi*100) + (kpi1*10) + kpi2 ;

for (b = 8; b != 0; b--) //loop 8 times
{ {
remainder = total%2;
total = total/2;
if (remainder==1)
{
Lcd_Chr(2,b,'1');
}

else
Lcd_Chr( 2,b,'0');

}
}
delay_ms(3000);
Lcd_Cmd(_LCD_CLEAR); // Clear Display
} while(1);

}