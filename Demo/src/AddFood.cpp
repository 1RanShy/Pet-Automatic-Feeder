#include "AddFood.h"
#include "SR04.h"
#include "Servo.h"
#include "globalVar.h"
#include <iostream>
#include <thread>
using namespace std;

/*
	Automatically detect whether the food has decreased, and if so, refill the food
	Detect frequency : 1 time/s
	The timer will call this function.
*/
void timerCallback1()
{
	SR04 test(23,24);
	Servo add(16);
	float x = test.get_distance();
	cout << x << "cm" << endl;
	if(x < 4)
	{
		add.setAngle(0);
	}

	if(x > 10)
	{
		add.setAngle(180);
	}
	cout << "already add" << endl;
}

void AddFood::scanFood() {
    running = true;
	gpioSetTimerFunc(0, 1000, &timerCallback1);//1s callback
    
    while (running) //while(1)
    {

    }
}

void AddFood::registerCallback(AddFoodcallback* af){
	addFoodCallbacks.push_back(af);
}

void AddFood::start(){
	t = thread(&AddFood::scanFood,this);
}

void AddFood::stop(){
	running = false;
	t.join();
}
