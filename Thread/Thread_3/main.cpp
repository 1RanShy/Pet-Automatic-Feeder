#include "scanf.h"
#include "callbacks.h"
#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <iostream>
#include <thread>
using namespace std;



int main()
{
	MyScanCallback callback; // 这个是回调函数
	Scan scan;	// 这个是真正的线程
	scan.registerCallback(&callback); // 线程注册回调函数
	scan.start(); // 线程开启时就声明了这个线程从哪个函数开始执行 // t = thread(&scan::Readscan,this);

	cout << "scan Listening started." << endl;

	sleep(5);

	scan.stop();
	cout << "Main thread finished." << endl;
	return 0;
}

/*

*/