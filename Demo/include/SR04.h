#ifndef SR04_H
#define SR04_H

#include <pigpio.h>

class SR04 {
public:
    SR04(unsigned int trigger_pin, unsigned int echo_pin);
    ~SR04();
    float get_distance();

private:
    unsigned int trigger_pin_;
    unsigned int echo_pin_;
};

#endif // SR04_H
