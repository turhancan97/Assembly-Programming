unsigned cntr=0;
void interrupt() // Interrupt
{
    if(INT0IF_bit==1)
   {
     cntr++;
     if(cntr>=10) // Turning on LED after 10 packages
     {
      PORTb.RB1=1;        // LED = 1
      Delay_ms(5000);     // Wait 5sec
      PORTB.RB1=0;        // LED = 0
      Delay_ms(1000);     // wait 1sec
      cntr=0;              // cntr = 0
     }
   }
   INT0IF_bit=0;
}
void main() {
ANSELB=0;               // Input - Output Configuration
ANSELD=0;
TRISB=0b00000001;
TRISD=0;

INTEDG0_bit=0;          // Interrupt Setup
INT0IF_bit=0;          // clear
INT0IE_bit=1;         // enable
GIE_bit=1;

while(1)
{
 PORTD=cntr; // To show how many packages we counted
}
}