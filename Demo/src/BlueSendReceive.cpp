#include"globalVar.h"
#include "Blue.h"
#include <iostream>
#include <thread>
#include<BlueSendReceive.h>
#include<mutex>
using namespace std;
/*
	This is a thread to :
	1. Receive data
	2. Send data
	3. Process data
*/


BLEDataProcessing::~BLEDataProcessing()
{
	#ifdef TEST
	cout << "quit" <<endl;
	#endif
}
void BLEDataProcessing::DataProcessing() {
    running = true;
	// gpioSetTimerFunc(0, 1000, &timerCallback1);//1s callback
	Blue ble;
    while (running) //while(1)
    {
        if (dataToSend[4] != 'R')  //这个只是处理字符串的回调函数,如果我想我还可以设置 处理其他任务的回调函数
	    {
			cout << "------------------------" <<endl;
            for(auto blue: bluetoothCallbacks) {
				blue->sendData(&ble);
			}
	    }

/*
	Read the data together only when there are 5 data in the buffer. 
	In fact, I don't think this piece of code is universal. 
	But I have defined that the Bluetooth data is an array of 5 digits. 
	Therefore, I will not change this code.
*/
        if (serDataAvailable(ble.getStatus()) == 5) //这个只是处理字符串的回调函数,如果我想我还可以设置 处理其他任务的回调函数
	    {
			// cout << "come" <<endl;
			for(auto blue: bluetoothCallbacks) {
				blue->receiveData(&ble);
			}            
	    }

		if (dataReceived[0] != 'Z' && dataReceived[4] != 'Z') //这个只是处理字符串的回调函数,如果我想我还可以设置 处理其他任务的回调函数
	    {
			for(auto blue: bluetoothCallbacks) 
			{
				blue->dataProcess();
			}            
	    }
    }
}

void BLEDataProcessing::registerCallback(BlueToothcallback* blue){
	bluetoothCallbacks.push_back(blue);
}

void BLEDataProcessing::start(){
	gpioInitialise();
	t = thread(&BLEDataProcessing::DataProcessing,this);
}

void BLEDataProcessing::stop(){
	// running = false;
	t.join();
}
