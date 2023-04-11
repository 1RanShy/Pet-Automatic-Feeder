#ifndef BLUE_H
#define BLUE_H
#include<pigpio.h>

class Blue{
private:
    int status;
    char* name = "/dev/ttyS0"; //portname 14 15
public:
    Blue();
    ~Blue();
    void sendByte(unsigned char c);
    void readByte(char *chara);
    void writeBytes(char *buff, unsigned char count);
    void readBytes(char *buff);
    int getStatus();
};

#endif