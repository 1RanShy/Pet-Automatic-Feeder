#include "scanf.h"
#include <iostream>
#include <thread>
using namespace std;

// 这个
void Scan::scanKeyboard(int x) {
	cout << "This is " << x << endl;
    printf("The scaf App has already run \n");
    running = true;
    while (running) //while(1)
    {
        cout << "请输入一些内容：";
        getline(std::cin, c);
		//每个回调函数必定有这个判断,符合就自动执行,不符合就不执行这个函数
		//要是有别的条件需要触发这个回调函数,if里面的东西直接换成别的就行了
	    if (c.size() > 0)  //这个只是处理字符串的回调函数,如果我想我还可以设置 处理其他任务的回调函数
	    {
			for(auto mc: scanCallbacks) {
		    	mc->print(c);
				mc->print2();
			}
	    }
	    if (c == "12")  //这个只是处理字符串的回调函数,如果我想我还可以设置 处理其他任务的回调函数
	    {
			for(auto mc: scanCallbacks) {
				mc->print2();
			}
	    }
		// if (定时器的计时大于 1)  //这个只是处理字符串的回调函数,如果我想我还可以设置 处理其他任务的回调函数
	    // {
		// 	for(auto mc: scanCallbacks) {
		//     	mc->print(c);
		// 		mc->print2();
		// 	}
	    // }
    }
}

void Scan::registerCallback(Scancallback* mc){
	scanCallbacks.push_back(mc);
}

void Scan::start(){
	t = thread(&Scan::scanKeyboard,this,2);
}

void Scan::stop(){
	running = false; //这个在我们的代码中不应该出现因为我们的代码中
	//线程会一直执行,而不是只执行5s,然后就停止  while(running){} 这个是相当于我们的while(1)
	t.join();
}

// 