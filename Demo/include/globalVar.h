#ifndef GLOBALBAR_H
#define GLOBALBAR_H
#include<mutex>
using namespace std;
#define TEST
// Pin definition
#define foodSensorTrigger 23
#define foodSensorEcho 24
#define waterSensorTrigger 8
#define waterSensorEcho 7
#define servoAddFood 16
#define humanSensorPin 1
#define pumpPin 12

//define status of food and water
#define foodFull 16.0
#define foodEmpty 17.0

#define waterFull 16.0
#define waterEmpty 17.0

extern mutex datsToSendLock;

extern char dataToSend[5];
extern char dataReceived[5];
extern bool autoAddFoodFlag; //1: autoAddFood 0: manually addFood
extern bool findCatFlag;//1: Find cat 0: do not need to find cat
#endif