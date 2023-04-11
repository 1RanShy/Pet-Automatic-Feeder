#ifndef GLOBALBAR_H
#define GLOBALBAR_H
#include<thread>
#include<mutex>
#include<iostream>
using namespace std;

extern mutex datsToSendLock;
extern mutex dataReceivedLock;
extern char dataToSend[5];
extern char dataReceived[5];


#endif