#include <pigpio.h>
// #include "globalVar.h"
#include "Servo.h"
#include "SR04.h"
#include "AddFood.h"
#include "HumanSensor.h"
#include "Blue.h"
#include "BlueSendReceive.h"
#include "Pump.h"
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
// mutex dataReceivedLock;
// mutex autoAddFoodFlagLock;
// mutex findCatFlagLock;

char dataToSend[5] = {'H','E','L','L','O'};
char dataReceived[5] = {'H','E','L','L','O'};
bool autoAddFoodFlag = true; //1: autoAddFood 0: manually addFood
bool findCatFlag = true; //1: autoAddFood 0: manually addFood

struct MyAddFoodCallback : AddFoodcallback {
public:
	void findCat(HumanSensor *sensor) {
        // datsToSendLock.lock();
        if(sensor->detect())
        {
            // findCatFlagLock.lock();
            findCatFlag = false;
            // findCatFlagLock.unlock();
            
            
            for(int i = 0; i<5; i++)
            {
                dataToSend[i] = '3';
            }
            
        }
        else
        {
            // datsToSendLock.lock();
            for(int i = 0; i<5; i++)
            {
                dataToSend[i] = '4';
            }
        }
        // datsToSendLock.unlock();
    }
};

struct MyBlueToothcallback : BlueToothcallback {
public:
	void sendData(Blue *ble) //纯虚函数 必须在类中声明 
    {
        datsToSendLock.lock();
        ble->writeBytes(dataToSend, 5);
        for(int i=0; i <5; i++)
        {
            dataToSend[i] = 'R';
            
        }
        #ifdef TEST
        cout << "clear Array" << endl;
        #endif
        datsToSendLock.unlock();
    }

    void receiveData(Blue *ble)
    {
        // Blue ble;
        // dataReceivedLock.lock();
        ble->readBytes(dataReceived);
        // dataReceivedLock.unlock();  
        //The judgement should be like the code below:
    }

    void dataProcess()
    {
        //处理收到的数据，通过判断来解析标识符
        if(dataReceived[0] == 'C' && dataReceived[4] == 'C')
        {
            //switch autoAddFood
            //Choose whether to feed automatically CAAAC
            if(dataReceived[1] == 'A' && dataReceived[2] == 'A' && dataReceived[3] == 'A')
            {
                // autoAddFoodFlagLock.lock();
                autoAddFoodFlag = !autoAddFoodFlag;//自动喂食标识符
                // autoAddFoodFlagLock.unlock();
                
                //改变datatosend发送数据
                //make bluetooth send data
                // datsToSendLock.lock();
                // 1 自动喂食
                if(autoAddFoodFlag == true)
                {
                    for(int i = 0; i<5; i++)
                    {
                        dataToSend[i] = '1';
                    }
                }
                //2 手动喂食
                else
                {
                    for(int i = 0; i<5; i++)
                    {
                        dataToSend[i] = '2';
                    }
                }
                // datsToSendLock.unlock();
            }
            if(dataReceived[1] == 'B' && dataReceived[2] == 'B' && dataReceived[3] == 'B')
            {
                // findCatFlagLock.lock();
                findCatFlag = true;
                // findCatFlagLock.unlock();
            }
            //收到数据之后清除这个数据
            //全部改为 zzzzz
            // dataReceivedLock.lock();
            for(int i = 0; i<5; i++)
            {
                // cout << dataReceived[i];
                // cout << endl;
                dataReceived[i] = 'Z';
            }
            // dataReceivedLock.unlock();
        }
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
    // addFood.stop();
	cout << "Main thread finished." << endl;


	return 0;
}
