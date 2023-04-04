#include "hx711.h"

// constructor
HX711::HX711(int PD_SCK, int DOUT, int GAIN) : PD_SCK(PD_SCK), DOUT(DOUT), GAIN(GAIN)
{
    gpioSetMode(PD_SCK, PI_OUTPUT);
    gpioSetMode(DOUT, PI_INPUT);

    gpioWrite(PD_SCK, 0);
    gpioDelay(100);
    read();
}

// destructor
HX711::~HX711()
{
    gpioSetMode(PD_SCK, PI_INPUT);
    gpioSetMode(DOUT, PI_INPUT);
}

// check if HX711 is ready to read data
bool HX711::is_ready()
{
    return gpioRead(DOUT) == 0;
}

// read data from HX711
int32_t HX711::read()
{
    while (!is_ready()) {
        gpioDelay(1);
    }

    std::bitset<24> data_bits;
    for (int i = 23; i >= 0; i--) {
        gpioWrite(PD_SCK, 1);
        gpioDelay(1);
        data_bits[i] = gpioRead(DOUT);
        gpioWrite(PD_SCK, 0);
        gpioDelay(1);
    }

    // set the channel and gain factor for the next reading
    for (int i = 0; i < GAIN; i++) {
        gpioWrite(PD_SCK, 1);
        gpioDelay(1);
        gpioWrite(PD_SCK, 0);
        gpioDelay(1);
    }

    data_bits[23] = 0;
    int32_t data = static_cast<int32_t>(data_bits.to_ulong());

    return data;
}

// get the raw value from HX711
int32_t HX711::get_raw()
{
    return read();
}

// get the weight in specified unit
double HX711::get_units(int times)
{
    int32_t value = 0;
    for (int i = 0; i < times; i++) {
        value += get_raw();
    }

    double units = static_cast<double>(value) / static_cast<double>(times) / 2280.0;

    return units;
}
