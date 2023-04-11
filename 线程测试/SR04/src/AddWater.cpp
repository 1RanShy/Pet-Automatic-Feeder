#include "../include/AddWater.h"
#include "SR04.h"
#include "pump_control.h"
#include <iostream>
#include <thread>

using namespace std;

void AddWater::scanWater(){
    running = true;
    SR04 water(23,24);

    while (running)
    {
        cout << "Start";
        distance = water.get_distance();
        if (distance > 10)
        {
            for(auto aw: addWaterCallbacks){
                aw ->addWater();
            }
        }
        if (distance < 5)
        {
            for(auto aw: addWaterCallbacks){
                aw->stopAdd();
            }
        }
    }
}

void AddWater::registerCallback(AddWatercallback* aw){
    addWaterCallbacks.push_back(aw);
}

void AddWater::start(){
    t = thread(&AddWater::scanWater,this);
}

void AddWater::stop(){
    running = false;
    t.join();
}
