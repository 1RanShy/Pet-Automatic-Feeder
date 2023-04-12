#ifndef GLOBALBAR_H
#define GLOBALBAR_H
#include<thread>
#include<mutex>
#include<iostream>
using namespace std;
#define TEST
/*
    Define some pin here
    #define PIN_LED 13 
*/
extern mutex datsToSendLock;
extern mutex dataReceivedLock;
extern mutex autoAddFoodFlagLock;

extern char dataToSend[5];
extern char dataReceived[5];
extern bool autoAddFoodFlag; //1: autoAddFood 0: manually addFood

#endif