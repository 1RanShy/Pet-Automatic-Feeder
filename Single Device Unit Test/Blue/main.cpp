#include<pigpio.h>
#include<iostream>
#include"./include/Blue.h"

using namespace std;
int main(void)
{
    Blue ble;
    char buff[10] = {1, 2, 3, 4, 5};
    while (1)
    {
        ble.readBytes(buff); // output character HEX/ASCII
        ble.sendByte(buff[0]);
        ble.writeBytes(buff, 5);
    }
    return 0;
}
