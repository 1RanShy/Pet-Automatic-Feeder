# This is a demo about bluetooth
If youn want to open the serial port in Respberry, youshould follow this website.

And also open serial in Respberryy configure
[How to open serial in Respberry](https://www.abelectronics.co.uk/kb/article/1035/serial-port-setup-in-raspberry-pi-os)

# Example
~~~text
pigpio pin:
tx 14
rx 15
~~~

~~~c++
#include<pigpio.h>
#include<iostream>
#include"./include/Blue.h"

using namespace std;
int main(void)
{
    Blue ble;
    char buff[10] = {1, 2, 3, 4, 5};
    while (1)
    {
        ble.readBytes(buff); // output character HEX/ASCII
        ble.sendByte(buff[0]);
        ble.writeBytes(buff, 5);
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


这个是串口协议，也是蓝牙芯片的使用demo
~~~text
蓝牙收到一个数据
树莓派打印这个收到的数据,并且将这个数据回传给蓝牙.
~~~

~~~c++
while(1)
{
    if(serDataAvailable(x))
    {
        serReadByte(x);
        /*
        这个肯定是错的,因为你这个数据还没读完,然后标志位还没置 0. 又进下一次while循环,因为其实上次没读完
        所以标志位还是没置0,你又可以读数据,就导致你得到了错误的数据. 这就是为什么第二次的数据总是很大,因为高位移到前面去了.

        所以此时你在后面加一个delay就能正常读写了.因为这一位确实被读完了,标志位确实被置0了.
        */

    }
}
~~~







## 正确的读法

[完美解释读数据需要延迟](https://blog.csdn.net/zouxin_88/article/details/109724688)

~~~c++
while (1)
{
    /*
    if(serDataAvailable(x))
    {
        serRead(x,buff,8);
        cout<<buff[0];
        gpioSleep(PI_TIME_RELATIVE, 0, 500000);
    }
    cout<<serDataAvailable(x)<< endl;
    */
    if(serDataAvailable(x))//先判断有没有数据读
    {
        
        cout << serReadByte(x) << endl; //这是硬件操作 寄存器需要一定时间
        while(serDataAvailable(x)); //有数据读就读直到读完 
    }
}

~~~

串口读写是硬件操作 需要一定时间,这个时间虽然很短但确实需要,如果不给这个时间,那么就会出现标志位来不及清0的情况导致错误

[了解什么是串口](https://blog.csdn.net/github_38148039/article/details/106167252)

