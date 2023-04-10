#ifndef BLUE_H
#define BLUE_H
#include<pigpio.h>

class Blue{
private:
    unsigned int serialStatus;
    char* name = "/dev/serial0"; //portname 14 15
public:
    Blue();
    void sendByte(unsigned char c);
    void readByte();
    void writeBytes(char *buff, unsigned char count);
    void readBytes(char *buff);
};

#endif