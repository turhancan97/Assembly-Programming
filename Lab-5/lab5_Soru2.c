#include <xc.h>

//***Define the signal pins of all four displays***//
#define s1 PORTAbits.RA0
#define s2 PORTAbits.RA1
#define s3 PORTAbits.RA2
#define s4 PORTAbits.RA3
//***End of definition**////

void main()
{
int a=0;
static char flow;
unsigned int seg[]={0X78,0X3E,0X7B,0X76,0X77,0X54,0x00,0X39,0X77,0X54,0x00,0X7A,0X77,0X7B,0X3D,
0X30,0X54,0x00,0x06,0x6D,0x3F,0X66,0X3F,0X4F,0X3F,0X3F,0X6D,0X00,
                    }; //End of Array for displaying Name,Surname,Number

//*****I/O Configuration****//
TRISB=0X00;
PORTB=0X00;
TRISA=0x00;
PORTA=0X00;
//***End of I/O configuration**///

#define _XTAL_FREQ 20000000

while(1) // infine loop
{
    turhan: // when the process is done, it will come here and start again
    flow=0; // f=0
if (flow == 0) // Start
{
    for (int i = 0; i<25; ++i) // for loop to wait a little while
    {
        s1= 1;             // RA0=1
        PORTB=seg[0];      // Write "T" to the 1st digit
        __delay_ms(2);     // very small delay
        s1=0;              // RA0=0
        s2=1;              // RA1=1
        PORTB=seg[1];      // Write "U" to the 2nd digit
        __delay_ms(2);     // very small delay
        s2=0;              // RA1=0
        s3=1;              // RA2=1
        PORTB=seg[2];      // Write "R" to the 3th digit
        __delay_ms(2);     // very small delay
        s3=0;              // RA2=0
        s4=1;              // RA3=1
        PORTB=seg[3];      // Write "H" to the 3th digit
        __delay_ms(2);     // very small delay
        s4=0;              // RA3=0
    }
flow = 1;
}       
 
if (flow == 1)
{
    for (int i = 0; i<25; ++i)
    {
        s1= 1;             
        PORTB=seg[1];       // Write "U" to the 1st digit
        __delay_ms(2);      // very small delay
        s1=0;
        s2=1;
        PORTB=seg[2];       // Write "R" to the 1st digit
        __delay_ms(2);      // very small delay
        s2=0;
        s3=1;
        PORTB=seg[3];       // Write "H" to the 1st digit
        __delay_ms(2);      // very small delay
        s3=0;
        s4=1;
        PORTB=seg[4];       // Write "A" to the 1st digit
        __delay_ms(2);      // very small delay
        s4=0;
}
    flow=2;
}    

if (flow == 2)
{
    for (int i = 0; i<25; ++i)
    {
        s1= 1;             
        PORTB=seg[2];       // Write "R" to the 1st digit
        __delay_ms(2);
        s1=0;
        s2=1;
        PORTB=seg[3];       // Write "H" to the 1st digit
        __delay_ms(2);
        s2=0;
        s3=1;
        PORTB=seg[4];       // Write "A" to the 1st digit
        __delay_ms(2);
        s3=0;
        s4=1;
        PORTB=seg[5];       // Write "N" to the 1st digit
        __delay_ms(2);
        s4=0;
}
    flow=3;
}   

if (flow == 3)
{
    for (int i = 0; i<25; ++i)
    {
        s1= 1;             
        PORTB=seg[3];       // Write "H" to the 1st digit
        __delay_ms(2);
        s1=0;
        s2=1;
        PORTB=seg[4];       // Write "A" to the 1st digit
        __delay_ms(2);
        s2=0;
        s3=1;
        PORTB=seg[5];       // Write "N" to the 1st digit
        __delay_ms(2);
        s3=0;
        s4=1;
        PORTB=seg[6];       // Write " " to the 1st digit
        __delay_ms(2);
        s4=0;
}
    flow=4;
}

if (flow == 4)
{
    for (int i = 0; i<25; ++i)
    {
        s1= 1;             
        PORTB=seg[4];       // Write "A" to the 1st digit
        __delay_ms(2);
        s1=0;
        s2=1;
        PORTB=seg[5];       // Write "N" to the 1st digit
        __delay_ms(2);
        s2=0;
        s3=1;
        PORTB=seg[6];       // Write " " to the 1st digit
        __delay_ms(2);
        s3=0;
        s4=1;
        PORTB=seg[7];       // Write "C" to the 1st digit
        __delay_ms(2);
        s4=0;
}
    flow=5;
}

if (flow == 5)
{
    for (int i = 0; i<25; ++i)
    {
        s1= 1;             
        PORTB=seg[5];       // Write "N" to the 1st digit
        __delay_ms(2);
        s1=0;
        s2=1;
        PORTB=seg[6];       // Write " " to the 1st digit   
        __delay_ms(2);
        s2=0;
        s3=1;
        PORTB=seg[7];       // Write "C" to the 1st digit
        __delay_ms(2);
        s3=0;
        s4=1;
        PORTB=seg[8];       // Write "A" to the 1st digit
        __delay_ms(2);
        s4=0;
}
    flow=6;
}

if (flow == 6)
{
    for (int i = 0; i<25; ++i)
    {
        s1= 1;             
        PORTB=seg[6];       // Write " " to the 1st digit
        __delay_ms(2);
        s1=0;
        s2=1;
        PORTB=seg[7];       // Write "C" to the 1st digit
        __delay_ms(2);
        s2=0;
        s3=1;
        PORTB=seg[8];       // Write "A" to the 1st digit
        __delay_ms(2);
        s3=0;
        s4=1;
        PORTB=seg[9];       // Write "N" to the 1st digit
        __delay_ms(2);
        s4=0;
}
    flow=7;
}

if (flow == 7)
{
    for (int i = 0; i<25; ++i)
    {
        s1= 1;             
        PORTB=seg[7];
        __delay_ms(2);
        s1=0;
        s2=1;
        PORTB=seg[8];
        __delay_ms(2);
        s2=0;
        s3=1;
        PORTB=seg[9];
        __delay_ms(2);
        s3=0;
        s4=1;
        PORTB=seg[10];
        __delay_ms(2);
        s4=0;
}
    flow=8;
}
if (flow == 8)
{
    for (int i = 0; i<25; ++i)
    {
        s1= 1;             
        PORTB=seg[8];
        __delay_ms(2);
        s1=0;
        s2=1;
        PORTB=seg[9];
        __delay_ms(2);
        s2=0;
        s3=1;
        PORTB=seg[10];
        __delay_ms(2);
        s3=0;
        s4=1;
        PORTB=seg[11];
        __delay_ms(2);
        s4=0;
}
    flow=9;
}
if (flow == 9)
{
    for (int i = 0; i<25; ++i)
    {
        s1= 1;             
        PORTB=seg[9];
        __delay_ms(2);
        s1=0;
        s2=1;
        PORTB=seg[10];
        __delay_ms(2);
        s2=0;
        s3=1;
        PORTB=seg[11];
        __delay_ms(2);
        s3=0;
        s4=1;
        PORTB=seg[12];
        __delay_ms(2);
        s4=0;
}
    flow=10;
}
if (flow == 10)
{
    for (int i = 0; i<25; ++i)
    {
        s1= 1;             
        PORTB=seg[10];
        __delay_ms(2);
        s1=0;
        s2=1;
        PORTB=seg[11];
        __delay_ms(2);
        s2=0;
        s3=1;
        PORTB=seg[12];
        __delay_ms(2);
        s3=0;
        s4=1;
        PORTB=seg[13];
        __delay_ms(2);
        s4=0;
}
    flow=11;
}

if (flow == 11)
{
    for (int i = 0; i<25; ++i)
    {
        s1= 1;             
        PORTB=seg[11];
        __delay_ms(2);
        s1=0;
        s2=1;
        PORTB=seg[12];
        __delay_ms(2);
        s2=0;
        s3=1;
        PORTB=seg[13];
        __delay_ms(2);
        s3=0;
        s4=1;
        PORTB=seg[14];
        __delay_ms(2);
        s4=0;
}
    flow=12;
}

if (flow == 12)
{
    for (int i = 0; i<25; ++i)
    {
        s1= 1;             
        PORTB=seg[12];
        __delay_ms(2);
        s1=0;
        s2=1;
        PORTB=seg[13];
        __delay_ms(2);
        s2=0;
        s3=1;
        PORTB=seg[14];
        __delay_ms(2);
        s3=0;
        s4=1;
        PORTB=seg[15];
        __delay_ms(2);
        s4=0;
}
    flow=13;
}

if (flow == 13)
{
    for (int i = 0; i<25; ++i)
    {
        s1= 1;             
        PORTB=seg[13];
        __delay_ms(2);
        s1=0;
        s2=1;
        PORTB=seg[14];
        __delay_ms(2);
        s2=0;
        s3=1;
        PORTB=seg[15];
        __delay_ms(2);
        s3=0;
        s4=1;
        PORTB=seg[16];
        __delay_ms(2);
        s4=0;
}
    flow=14;
}

if (flow == 14)
{
    for (int i = 0; i<25; ++i)
    {
        s1= 1;             
        PORTB=seg[14];
        __delay_ms(2);
        s1=0;
        s2=1;
        PORTB=seg[15];
        __delay_ms(2);
        s2=0;
        s3=1;
        PORTB=seg[16];
        __delay_ms(2);
        s3=0;
        s4=1;
        PORTB=seg[17];
        __delay_ms(2);
        s4=0;
}
    flow=15;
}

if (flow == 15)
{
    for (int i = 0; i<25; ++i)
    {
        s1= 1;             
        PORTB=seg[15];
        __delay_ms(2);
        s1=0;
        s2=1;
        PORTB=seg[16];
        __delay_ms(2);
        s2=0;
        s3=1;
        PORTB=seg[17];
        __delay_ms(2);
        s3=0;
        s4=1;
        PORTB=seg[18];
        __delay_ms(2);
        s4=0;
}
    flow=16;
}

if (flow == 16)
{
    for (int i = 0; i<25; ++i)
    {
        s1= 1;             
        PORTB=seg[16];
        __delay_ms(2);
        s1=0;
        s2=1;
        PORTB=seg[17];
        __delay_ms(2);
        s2=0;
        s3=1;
        PORTB=seg[18];
        __delay_ms(2);
        s3=0;
        s4=1;
        PORTB=seg[19];
        __delay_ms(2);
        s4=0;
}
    flow=17;
}

if (flow == 17)
{
    for (int i = 0; i<25; ++i)
    {
        s1= 1;             
        PORTB=seg[17];
        __delay_ms(2);
        s1=0;
        s2=1;
        PORTB=seg[18];
        __delay_ms(2);
        s2=0;
        s3=1;
        PORTB=seg[19];
        __delay_ms(2);
        s3=0;
        s4=1;
        PORTB=seg[20];
        __delay_ms(2);
        s4=0;
}
    flow=18;
}
if (flow == 18)
{
    for (int i = 0; i<25; ++i)
    {
        s1= 1;             
        PORTB=seg[18];
        __delay_ms(2);
        s1=0;
        s2=1;
        PORTB=seg[19];
        __delay_ms(2);
        s2=0;
        s3=1;
        PORTB=seg[20];
        __delay_ms(2);
        s3=0;
        s4=1;
        PORTB=seg[21];
        __delay_ms(2);
        s4=0;
}
    flow=19;
}

if (flow == 19)
{
    for (int i = 0; i<25; ++i)
    {
        s1= 1;             
        PORTB=seg[19];
        __delay_ms(2);
        s1=0;
        s2=1;
        PORTB=seg[20];
        __delay_ms(2);
        s2=0;
        s3=1;
        PORTB=seg[21];
        __delay_ms(2);
        s3=0;
        s4=1;
        PORTB=seg[22];
        __delay_ms(2);
        s4=0;
}
    flow=20;
}

if (flow == 20)
{
    for (int i = 0; i<25; ++i)
    {
        s1= 1;             
        PORTB=seg[20];
        __delay_ms(2);
        s1=0;
        s2=1;
        PORTB=seg[21];
        __delay_ms(2);
        s2=0;
        s3=1;
        PORTB=seg[22];
        __delay_ms(2);
        s3=0;
        s4=1;
        PORTB=seg[23];
        __delay_ms(2);
        s4=0;
}
    flow=21;
}
if (flow == 21)
{
    for (int i = 0; i<25; ++i)
    {
        s1= 1;             
        PORTB=seg[21];
        __delay_ms(2);
        s1=0;
        s2=1;
        PORTB=seg[22];
        __delay_ms(2);
        s2=0;
        s3=1;
        PORTB=seg[23];
        __delay_ms(2);
        s3=0;
        s4=1;
        PORTB=seg[24];
        __delay_ms(2);
        s4=0;
}
    flow=22;
}
if (flow == 22)
{
    for (int i = 0; i<25; ++i)
    {
        s1= 1;             
        PORTB=seg[22];
        __delay_ms(2);
        s1=0;
        s2=1;
        PORTB=seg[23];
        __delay_ms(2);
        s2=0;
        s3=1;
        PORTB=seg[24];
        __delay_ms(2);
        s3=0;
        s4=1;
        PORTB=seg[25];
        __delay_ms(2);
        s4=0;
}
    flow=23;
}
if (flow == 23)
{
    for (int i = 0; i<25; ++i)
    {
        s1= 1;             
        PORTB=seg[23];
        __delay_ms(2);
        s1=0;
        s2=1;
        PORTB=seg[24];
        __delay_ms(2);
        s2=0;
        s3=1;
        PORTB=seg[25];
        __delay_ms(2);
        s3=0;
        s4=1;
        PORTB=seg[26];
        __delay_ms(2);
        s4=0;
}
    flow=24;
}
if (flow == 24)
{
    for (int i = 0; i<25; ++i)
    {
        s1= 1;             
        PORTB=seg[24];
        __delay_ms(2);
        s1=0;
        s2=1;
        PORTB=seg[25];
        __delay_ms(2);
        s2=0;
        s3=1;
        PORTB=seg[26];
        __delay_ms(2);
        s3=0;
        s4=1;
        PORTB=seg[27];
        __delay_ms(2);
        s4=0;
}
    flow = 25;
}
    if (flow == 25)
{
    for (int i = 0; i<25; ++i)
    {
        s1= 1;             
        PORTB=seg[25];
        __delay_ms(2);
        s1=0;
        s2=1;
        PORTB=seg[26];
        __delay_ms(2);
        s2=0;
        s3=1;
        PORTB=seg[27];
        __delay_ms(2);
        s3=0;
        s4=1;
        PORTB=seg[27];
        __delay_ms(2);
        s4=0;
}
    flow = 26;
}
    if (flow == 26)
{
    for (int i = 0; i<25; ++i)
    {
        s1= 1;             
        PORTB=seg[26];
        __delay_ms(2);
        s1=0;
        s2=1;
        PORTB=seg[27];
        __delay_ms(2);
        s2=0;
        s3=1;
        PORTB=seg[27];
        __delay_ms(2);
        s3=0;
        s4=1;
        PORTB=seg[27];
        __delay_ms(2);
        s4=0;
}
    flow = 27;
}
     if (flow == 27)
{
    for (int i = 0; i<25; ++i)
    {
        s1= 1;             
        PORTB=seg[27];
        __delay_ms(2);
        s1=0;
        s2=1;
        PORTB=seg[27];
        __delay_ms(2);
        s2=0;
        s3=1;
        PORTB=seg[27];
        __delay_ms(2);
        s3=0;
        s4=1;
        PORTB=seg[27];
        __delay_ms(2);
        s4=0;
}
    flow = 27;
}
if (flow==27) // if command to start from the beginning
{
    goto turhan; // go to starting point of the while(1) loop
}
 

}
}



