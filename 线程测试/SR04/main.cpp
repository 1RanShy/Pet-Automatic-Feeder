#include <pigpio.h>
#include "./include/pump_control.h"
#include "./include/SR04.h"
#include "./include/AddWater.h"
#include <stdio.h>
#include <iostream>
#include <chrono>
#include <thread>
#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
using namespace std;

struct MyAddWaterCallback : AddWatercallback{
public:
    void addWater(){
        PumpControl pump(17, 1000000);
        pump.start();
    }
    void stopAdd(){
        PumpControl pump(17, 1000000);
        pump.stop();
    }
};

int main()
{
    MyAddWaterCallback callback;
    AddWater addWater;
    addWater.registerCallback(&callback);
    addWater.start();

    cout << "scan Listening started." << endl;


    addWater.stop();
    cout << "Main thread finished." << endl;

    return 0;
}
