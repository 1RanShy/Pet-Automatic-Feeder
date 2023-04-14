#include "Pump.h"
#include<iostream>
#include <pigpio.h>
using namespace std;
int main()
{
    PumpControl pump(12); // 创建一个PumpControl对象，使用GPIO17和延迟时间5000微秒
    while (true)
    {
        pump.start(); // 启动水泵
        cout << "open" << endl;
        gpioDelay(2000000); //2s
        pump.stop(); // 停止水泵
        cout << "close" << endl;
        gpioDelay(2000000); //2s
    }
    return 0;
}
