#line 1 "C:/Users/asus/Desktop/Mikro Lablar/Lab.6.X/MikroC/lab6.1/_dev61.c"
unsigned cntr=0;
void interrupt()
{
 if(INT0IF_bit==1)
 {
 cntr++;
 if(cntr>=10)
 {
 PORTb.RB1=1;
 Delay_ms(5000);
 PORTB.RB1=0;
 Delay_ms(1000);
 cntr=0;
 }
 }
 INT0IF_bit=0;
}
void main() {
ANSELB=0;
ANSELD=0;
TRISB=0b00000001;
TRISD=0;

INTEDG0_bit=0;
INT0IF_bit=0;
INT0IE_bit=1;
GIE_bit=1;

while(1)
{
 PORTD=cntr;
}
}
