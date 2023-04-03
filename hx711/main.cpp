#include <iostream>
#include "hx711.h"

int main() {
    if (gpioInitialise() < 0) {
        std::cerr << "GPIO初始化失败" << std::endl;
        return 1;
    }

    int clock_pin = 23;
    int data_pin = 24;

    HX711 hx711(clock_pin, data_pin);

    double weight = hx711.read();
    std::cout << "重量：" << weight << "g" << std::endl;

    gpioTerminate();

    return 0;
}

