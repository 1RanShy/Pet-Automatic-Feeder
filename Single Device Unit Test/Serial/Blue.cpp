#include <pigpio.h>
#include <iostream>

using namespace std;

void sendByte(unsigned int x)
{
    serWriteByte(x, 6);
    serWriteByte(x, 77);
    gpioSleep(PI_TIME_RELATIVE, 0, 500000); // sleep for 1.5
}

void readByte(unsigned int x)
{
    if (serDataAvailable(x)) // 先判断有没有数据读
    {

        cout << serReadByte(x) << endl;
        while (serDataAvailable(x)); // 有数据读就读直到读完
    }
    /*
     * add delay is ok. Because read also need time.
     */
}

void writeBytes(unsigned int x,char *buff,unsigned char count)
{
    serWrite(x,buff,count);
}

void readBytes(unsigned int x,char *buff,unsigned char count)
{
    if(count)
    {
        serRead(x,buff,count);
        while (serDataAvailable(x)); // 有数据读就读直到读完
        cout << buff[0] << "  " << buff[1] << "  " << buff[2] << "  " << endl;
    }
}

int main(void)
{
    if (gpioInitialise() < 0)
    {
        cout << "Failed" << endl;
    }
    else
    {
        cout << "PIGPIO is ready" << endl;
    }

    unsigned int x = serOpen("/dev/ttyS0", 9600, 0);
    cout << x << endl;

    if (x < 0)
    {
        cout << "Fail to open Serial port." << endl;
    }
    else
    {
        cout << "Success to Open" << endl;
    }
    char buff[10] = {1,2,3,4,5};
    while (1)
    {
        /*
        if (serDataAvailable(x)) // 先判断有没有数据读
        {

            cout << serReadByte(x) << endl;
            while (serDataAvailable(x)); // 有数据读就读直到读完
        }
        */
        //writeBytes(x,buff,5);
        //if(serDataAvailable(x))
        readBytes(x,buff,serDataAvailable(x));
    }
    return 0;
}
