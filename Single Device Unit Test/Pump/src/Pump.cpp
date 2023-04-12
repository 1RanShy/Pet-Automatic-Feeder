#include "Pump.h"
#include <pigpio.h>
PumpControl::PumpControl(unsigned int pin)
{
    gpioInitialise(); // 初始化PIGPIO库
    gpio_pin = pin;
    gpioSetMode(gpio_pin, PI_OUTPUT); // 将GPIO设置为输出模式
}

PumpControl::~PumpControl()
{
    gpioTerminate(); // 关闭PIGPIO库
}

void PumpControl::start()
{
    gpioWrite(gpio_pin, 0); // 设置GPIO输出高电平，打开三极管，水泵开始工作
}

void PumpControl::stop()
{
    gpioWrite(gpio_pin, 1); // 设置GPIO输出低电平，关闭三极管，水泵停止工作
}
