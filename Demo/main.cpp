#include <pigpio.h>
#include "./include/Servo.h"
#include "./include/SR04.h"
#include "./include/AddFood.h"
#include "./include/Blue.h"
#include "BlueSendReceive.h"
// #include "globalVar.h"
#include <stdio.h>
#include <iostream>
#include <chrono>
#include <thread>
#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <mutex>
using namespace std;

mutex datsToSendLock;
mutex dataReceivedLock;
char dataToSend[5] = {'H','E','L','L','O'};
char dataReceived[5] = {'H','E','L','L','O'};

struct MyAddFoodCallback : AddFoodcallback {
public:
	void addFood() {
        Servo servo1(16);
        servo1.setAngle(0);
    }
    void stopAdd() {
        Servo servo1(16);
        servo1.setAngle(180);
    }
};

struct MyBlueToothcallback : BlueToothcallback {
public:
	void sendData() //纯虚函数 必须在类中声明 
    {
        Blue ble;
        datsToSendLock.lock();
        ble.writeBytes(dataToSend, 5);
        for(int i=0; i <5; i++)
        {
            dataToSend[i] = 'R';
            
        }
        cout << "clear Array" << endl;
        datsToSendLock.unlock();
    }

    void receiveData()
    {
        Blue ble;
        char temp[5];
        ble.readBytes(temp);
        // cout << temp[0] << endl;
    }
};


int main()
{
	gpioInitialise();
	MyAddFoodCallback callback1; // 这个是回调函数
	AddFood addFood;	// 这个是真正的线程
	addFood.registerCallback(&callback1); // 线程注册回调函数
	
	addFood.start(); // 线程开启时就声明了这个线程从哪个函数开始执行 // t = thread(&scan::Readscan,this);
	
	

	MyBlueToothcallback  callback2; // 这个是回调函数
	BLEDataProcessing dataProcess;	// 这个是真正的线程
	dataProcess.registerCallback(&callback2); // 线程注册回调函数
	
	dataProcess.start(); // 线程开启时就声明了这个线程从哪个函数开始执行 // t = thread(&scan::Readscan,this);
    
	dataProcess.stop();
    // gpioDelay(50000);

    addFood.stop();
	cout << "Main thread finished." << endl;


	return 0;
}

/*
    //蓝牙测试模块
    Blue ble;
    char buff[10] = {'H', 'E', 'L', 'L', 'O'};
    char c = 'A';
    while (1)
    {
        // sendByte(x, 'H');
        // ble.readByte(&c);
        // ble.sendByte('A');
        ble.readBytes(buff);
        // cout<< buff[0] << "   " << buff[1] << "  " << buff[2] << " " << buff[3] << buff[4] << endl; 
        ble.writeBytes(buff, 5);
        gpioDelay(500000);
		cout << buff[0];
		cout << buff[1];
		cout << buff[2];
		cout << buff[3];
		cout << buff[4] << endl;
        
    }
*/