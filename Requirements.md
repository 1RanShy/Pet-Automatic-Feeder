# Requirements
1. pin 写在private中

~~~text
To do List
[X] SR04 Delete usleep(10) Then test 试过了这个删了不行。
[X] Blue Thread  明天写吧
[x] 测试一下改为vector行不行
没必要改，因为pigpio库里就要求是char * 可以在 buff改变之后再用vector改变。
[x] 蓝牙接收 蓝牙传输命令
[ ] 开启和关闭自动喂食模式
[ ] 能传给手机什么信息？
1. 猫咪正在进食


蓝牙传输信息
[X] 发送基本上解决
[X] 接收还有问题 

~~~


~~~text
自动喂食的开关写好了，现在需要 

蓝牙协议：
自动喂食
CAAAC：切换自动还是手动喂食
11111：自动喂食状态
00000：手动喂食状态
通过判断 autoAddFoodFlag：来改变dataTosend的值

发送完毕 dataToSend 全改为R
dataRerceived 使用完毕 全改为z

命令格式是：
CXXXC 头尾两个C表示这个确实是有效命令
XXX是用来判断这一段命令到底是什么操作的标识符
R和Z不要在自定义命令中出现
~~~





## 待做
~~~text
[x] 测试 改 水泵
[x] 该电路图 水泵现在是 tx边 倒数第二个 把它改成别的引脚 倒数三个留给servo engine
[x] 水泵和SR04的联合调试
~~~

# 待添加的功能
~~~text
[ ] 手动更改最大能够加到多大的深度
[ ] 确定一下 食物少时候的多级的转向是大还是小
[ ] 如何让树莓派开机自启动 main程序
~~~




# Pin 
~~~text
            Pigpio Pysical
TXD         14      8
RXD         15      10

trigger     23
echo        24

PWM_Food    16 倒数第三个

human sensor的往前 28 py
pump  28 py
~~~
~~~text
Bluetooth demo has worked properly. It takes me three days to fix it. Finally it works, but i still do not know why it can not work.
~~~





~~~text
To do List:

[X] SR04: Delete usleep(10) then test. Tried it, deleting it doesn't work.
[X] Blue Thread: Write it tomorrow.
[x] Test if changing to vector works. No need to change it because the pigpio library requires it to be a char *, and it can be changed to a vector after buff is changed.

[ ] Bluetooth receiving and transmitting commands.
[ ] Enable and disable automatic feeding mode.
[ ] What information can be sent to the phone?

Cat is currently eating.
Bluetooth transmission information:
[X] Sending is basically resolved.
[X] Receiving still has issues.
~~~