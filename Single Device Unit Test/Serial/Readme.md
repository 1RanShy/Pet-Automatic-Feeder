# This is a demo about Serial Port

## 错误的读法

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
