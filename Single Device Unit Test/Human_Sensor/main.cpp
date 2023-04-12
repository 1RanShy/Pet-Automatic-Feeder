#include <pigpio.h>
#include <iostream>
#include "./include/HumanSensor.h"
using namespace std;

int main(void)
{   
    while (1)
    {
        HumanSensor Sensor1(1);
        Sensor1.detect();
        gpioDelay(1000000);
    }
    
    return 0;
}
