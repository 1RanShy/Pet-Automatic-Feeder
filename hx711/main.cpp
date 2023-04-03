#include <iostream>
#include <pigpio.h>
#include "hx711.h"

int main()
{
    if (gpioInitialise() < 0)
    {
        std::cout << "pigpio init failed" << std::endl;
        return -1;
    }

    HX711 hx711(17, 18, HX711_GAIN_128);

    long weight = hx711.read();
    std::cout << "weight: " << weight << std::endl;

    gpioTerminate();
    return 0;
}
