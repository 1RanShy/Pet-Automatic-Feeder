#ifndef BLUSESENDRECEIVE_H
#define BLUSESENDRECEIVE_H
#include <pigpio.h>
#include <iostream>
#include <vector>
#include <thread>
// 定义一个strcur 
// struct 默认 public继承
// class默认 private继承
struct BlueToothcallback {
public:
	virtual void sendData() = 0; //纯虚函数 必须在类中声明 
    virtual void receiveData() = 0;
};


class BLEDataProcessing{
private:
    bool running;
	std::thread t;
	void DataProcessing();//main programm to add or stop adding food
	std::vector<BlueToothcallback*> bluetoothCallbacks; // Vector<类型>标识符
public:
	void registerCallback(BlueToothcallback* blue);
	void start();
	void stop();

};


#endif
