#ifndef ADDFOOD_H
#define ADDFOOD_H
#include"HumanSensor.h"
#include "SR04.h"
#include "Servo.h"
#include "globalVar.h"
#include "HumanSensor.h"
#include "Pump.h"
#include <pigpio.h>
#include <iostream>
#include <vector>
#include <thread>
// This creates a thread

class AddFood{
private:
    float distance;
    bool running;
	std::thread t;
	void scanFoodWater();//main programm to add or stop adding food/water and check if pet is eating
	// std::vector<AddFoodcallback*> addFoodCallbacks; 
public:
	// void registerCallback(AddFoodcallback* af);
	void start();
	void stop();

};

#endif