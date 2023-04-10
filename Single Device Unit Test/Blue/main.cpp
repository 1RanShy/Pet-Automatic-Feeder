#include<pigpio.h>
#include<iostream>
#include"./include/Blue.h"

using namespace std;
int main(void)
{
    Blue ble;
    char buff[10] = {'H', 'E', 'L', 'L', 'o'};
    unsigned char c = 'A';
    while (1)
    {
        // sendByte(x, 'H');
        // ble.readByte(&c);
        // ble.sendByte('A');
        // ble.readBytes(buff);
        // cout<< buff[0] << "   " << buff[1] << "  " << buff[2] << " " << buff[3] << buff[4] << endl; 
        ble.writeBytes(buff, 5);
        gpioDelay(500000);
        
    }
    return 0;
}
