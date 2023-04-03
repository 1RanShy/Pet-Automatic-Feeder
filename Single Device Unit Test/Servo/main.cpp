// #include <pigpio>
#include "include/Servo.h"
#include <iostream>
using namespace std;

int main()
{
    Servo servo1;

    servo1.setAngle(45);
    return 0;
}