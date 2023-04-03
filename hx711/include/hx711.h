#ifndef HX711_H
#define HX711_H

#include <pigpio.h>

class HX711 {
public:
    HX711(int clock_pin, int data_pin, int gain = 128);

    bool is_ready();
    double read();
    void set_gain(int gain);

private:
    int m_clock_pin;
    int m_data_pin;
    int m_gain;

    void power_up();
    void power_down();
};

#endif // HX711_H
