#include <pigpio.h>
#include "./include/Servo.h"
#include <iostream>
using namespace std;

int main()
{
    Servo servo1(16);

    while (1)
    {
        servo1.setAngle(45);
    }

    return 0;
}
