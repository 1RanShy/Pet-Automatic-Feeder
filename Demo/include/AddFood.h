#ifndef ADDFOOD_H
#define ADDFOOD_H
#include <pigpio.h>
#include <iostream>
#include <vector>
#include <thread>
// 定义一个strcur 
// struct 默认 public继承
// class默认 private继承
struct AddFoodcallback {
public:
	virtual void addFood() = 0;// 纯虚函数 必须在类中声明 
    virtual void stopAdd() = 0;// 纯虚函数 必须在类中声明 
    // virtual void print2() = 0;// 纯虚函数 必须在类中声明 
};

// 这个是按键扫描事件 为一个类
class AddFood{
private:
    float distance;
    bool running;
	std::thread t;
	void scanFood();
	std::vector<AddFoodcallback*> addFoodCallbacks; // Vector<类型>标识符
public:
	void registerCallback(AddFoodcallback* af);
	void start();
	void stop();
    // float getFoodLeft();
};

#endif