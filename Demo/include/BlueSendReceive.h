#ifndef BLUSESENDRECEIVE_H
#define BLUSESENDRECEIVE_H
#include <pigpio.h>
#include <iostream>
#include <vector>
#include <thread>
/*
This creates a class specifically for receiving, 
sending, and processing Bluetooth data, 
and I believe there is a real-time aspect involved.
*/
struct BlueToothcallback {
public:
	virtual void sendData(Blue *ble) = 0; 
    virtual void receiveData(Blue *ble) = 0;
	virtual void dataProcess() = 0; //data process
};


class BLEDataProcessing{
private:
    bool running;
	std::thread t;
	void DataProcessing();//process bluetooth data
	std::vector<BlueToothcallback*> bluetoothCallbacks; 
public:
	void registerCallback(BlueToothcallback* blue);
	void start();
	void stop();
    ~BLEDataProcessing();

};


#endif
