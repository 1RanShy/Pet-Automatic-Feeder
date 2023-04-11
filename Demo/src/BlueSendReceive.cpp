#include"globalVar.h"
#include <iostream>
#include <thread>
#include<BlueSendReceive.h>
#include<mutex>
using namespace std;


void BLEDataProcessing::DataProcessing() {
    running = true;
	// gpioSetTimerFunc(0, 1000, &timerCallback1);//1s callback
    
    while (running) //while(1)
    {
        if (dataToSend[4] != 'R')  //这个只是处理字符串的回调函数,如果我想我还可以设置 处理其他任务的回调函数
	    {
			cout << "------------------------" <<endl;
            for(auto blue: bluetoothCallbacks) {
				blue->sendData();
			}
	    }

        // if (1)  //这个只是处理字符串的回调函数,如果我想我还可以设置 处理其他任务的回调函数
	    // {
		// 	cout << "come" <<endl;
		// 	for(auto blue: bluetoothCallbacks) {
		// 		blue->receiveData();
		// 	}
        //     gpioDelay(500000);
	    // }
    }
}

void BLEDataProcessing::registerCallback(BlueToothcallback* blue){
	bluetoothCallbacks.push_back(blue);
}

void BLEDataProcessing::start(){
	t = thread(&BLEDataProcessing::DataProcessing,this);
}

void BLEDataProcessing::stop(){
	running = false;
	t.join();
}
