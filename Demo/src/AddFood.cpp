#include "../include/AddFood.h"
#include "SR04.h"
#include "Servo.h"
#include <iostream>
#include <thread>
using namespace std;

// 这个
void AddFood::scanFood() {
	//cout << "This is used to test if there is food left" << x << endl;
    // printf("The scaf App has already run \n");
    running = true;
    SR04 food(15, 14);
    
    while (running) //while(1)
    {
        cout << "Strat";
		//每个回调函数必定有这个判断,符合就自动执行,不符合就不执行这个函数
		//要是有别的条件需要触发这个回调函数,if里面的东西直接换成别的就行了
        distance = food.get_distance();
        if (distance < 6)  //这个只是处理字符串的回调函数,如果我想我还可以设置 处理其他任务的回调函数
	    {
			for(auto af: addFoodCallbacks) {
                af->addFood();
			}
	    }
        if (distance > 10)  //这个只是处理字符串的回调函数,如果我想我还可以设置 处理其他任务的回调函数
	    {
			for(auto af: addFoodCallbacks) {
                af->stopAdd();
			}
	    }
    }
}

// float getFoodLeft()
// {

// }
void AddFood::registerCallback(AddFoodcallback* af){
	addFoodCallbacks.push_back(af);
}

void AddFood::start(){
	t = thread(&AddFood::scanFood,this);
}

void AddFood::stop(){
	running = false; //这个在我们的代码中不应该出现因为我们的代码中
	//线程会一直执行,而不是只执行5s,然后就停止  while(running){} 这个是相当于我们的while(1)
	t.join();
}
