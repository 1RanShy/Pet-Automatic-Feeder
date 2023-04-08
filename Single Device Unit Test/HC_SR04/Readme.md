# Explanation
This is a ultrasonic distance measuring module. It is used in an automatic pet feeder to: 
1. Monitor the remaining amount of cat food. 
2. Monitor the remaining amount of drinking water. 

To achieve the effect of automatic feeding.


# Example
The library we use is called pigpio.
~~~c++
#include "SR04.h"

#include <stdio.h>

int main(int argc, char *argv[]) {
    SR04 sr04(15, 14);
    while (1) {
        float distance = sr04.get_distance();
        printf("distance: %f cm\n", distance);
        gpioDelay(1000000);
    }
    return 0;
}
~~~