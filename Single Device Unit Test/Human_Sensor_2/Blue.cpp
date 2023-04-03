#include <pigpio.h>
#include <iostream>

using namespace std;

int main(void)
{
    if (gpioInitialise() < 0)
    {
        cout << "Failed" << endl;
    }
    
    else
    {
        cout << "PIGPIO is ready" << endl;
    }

    gpioSetMode(14, PI_INPUT); // Set GPIO18 as output
    
    while (1)
    {
        int x = gpioRead(14);
        
        cout << x << endl;
    }
    
    return 0;
}
