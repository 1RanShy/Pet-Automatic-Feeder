#ifndef PUMP_H
#define PUMP_H

class PumpControl
{
public:
    PumpControl(unsigned int pin);
    ~PumpControl();
    void start();
    void stop();
private:
    int gpio_pin;
};

#endif // PUMP_CONTROL_H
