#include <pigpio.h>
#include <iostream>
#include "../include/HumanSensor.h"
using namespace std;

HumanSensor::HumanSensor(unsigned int gpio_pin)
{
    pin = gpio_pin;

    if (gpioInitialise() < 0)
    {
        cout << "Failed" << endl;
    }

    else
    {
        cout << "PIGPIO is ready" << endl;
    }
    
    gpioSetMode(pin, PI_INPUT); // Set GPIO18 as output
}

unsigned char HumanSensor::detect()
{
    unsigned char isPeople = 0;

    isPeople = gpioRead(pin);
    if(isPeople)
    {
        cout << "There is people" << endl;
    }
    else
    {
        cout << "There is no People" << endl;
    }

    return isPeople;
}