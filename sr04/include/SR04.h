#ifndef SR04_H
#define SR04_H

#include <pigpio.h>

class SR04 {
public:
    SR04(int trigger_pin, int echo_pin);
    ~SR04();
    float get_distance();

private:
    int trigger_pin_;
    int echo_pin_;
};

#endif // SR04_H
