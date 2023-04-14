#include "mouse.h"
#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>

#include <iostream>
#include <thread>
using namespace std;


struct MyMouseCallback : Mousecallback {
public:
	void hasData(int x, int y, bool left, bool middle, bool right) {
		if (x == 0 && y == 0 && !left && !middle && !right)return;
		cout << "x=" << x << "  y=" << y << endl;
		cout << "left=" << left << "  middle="<< middle << "  right=" << right << endl;
	}
};

int main()
{
	MyMouseCallback callback; // 这个是回调函数
	Mouse mouse;	// 这个是真正的线程
	mouse.registerCallback(&callback); // 线程注册回调函数
	mouse.start(); // 线程开启时就声明了这个线程从哪个函数开始执行 // t = thread(&Mouse::ReadMouse,this);

	cout << "Mouse Listening started." << endl;

	sleep(5);

	mouse.stop();
	cout << "Main thread finished." << endl;
	return 0;
}

/*

*/