#include "../include/AddFood.h"
#include "SR04.h"
#include "Servo.h"
#include <iostream>
#include <thread>
using namespace std;

// 这个
void AddFood::scanFood() {
    running = true;
    SR04 food(15, 14);
    
    while (running) //while(1)
    {
        cout << "Strat";
        distance = food.get_distance();
        if (distance < 6) //Using SR04 to detect remaining food.
	    {
			for(auto af: addFoodCallbacks) {
                af->addFood();
			}
	    }
        if (distance > 10)  
	    {
			for(auto af: addFoodCallbacks) {
                af->stopAdd();
			}
	    }
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
