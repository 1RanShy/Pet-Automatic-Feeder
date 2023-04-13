#include <pigpio.h>
#include <iostream>
#include "./include/HumanSensor.h"
using namespace std;

int main(void)
{   
    while (1)
    {
        HumanSensor Sensor1(1);
        if(Sensor1.detect())
        {
            cout << "1" << endl;
        }
        else
        {
            cout << "0" << endl;
        }
        gpioDelay(1000000);
    }
    
    return 0;
}
