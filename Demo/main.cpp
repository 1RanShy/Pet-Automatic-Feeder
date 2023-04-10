#include <pigpio.h>
#include "./include/Servo.h"
#include "./include/SR04.h"
#include "./include/AddFood.h"
#include "./include/Blue.h"
#include <stdio.h>
#include <iostream>
#include <chrono>
#include <thread>
#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
using namespace std;

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


int main()
{
	gpioInitialise();
	// MyAddFoodCallback callback; // 这个是回调函数
	// AddFood addFood;	// 这个是真正的线程
	// addFood.registerCallback(&callback); // 线程注册回调函数
	
	// addFood.start(); // 线程开启时就声明了这个线程从哪个函数开始执行 // t = thread(&scan::Readscan,this);
	


	// addFood.stop();
	// cout << "Main thread finished." << endl;
	Blue ble;
    char buff[10] = {'H', 'E', 'L', 'L', 'o'};
    unsigned char c = 'A';
    while (1)
    {
        // sendByte(x, 'H');
        // ble.readByte(&c);
        // ble.sendByte('A');
        // ble.readBytes(buff);
        // cout<< buff[0] << "   " << buff[1] << "  " << buff[2] << " " << buff[3] << buff[4] << endl; 
        ble.writeBytes(buff, 5);
        gpioDelay(500000);
        
    }
    return 0;
	return 0;
}

