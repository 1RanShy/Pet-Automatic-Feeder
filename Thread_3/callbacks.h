#include "scanf.h"
#include <iostream>
using namespace std;

/*
    This Calllback belongs to Scan Class
*/
struct MyScanCallback : Scancallback {
public:
	void print(string input) {
        cout << "您的输入是:" << input << endl;
	}
	void print2() {
        cout << "函数2测试"<< endl;
	}
};