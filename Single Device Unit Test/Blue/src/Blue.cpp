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
    //initialise the serial library
    serialStatus = serOpen(name, 9600, 0);
    cout << serialStatus << endl;

    if (serialStatus < 0)
    {
        cout << "Fail to open Serial port." << endl;
    }
    else
    {
        cout << "Success to Open" << endl;
    }

}

void Blue::sendByte(char c)
{
    serWriteByte(serialStatus, c);
    gpioSleep(PI_TIME_RELATIVE, 0, 500000); // sleep for 1.5
}

void Blue::readByte()
{
    if (serDataAvailable(serialStatus)) // 先判断有没有数据读
    {

        cout << serReadByte(serialStatus) << endl;
        while (serDataAvailable(serialStatus))
            ; // 有数据读就读直到读完
    }
    /*
     * add delay is ok. Because read also need time.
     */
}

void Blue::writeBytes(char *buff, unsigned char count)
{
    serWrite(serialStatus, buff, count);
}

void Blue::readBytes(char *buff)
{
    unsigned char count  = serDataAvailable(serialStatus); //The number of bytes in buffer
    if (count)
    {
        serRead(serialStatus, buff, count);
        while (serDataAvailable(serialStatus))
            ; // 有数据读就读直到读完
        cout << buff[0] << endl;
    }
}

