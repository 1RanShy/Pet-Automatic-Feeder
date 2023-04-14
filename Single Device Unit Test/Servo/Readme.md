# Explanation

This is a demo which can works in raspberry pi

~~~text
1. include<pigpio.h>
2. switch -----
~~~

To cmake it in respberry pi

~~~cmake
# in build folder
cmake .. 
make
~~~

2023/03/21 18:03

remember that in switch sentence you should write break!!!!

~~~cmake
include_directories(include) #包含头文件目录
# If you write this in you cmakeList, you do not need to write absolute routine
# just normal routine is ok. no: "../include/Servo.h" but "Servo.h"
~~~

# Example

~~~c++
#include <pigpio.h>
#include "./include/Servo.h"
#include <iostream>
using namespace std;

int main()
{
    if (gpioInitialise() < 0)
    {
        cout << "Failed" << endl;
        return 0;
    }
    else
    {
        cout << "PIGPIO is ready" << endl;
    }
    
    Servo servo1(17);

    while (1)
    {
        servo1.setAngle(0);
    }

    return 0;
}
~~~
~~~cmake
# cd build
cmake ..
make 
sudo ./main
~~~