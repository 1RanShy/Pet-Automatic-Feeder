//#include "led.h"
#include "hcsr04.h"
#include<pigpio.h>
int main()
{
	//led::loop();
	if (gpioInitialise() < 0)
{
   // pigpio initialisation failed.
}
else
{
   // pigpio initialised okay.
}
	hcsr04::loop();
	return 0;
}
