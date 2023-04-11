#include "SR04.h"

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
using namespace std;

SR04::SR04(unsigned int trigger_pin, unsigned int echo_pin) :
        trigger_pin_(trigger_pin), echo_pin_(echo_pin) {
    if (gpioInitialise() < 0) {
        fprintf(stderr, "pigpio initialization failed\n");
        exit(EXIT_FAILURE);
    }
    gpioSetMode(trigger_pin_, PI_OUTPUT);
    gpioSetMode(echo_pin_, PI_INPUT);
    gpioWrite(trigger_pin_, PI_OFF);
    usleep(200000); // wait 200ms initialse the sensor, this must be done by sleep
    // gpioDelay(20000);
}

SR04::~SR04() {
    gpioTerminate();
}

float SR04::get_distance() {
    gpioWrite(trigger_pin_, PI_ON); // 开始发送超声波
    usleep(10);
    gpioWrite(trigger_pin_, PI_OFF); // 发送结束
    unsigned int level = gpioRead(echo_pin_);
    while (level == PI_OFF) { // 等待echo信号上升沿
        level = gpioRead(echo_pin_);
    }
    long long start_tick = gpioTick();
    while (level == PI_ON) { // 等待echo信号下降沿
        level = gpioRead(echo_pin_);
    }
    long long end_tick = gpioTick();
    float distance_cm = (end_tick - start_tick) / 1000000.0 * 17150.0; // 计算距离
    return distance_cm;
}
