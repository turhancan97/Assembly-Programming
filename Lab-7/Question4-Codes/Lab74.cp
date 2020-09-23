#line 1 "C:/Users/asus/Desktop/Mikro Lablar/Lab7/Question4-Codes/Lab74.c"

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

char kpi; kpi1; kpi2; total1; total; counter; remainder;
char lookup_table[] = " 741 8520963=/*-+" ;
int i ; b;
void main() {
ANSELB = 0;
ANSELD = 0;
ANSELE = 0;
Lcd_Init();
Lcd_Cmd(_LCD_CLEAR);
Lcd_Cmd(_LCD_CURSOR_OFF);
Lcd_Cmd(_LCD_CLEAR);


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
Lcd_Cmd(_LCD_CLEAR);
delay_ms(500);
Keypad_Init();
Lcd_Out(1,1,"Write a Number");
Lcd_Out(2,1,"to Convert");
delay_ms(1000);
Lcd_Cmd(_LCD_CLEAR);
do
{
kpi = 0;

do
kpi = Keypad_Key_Click();

while (!kpi);
if (kpi <= 16) {
kpi = lookup_table[kpi]; }
Lcd_Chr(1, 2, kpi);
kpi1= 0;

do
kpi1 = Keypad_Key_Click();

while (!kpi1);
if (kpi1<= 16) {
kpi1= lookup_table[kpi1];
}

Lcd_Chr(1, 3, kpi1);

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

for (b = 8; b != 0; b--)
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
Lcd_Cmd(_LCD_CLEAR);
} while(1);

}
