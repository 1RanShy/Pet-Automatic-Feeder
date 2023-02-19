#pragma once
#include <iostream>
#include <wiringPi.h>   
#include <iomanip>
#include "TimeUtils.h"

//定义WiringPi引脚编号
const int trig = 28;
const int echo = 29;

using namespace std;

class hcsr04
{
public:
	hcsr04();
	~hcsr04();
public:
	//初始化引脚模式等
	void static init();
	//循环执行部分
	void static loop();
	//具体实现写在这里
	void static implement();
};
