#ifndef BLUE_H
#define BLUE_H
#include<pigpio.h>

class Blue{
private:
    unsigned int serialStatus;
    char* name = "/dev/ttyS0"; //portname
public:
    Blue();
    void sendByte(char c);
    void readByte();
    void writeBytes(char *buff, unsigned char count);
    void readBytes(char *buff);
};

#endif