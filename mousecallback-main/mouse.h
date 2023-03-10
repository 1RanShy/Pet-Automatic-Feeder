
#include <iostream>
#include <thread>
#include <vector>

// 定义一个strcur 
// struct 默认 public继承
// class默认 private继承
struct Mousecallback {
public:
	virtual void hasData(int x, int y, bool left, bool middle, bool right) = 0;// 纯虚函数 必须在类中声明 
};

class Mouse {
private:
	int fd = 0;
	bool running;
	std::thread t;
	void ReadMouse();
	std::vector<Mousecallback*> mouseCallbacks; // Vector<类型>标识符
public:
	void registerCallback(Mousecallback* mc);
	void start();
	void stop();
};
