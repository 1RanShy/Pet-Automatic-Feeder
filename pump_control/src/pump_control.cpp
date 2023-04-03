#include "pump_control.h"

PumpControl::PumpControl(int gpio_pin, int delay_time)
{
    gpioInitialise(); // 初始化PIGPIO库
    gpio_pin_ = gpio_pin;
    delay_time_ = delay_time;
    gpioSetMode(gpio_pin_, PI_OUTPUT); // 将GPIO设置为输出模式
}

PumpControl::~PumpControl()
{
    gpioTerminate(); // 关闭PIGPIO库
}

void PumpControl::start()
{
    gpioWrite(gpio_pin_, 1); // 设置GPIO输出高电平，打开三极管，水泵开始工作
    gpioDelay(delay_time_); // 延迟一段时间，让水泵工作一段时间
}

void PumpControl::stop()
{
    gpioWrite(gpio_pin_, 0); // 设置GPIO输出低电平，关闭三极管，水泵停止工作
    gpioDelay(delay_time_); // 延迟一段时间，让水泵停止工作一段时间
}
