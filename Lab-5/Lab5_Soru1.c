#include <xc.h>

//***Define the signal pins of all four displays***//
#define s1 PORTAbits.RA0
#define s2 PORTAbits.RA1
#define s3 PORTAbits.RA2
#define s4 PORTAbits.RA3
//***End of definition**////

void main()
{

unsigned int a,b,c,d,e,f; //just variables
unsigned int g = 0; //1st digit is saved here
int i = 0; //the 4-digit value that is to be displayed
int flag = 0; //for creating small delay

unsigned int seg[]={0X3F, //Hex value to display the number 0
                    0X06, //Hex value to display the number 1
                    0X5B, //Hex value to display the number 2
                    0X4F, //Hex value to display the number 3
                    0X66, //Hex value to display the number 4
                    0X6D, //Hex value to display the number 5
                    0X7C, //Hex value to display the number 6
                    0X07, //Hex value to display the number 7
                    0X7F, //Hex value to display the number 8
                    0X6F  //Hex value to display the number 9
                   }; //End of Array for displaying numbers from 0 to 9

//*****I/O Configuration****//
TRISB=0X00;
PORTB=0X00;
TRISA=0x00;
PORTA=0X00;
//***End of I/O configuration**///

#define _XTAL_FREQ 20000000

while(1)
{
  //***Splitting "i" into four digits***//  
a=i%10;//4th digit is saved here
b=i/10;
c=b%10;//3rd digit is saved here
d=b/10;
e=d%10; //2nd digit is saved here
f=d/10;
//***End of splitting***//

if (seg[e] == 0X7C )
    
{
    i=0;
    g=g+1;
}

PORTB=seg[g];s1=1; //Turn ON display 1 and print 4th digit
__delay_ms(1);s1=0;     //Turn OFF display 1 after 2ms delay
PORTB=seg[e];s2=1; //Turn ON display 2 and print 3rd digit
__delay_ms(2);s2=0;     //Turn OFF display 2 after 2ms delay
PORTB=seg[c];s3=1; //Turn ON display 3 and print 2nd digit
__delay_ms(2);s3=0;     //Turn OFF display 3 after 2ms delay
PORTB=seg[a];s4=1; //Turn ON display 4 and print 1st digit
__delay_ms(2);s4=0;     //Turn OFF display 4 after 2ms delay

  
  
    
if(flag>=1) //wait till flag reaches 100
{
    i++;flag=0; //only if flag is hundred "i" will be incremented 
}
flag++; //increment flag for each flash
}
}
