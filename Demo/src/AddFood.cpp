#include "AddFood.h"
#include "SR04.h"
#include "Servo.h"
#include "globalVar.h"
#include "HumanSensor.h"
#include "Pump.h"
#include"foodWaterDetect.h"
#include <iostream>
#include <thread>
using namespace std;
/*
	This is a thread to :
	1. Switch between automatic feeding and manual feeding mode
	2. Detect whether the pet is eating using a human body sensor
	3. In automatic feeding mode: 
	Automatically add food and water by using an ultrasonic distance sensor to 
	determine the remaining amount of food and water.
*/
/*
	Automatically detect whether the food has decreased, and if so, refill the food
	Detect frequency : 1 time/s
	The timer will call this function.
*/
void AddFood::scanFoodWater() {
    running = true;
	gpioSetTimerFunc(0, 1000, AddFoodcallback::addFoodWater);//1s callback timer
    while (running) //while(1)
    {

    }
}

// void AddFood::registerCallback(AddFoodcallback* af){
// 	addFoodCallbacks.push_back(af);
// }

void AddFood::start(){
	gpioInitialise();
	t = thread(&AddFood::scanFoodWater,this);
}

void AddFood::stop(){
	// running = false;
	t.join();
}
