#include "hx711.h"

HX711::HX711(int clock_pin, int data_pin, int gain) :
    m_clock_pin(clock_pin),
    m_data_pin(data_pin),
    m_gain(gain)
{
    gpioSetMode(m_clock_pin, PI_OUTPUT);
    gpioSetMode(m_data_pin, PI_INPUT);

    power_up();
    power_down();
}

bool HX711::is_ready() {
    return gpioRead(m_data_pin) == 0;
}

double HX711::read() {
    while (!is_ready()) {
        // 等待HX711准备好
    }

    int data = 0;
    for (int i = 0; i < 24; i++) {
        gpioWrite(m_clock_pin, 0);
        gpioDelay(1);
        data |= gpioRead(m_data_pin) << (23 - i);
        gpioWrite(m_clock_pin, 1);
        gpioDelay(1);
    }
    gpioWrite(m_clock_pin, 0);
    gpioDelay(1);

    double weight = static_cast<double>(data);
    if (weight >= (1 << 23) / 2) {
        weight -= (1 << 24);
    }
    weight /= (1 << 21) * m_gain;

    return weight;
}

void HX711::set_gain(int gain) {
    switch (gain) {
    case 128:
        m_gain = 1;
        break;
    case 64:
        m_gain = 3;
        break;
    case 32:
        m_gain = 2;
        break;
    default:
        m_gain = 1;
        break;
    }

    power_down();
    power_up();
}

void HX711::power_up() {
    gpioWrite(m_clock_pin, 1);
    gpioDelay(100);
}

void HX711::power_down() {
    gpioWrite(m_clock_pin, 0);
    gpioDelay(100);
}
