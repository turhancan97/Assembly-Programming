unsigned cnt;   // Assignings
int  freq=0;
char txt[7];
char hex[7];
int high;
int low;
void main() {

  ANSELA=0;                        // Configure pins as digital I/O
  ANSELB=0;
  ANSELC=0;
  ANSELD=0;
  ANSELE=0;
  TRISA=0xFF;
  TRISB=0b00000001;
  TRISC=0;
  TRISD=0;
  TRISE=0;
  PORTA=0x00;
  PORTE=0x00;
  PORTC=0x99;
  PORTD=0x99;
  Delay_ms(80);
  PORTC=0x88;
  PORTD=0x88;
  Delay_ms(80);
  PORTC=0x77;
  PORTD=0x77;
  Delay_ms(80);
  PORTC=0x66;
  PORTD=0x66;
  Delay_ms(80);
  PORTC=0x55;
  PORTD=0x55;
  Delay_ms(80);
  PORTC=0x44;
  PORTD=0x44;
  Delay_ms(80);
  PORTC=0x33;
  PORTD=0x33;
  Delay_ms(80);
  PORTC=0x22;
  PORTD=0x22;
  Delay_ms(80);
  PORTC=0x11;
  PORTD=0x11;
  Delay_ms(80);
  PORTC=0x00;
  PORTD=0x00;
  
  // Setup Interrupt
   T0CON=0b10101000;
   TMR0H=0x77;
   TMR0L=0x77;

   TMR1H=0x3C;
   TMR1L=0xB0;
   T1CON = 0b00000111;
   INTCON=0xC0;
   TMR1IE_bit = 1;

   PORTC=0x77;
   PORTD=0x77;
   
   
   while(1)
   {
   low=TMR0L;
   high=TMR0H;
   if(cnt >=20) // 10 ms * 100 = 1000 ms 0 1 sn
   {
    PORTE.RE2 = ~ PORTE.RE2;
    freq=low-0x77+(256*(high-0x77));  // Calculating Frequency

     IntToStr(freq,hex);
    while(cnt>=20)
    {
     IntToStr(freq,hex);
     if(freq>100&&freq<200)           // frequency value between 100-200Hz
     {
      PORTC=PORTC-0x01;
      if(PORTC==0x00)
      {
      PORTD=PORTD-0x01;
      }
     }
     if(freq>200&&freq<300)         // frequency value between 200-300Hz
     {
      PORTC=PORTC+0x01;
      if(PORTC==0xFF)
      {
      PORTD=PORTD+0x01;
      }
     }

    }
    cnt=0;
   }

   IntToStr(cnt,txt);

  }
}
void interrupt()  // Interrupt
{
 if(TMR0IF_bit)
 {
  TMR0H= 0x77;
  TMR0L= 0x77;
  TMR0IF_bit=0;
 }
 if(TMR1IF_bit)
 {
  cnt++;
  TMR1H=0X3C;
  TMR1L=0xB0;
  TMR1IF_bit=0;
 }
}
