#include "mouse.h"
#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>

#include <iostream>
#include <thread>
using namespace std;


void Mouse::ReadMouse() {
    const char* pDevice = "/dev/input/mice";
    // Open Mouse
    fd = open(pDevice, O_RDWR);
    if (fd == -1)
    {
        printf("ERROR Opening %s\n", pDevice);
        return;
    }
    int left, middle, right;
    signed char x, y;
    running = true;
    while (running)
    {
	    unsigned char data[3];
	    int bytes = read(fd, data, sizeof(data));
	    if (bytes > 0)
	    {
		    int vleft = data[0] & 0x1;
		    int vright = data[0] & 0x2;
		    int vmiddle = data[0] & 0x4;
		    int x = data[1];
		    int y = data[2];
		    bool left = vleft > 0;
		    bool middle = vmiddle > 0;
		    bool right = vright > 0;
			for(auto mc: mouseCallbacks) {
		    	mc->hasData(x,y,left,middle,right);
			}
	    }
    }
    close(fd);
}

void Mouse::registerCallback(Mousecallback* mc){
	mouseCallbacks.push_back(mc);
}

void Mouse::start(){
	t = thread(&Mouse::ReadMouse,this);
}

void Mouse::stop(){
	running = false;
	t.join();
}
