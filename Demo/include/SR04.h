#ifndef SR04_H
#define SR04_H

#include <pigpio.h>
// Just a device class
/*
    SR04 is an ultrasonic sensor used for measuring the distance between objects. 
    It works by sending ultrasonic signals and receiving echoes to determine the distance between the object and the sensor.
*/
class SR04 {
public:
    SR04(unsigned int trigger_pin, unsigned int echo_pin);
    ~SR04();
    float get_distance(); // returen the distance

private:
    unsigned int trigger_pin_;
    unsigned int echo_pin_;
};

#endif // SR04_H
