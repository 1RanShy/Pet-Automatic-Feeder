#ifndef PUMP_H
#define PUMP_H

#include <pigpio.h>

class Pump
{
public:
    Pump(unsigned int gpio_pin);
    ~Pump();
    void start();
    void stop();
private:
    unsigned int pin;
};

#endif // PUMP_CONTROL_H
