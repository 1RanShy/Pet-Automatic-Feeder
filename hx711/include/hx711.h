#ifndef HX711_H
#define HX711_H

#include <pigpio.h>
#include <iostream>
#include <bitset>

class HX711 {
private:
    const int PD_SCK;
    const int DOUT;
    const int GAIN;

    bool is_ready();
    int32_t read();

public:
    HX711(int PD_SCK, int DOUT, int GAIN = 128);
    ~HX711();
    int32_t get_raw();
    double get_units(int times = 1);
};

#endif // HX711_H
