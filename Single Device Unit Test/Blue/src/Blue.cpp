#include <pigpio.h>
#include <iostream>
#include "../include/Blue.h"
using namespace std;


Blue::Blue()
{
    if (gpioInitialise() < 0)
    {
        cout << "Failed" << endl;
    }
    else
    {
        cout << "PIGPIO is ready" << endl;
    }

    status = serOpen("/dev/ttyS0", 9600, 0);
    cout << status << endl;

    if (status < 0)
    {
        cout << "Fail to open Serial port." << endl;
    }
    else
    {
        cout << "Success to Open" << endl;
    }
}

Blue::~Blue()
{

}

void Blue::sendByte(unsigned char c)
{
    serWriteByte(status, c);
}

void Blue::writeBytes(char *buff, unsigned char count)
{
    serWrite(status, buff, count);
}

void Blue::readBytes(char *buff)
{
    int count = serDataAvailable(status);
    if (count)
    {
        serRead(status, buff, count);
        while (serDataAvailable(status))
            ; // 有数据读就读直到读完
        cout << buff[0] << endl;
    }
}

void Blue::readByte(unsigned char *chara)
{
    cout << "Sth" << endl;
    if (serDataAvailable(status)) // 先判断有没有数据读
    {
        *chara = serReadByte(status);
        cout << *chara << endl; 
        while (serDataAvailable(status))
            ; // 有数据读就读直到读完
    }
    /*
     * add delay is ok. Because read also need time.
     */
}
