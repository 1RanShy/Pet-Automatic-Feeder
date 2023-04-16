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
/*
    
    Brief functions:
    1. Automatic feeding and manual feeding.
    2. Use buttons on the mobile app to switch between automatic and manual feeding modes.
    3. It can determine whether the pet is eating or not and display this status on the mobile phone.
    4. Bluetooth can be used to interact with the cat.

*/



/*
The size of this array will not change, as I set it to 5 elements. 
Also, this array will persist throughout the entire program and will not be destroyed, 
so there is no memory leak. 
Therefore, I did not choose to use a vector, 
and the default form of the serialWrite function parameters is to pass a variable of type char *.
*/
char dataToSend[5] = {'H','E','L','L','O'};
char dataReceived[5] = {'H','E','L','L','O'};

bool autoAddFoodFlag = false; //Auto Feeder Identifier 1: autoAddFood 0: manually addFood
bool findCatFlag = false; //1: Find cat 0: do not need to find cat


struct MyBlueToothcallback : BlueToothcallback {
public:
	void sendData(Blue *ble)
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
        ble->readBytes(dataReceived);
    }

    void dataProcess()
    {
        //Process the received data 
        //and determine its validity by checking its start and end markers.
        if(dataReceived[0] == 'C' && dataReceived[4] == 'C')
        {
            //switch autoAddFood
            //Choose whether to feed automatically by send ASCII code : CAAAC
            if(dataReceived[1] == 'A' && dataReceived[2] == 'A' && dataReceived[3] == 'A')
            {
                autoAddFoodFlag = !autoAddFoodFlag;//Auto Feeder Identifier
                
                // Change array datatosend to send data.
                //make bluetooth send data
                // true: auto fedder
                if(autoAddFoodFlag == true)
                {
                    for(int i = 0; i<5; i++)
                    {
                        dataToSend[i] = '1';
                    }
                }
                //0 : mannually feeder
                else
                {
                    for(int i = 0; i<5; i++)
                    {
                        dataToSend[i] = '2';
                    }
                }
            }
            
            if(dataReceived[1] == 'B' && dataReceived[2] == 'B' && dataReceived[3] == 'B')
            {
                findCatFlag = true;
            }
            
            //Clear the received data after use, resetting it all to 'Z'.
            for(int i = 0; i<5; i++)
            {
                dataReceived[i] = 'Z';
            }
        }
    }
};


int main()
{
	// MyAddFoodCallback callback1; 
	AddFood addFood;	
	// addFood.registerCallback(&callback1); // 线程注册回调函数


	MyBlueToothcallback  callback2; 
	BLEDataProcessing dataProcess;	
	dataProcess.registerCallback(&callback2); 
	
	
    addFood.start(); 
	dataProcess.start(); 

	addFood.stop();
    dataProcess.stop();
    
	cout << "Main thread finished." << endl;


	return 0;
}
