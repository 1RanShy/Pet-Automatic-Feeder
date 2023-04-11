#ifndef PUMP_CONTROL_H
#define PUMP_CONTROL_H

#include <pigpio.h>

class PumpControl
{
public:
    PumpControl(int gpio_pin, int delay_time);
    ~PumpControl();
    void start();
    void stop();
private:
    int gpio_pin_;
    int delay_time_;
};

#endif // PUMP_CONTROL_H
