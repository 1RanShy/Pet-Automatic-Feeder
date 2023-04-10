#include<pigpio.h>
#include<iostream>
#include"./include/Blue.h"

using namespace std;
int main(void)
{
    Blue ble;
    char buff[10] = {'H', 'E', 'L', 'L', 'o'};
    unsigned char x = 'H';
    int  serialStatus = serOpen("/dev/serial0", 115200, 0);
    while (1)
    {
        // ble.readBytes(buff); // output character HEX/ASCII
        // ble.sendByte(x);
        // ble.writeBytes(buff, 5);
        // cout << x <<endl;
        // ble.readByte();
        
        if (serDataAvailable(serialStatus)) // 先判断有没有数据读
        {
            cout << serReadByte(serialStatus) << endl;
            while (serDataAvailable(serialStatus));
            //     ; // 有数据读就读直到读完
        }
        // gpioDelay(200000);
        // gpioDelay(1000000);
        // ble.readBytes(buff);
    }
    return 0;
}
