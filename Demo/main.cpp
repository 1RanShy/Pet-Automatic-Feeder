#include <pigpio.h>
#include "./include/Servo.h"
#include "./include/SR04.h"
#include <stdio.h>
#include <iostream>
#include <chrono>
#include <thread>
using namespace std;
float distanceFood = 0;

void callback()
{
    // cout << "1s" << endl;
    gpioSetTimerFunc(0, 1000, callback) ;

    // 等待30s
    std::this_thread::sleep_for(std::chrono::seconds(30));

    // 关闭定时器
    gpioSetTimerFunc(0, 0, nullptr);
}

/*
    雷达监测到食物少了就开启servo加食物
*/
void addFood()
{
    Servo servo1(16);
    SR04 sr04(15, 14);
    distanceFood = sr04.get_distance();

            
    printf("distance: %f cm\n", distanceFood);
    if(distanceFood < 6)
        servo1.setAngle(0);
    if(distanceFood > 10)
        servo1.setAngle(180);
}

int main()
{
    Servo servo1(16);
    SR04 sr04(15, 14);
    
    while (1)
    {


        // gpioSleep(PI_TIME_RELATIVE, 1, 0);
         // 定时器周期为1s
    // gpioSetTimerFunc(0, 1000, callback) ;

    // // 等待30s
    // std::this_thread::sleep_for(std::chrono::seconds(30));

    // // 关闭定时器
    // gpioSetTimerFunc(0, 0, nullptr);

    }

    return 0;
}

