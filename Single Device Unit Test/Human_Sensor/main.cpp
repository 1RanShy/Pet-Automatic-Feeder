#include <pigpio.h>
#include <iostream>
#include "./include/HumanSensor.h"
using namespace std;

int main(void)
{   
    while (1)
    {
        HumanSensor Sensor1(14);
        Sensor1.detect();
    }
    
    return 0;
}
