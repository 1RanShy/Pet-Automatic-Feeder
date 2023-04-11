#ifndef ADDWATER_H
#define ADDWATER_H
#include <pigpio.h>
#include <iostream>
#include <vector>
#include <thread>
// 定义一个strcur
// struct 默认 public继承
// class默认 private继承
struct AddWatercallback {
public:
    virtual void addWater() = 0;// 纯虚函数 必须在类中声明
    virtual void stopAdd() = 0;// 纯虚函数 必须在类中声明
};

// 这个是按键扫描事件 为一个类
class AddWater{
private:
    float distance;
    bool running;
    std::thread t;
    void scanWater();//main programm to add or stop adding food
    std::vector<AddWatercallback*> addWaterCallbacks; // Vector<类型>标识符
public:
    void registerCallback(AddWatercallback* aw);
    void start();
    void stop();

};

#endif

