#ifndef HUMANSENSOR_H
#define HUMANSENSOR_H
#include<pigpio.h>
// Just a device class
/*
If there is a biological obstruction in front of this sensor, 
it will return 1, otherwise it will return 0.
*/
class HumanSensor{
private:
    unsigned int pin;
public:
    HumanSensor(unsigned int gpio_pin);
    unsigned char detect();
};

#endif