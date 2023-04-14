#ifndef SERVO_H
#define SERVO_H
#include <pigpio.h>
#include <iostream>
#include <vector>

class Servo
{
private:
    unsigned int pin;
public:
    Servo(unsigned int pin);
    void setAngle(unsigned int angle);
};

#endif