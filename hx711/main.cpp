#include "hx711.h"

int main()
{
    // create an instance of HX711 with PD_SCK and DOUT pins, and gain of 128
    HX711 hx711(17, 27);
    while (true)
    {
        // get the weight in grams
        double weight = hx711.get_units();

        std::cout << "Weight: " << weight << " g" << std::endl;
    }

    return 0;
}
