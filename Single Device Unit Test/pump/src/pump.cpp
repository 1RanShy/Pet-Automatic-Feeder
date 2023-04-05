#include "../include/pump.h"

Pump::Pump(unsigned int gpio_pin)
{
    gpioInitialise(); // 初始化PIGPIO库
    pin = gpio_pin;
    gpioSetMode(pin, PI_OUTPUT); // 将GPIO设置为输出模式
}

Pump::~Pump()
{
    // gpioTerminate(); // 关闭PIGPIO库
}

void Pump::start()
{
    gpioWrite(pin, 0); // 设置GPIO输出高电平，打开三极管，水泵开始工作
}

void Pump::stop()
{
    gpioWrite(pin, 1); // 设置GPIO输出低电平，关闭三极管，水泵停止工作
}
