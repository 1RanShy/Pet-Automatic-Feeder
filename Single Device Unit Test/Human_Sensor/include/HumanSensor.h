#ifndef HUMANSENSOR_H
#define HUMANSENSOR_H
#include<pigpio.h>

class HumanSensor{
private:
    unsigned int pin;
public:
    HumanSensor(unsigned int gpio_pin);
    unsigned char detect();
};

#endif