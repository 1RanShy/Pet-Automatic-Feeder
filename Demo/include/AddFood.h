#ifndef ADDFOOD_H
#define ADDFOOD_H
#include"HumanSensor.h"
#include <pigpio.h>
#include <iostream>
#include <vector>
#include <thread>
// This creates a thread
struct AddFoodcallback {
public:
	virtual void findCat(HumanSensor *sensor) = 0;
};


class AddFood{
private:
    float distance;
    bool running;
	std::thread t;
	void scanFood();//main programm to add or stop adding food/water and check if pet is eating
	std::vector<AddFoodcallback*> addFoodCallbacks; 
public:
	void registerCallback(AddFoodcallback* af);
	void start();
	void stop();

};

#endif