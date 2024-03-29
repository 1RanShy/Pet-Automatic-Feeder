#include <pigpio.h>
#include "../include/Servo.h"
#include <iostream>
using namespace std;

/*

*/
Servo::Servo(unsigned int gpio_pin)
{
    gpioInitialise(); //
    pin = gpio_pin;
    gpioSetMode(pin, PI_OUTPUT);
}

/*
    para_1 pin: selec pin; para2 angle: set angle(0,45,90,135,180);
*/
void Servo::setAngle(unsigned int angle)
{
    switch (angle)
    {
    case 0:
        gpioServo(pin, 500);
        break;
    case 45:
        gpioServo(pin, 1000);
        break;
    case 90:
        gpioServo(pin, 1500);
        break;
    case 135:
        gpioServo(pin, 2000);
        break;
    case 180:
        gpioServo(pin, 2500);
    default:
        break;
    }
    cout << "Servo Pin is " << pin << endl;
    cout << "The Serco Engine has been set to  "
         << angle << " degree " << endl;
}

