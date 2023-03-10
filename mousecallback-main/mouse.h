
#include <iostream>
#include <thread>
#include <vector>

struct Mousecallback {
public:
	virtual void hasData(int x, int y, bool left, bool middle, bool right) = 0;
};

class Mouse {
private:
	int fd = 0;
	bool running;
	std::thread t;
	void ReadMouse();
	std::vector<Mousecallback*> mouseCallbacks;
public:
	void registerCallback(Mousecallback* mc);
	void start();
	void stop();
};
