#include <pigpio.h>
#include <iostream>
#include <vector>
#include "Blue.h"
#include "globalVar.h"
using namespace std;


Blue::Blue()
{
    if (gpioInitialise() < 0)
    {
        // cout << "Failed" << endl;
    }
    else
    {
        // cout << "PIGPIO is ready" << endl;
    }

    //initialise the serial GPIO14 15
    status = serOpen("/dev/ttyS0", 9600, 0);
    // cout << status << endl;

    if (status < 0)
    {
        // cout << "Fail to open Serial port." << endl;
    }
    else
    {
        // cout << "Success to Open" << endl;
    }
}

Blue::~Blue()
{
    serClose(status);
    // cout << "serial has been closed" << endl;
}

void Blue::sendByte(unsigned char c)
{
    serWriteByte(status, c);
}

void Blue::readByte(char *chara)
{
    cout << "Sth" << endl;
    if (serDataAvailable(status)) // if there are datas in buffer?
    {
        *chara = serReadByte(status);
        cout << *chara << endl; 
        while (serDataAvailable(status))
            ; // until finish reading all data
    }
    /*
     * add delay is ok. Because read also need time.
     */
}

/*
    I know you requested us to use vector, 
    but the default form parameter of this function in pigpio is an array. 
    Moreover, I have defined the length of the string for 
    Bluetooth receiving and sending to be fixed. 
    Therefore, I have decided to use array here instead of vector.
*/
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
            ; // until finish reading all data
        cout << buff[0] << endl;
    }
}


