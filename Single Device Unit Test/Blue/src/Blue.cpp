#include <pigpio.h>
#include <iostream>
#include "../include/Blue.h"
using namespace std;

Blue::Blue()
{
    gpioTerminate();
    if (gpioInitialise() < 0)
    {
        cout << "Failed" << endl;
    }
    else
    {
        cout << "PIGPIO is ready" << endl;
    }
    //initialise the serial library
    // gpioSetMode(14, PI_INPUT);  // Set GPIO17 as input.
    // gpioSetMode(15, PI_OUTPUT);  // Set GPIO17 as input.
    // gpioSetMode(14, PI_ALT0);
    // gpioSetMode(15, PI_ALT0);
    serialStatus = serOpen("/dev/serial0", 115200, 0);
    
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

void Blue::sendByte(unsigned char c)
{
    serWriteByte(serialStatus, c);
    cout << "sent" <<endl;
    gpioSleep(PI_TIME_RELATIVE, 0, 500000); // sleep for 1.5
}

// void Blue::readByte(unsigned char *c)
// {
//     unsigned int x = serOpen("/dev/ttyS0", 9600, 0);
//     cout << x << endl;

//     if (x < 0)
//     {
//         cout << "Fail to open Serial port." << endl;
//     }
//     else
//     {
//         cout << "Success to Open" << endl;
//     }

//     if (serDataAvailable(x)) // 先判断有没有数据读
//     {
//         cout << "Read sth" << endl;
//         // chara = serReadByte(serialStatus);
//         *c = serReadByte(x);
//         while (serDataAvailable(x))
//           {cout << "Read sth" << endl;}// 有数据读就读直到读完
//     }
//     /*
//      * add delay is ok. Because read also need time.
//      */
// }

void Blue::readByte()
{
    serialStatus = serOpen("/dev/serial0", 115200, 0);
    if (serDataAvailable(serialStatus)) // 先判断有没有数据读
    {
        cout << serReadByte(serialStatus) << endl;
        while (serDataAvailable(serialStatus));
        //     ; // 有数据读就读直到读完
    }
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
        cout << buff[1] << endl;
        cout << buff[2] << endl;
        cout << buff[3] << endl;
        cout << buff[4] << endl;
    }
}

