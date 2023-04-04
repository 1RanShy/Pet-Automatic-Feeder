
#include <iostream>
#include <thread>
#include <vector>

// 定义一个strcur 
// struct 默认 public继承
// class默认 private继承
struct Scancallback {
public:
	virtual void print(std::string input) = 0;// 纯虚函数 必须在类中声明 
    virtual void print2() = 0;// 纯虚函数 必须在类中声明 
};

// 这个是按键扫描事件 为一个类
class Scan{
private:
	std::string c;
	bool running;
	std::thread t;
	void scanKeyboard();
	std::vector<Scancallback*> scanCallbacks; // Vector<类型>标识符
public:
	void registerCallback(Scancallback* mc);
	void start();
	void stop();
};
