#include "hcsr04.h"

hcsr04::hcsr04(){}

hcsr04::~hcsr04(){}



void hcsr04::init() {
	if (-1 == wiringPiSetup())
	{
		cerr << "setup error\n";
		exit(-1);
	}
	gpioSetMode(trig, PI_OUTPUT);
	gpioSetMode(echo, PI_INPUT);
	//pinMode(trig, OUTPUT);
	//pinMode(echo, INPUT);

	gpioSetMode(trig2, PI_OUTPUT);
	gpioSetMode(echo2, PI_INPUT);
}

void hcsr04::loop() {
	init();
	while (true)
	{
		implement();
		implement2();
		delay(2000);
	}
}

void hcsr04::implement() {
	//发送trig信号，持续10us 的方波脉冲
	gpioWrite(trig, 1);
	//gpioWrite(trig2, 1);
	//digitalWrite(trig, HIGH);
	//digitalWrite(trig2, HIGH);
	//接收的参数单位为 s ，于是把10 us 转换为 0.00001 s 。
	delay(0.00001);
	//关闭高电平输出
	gpioWrite(trig, 0);
	//gpioWrite(trig2, 0);
	//digitalWrite(trig, LOW);
	//digitalWrite(trig2, LOW);
	//定义开始时间和结束时间
	int64_t start, ends;

	//等待回声低电平结束（变为高电平时继续执行）
	while (gpioRead(echo) == 0){}
	//while (digitalRead(echo) == 0){}

	//开始计时（从1970年到当前微秒μs数）
	start = TimeUtils::getSysTimeMicros();

	//等待回声高电平结束（变为低电平时继续执行）
	while (gpioRead(echo) == 1){}
	//while (digitalRead(echo) == 1){}
	//结束计时（从1970年到当前微秒μs数）
	ends = TimeUtils::getSysTimeMicros();

	//实际毫秒差值（从发出声音到接到回声）
	long duration = ends - start;
	//声速=343m/s
	//(结束时间-开始时间)*声波速度/2*1000···
	//(结束时间-开始时间)*17150
	//long distance = duration * 17150LL;
	//
	//厘米
	//double speed = 343 * 10;
	//米

	cout << "总程时间:" << fixed << setprecision(6) << duration << "微秒(μs)\t\t";

	//单次毫秒数
	double distance = duration / 2.0;

	cout << "半程时间:" << fixed << setprecision(6) << distance << "微秒(μs)\t\t";

	//精确到毫米
	distance = distance * 343.0;

	cout << "测算距离为:" << fixed << setprecision(6) << distance << "微米(um)\t\t";

	//得出距离（毫米）
	distance = distance / 1000.0;
	cout << fixed << setprecision(6) << distance << "毫米(mm)\t\t";

	//得出距离（厘米） 
	distance = distance / 10.0;
	cout << fixed << setprecision(6) << distance << "厘米\t\t";

	//得出距离（米）
	distance = distance / 100.0;
	cout << fixed << setprecision(6) << distance << "米" << endl;
}

void hcsr04::implement2() {
	//发送trig信号，持续10us 的方波脉冲
	gpioWrite(trig2, 1);
	//digitalWrite(trig2, HIGH);
	//接收的参数单位为 s ，于是把10 us 转换为 0.00001 s 。
	delay(0.00001);
	//关闭高电平输出
	gpioWrite(trig2, 0);
	//digitalWrite(trig2, LOW);
	//定义开始时间和结束时间
	int64_t start, ends;

	//等待回声低电平结束（变为高电平时继续执行）
	while (gpioRead(echo2) == 0) {}
	//while (digitalRead(echo2) == 0){}

	//开始计时（从1970年到当前微秒μs数）
	start = TimeUtils::getSysTimeMicros();

	//等待回声高电平结束（变为低电平时继续执行）
	while (gpioRead(echo2) == 1){}
	//while (digitalRead(echo2) == 1){}
	//结束计时（从1970年到当前微秒μs数）
	ends = TimeUtils::getSysTimeMicros();

	//实际毫秒差值（从发出声音到接到回声）
	long duration = ends - start;
	//声速=343m/s
	//(结束时间-开始时间)*声波速度/2*1000···
	//(结束时间-开始时间)*17150
	//long distance = duration * 17150LL;
	//
	//厘米
	//double speed = 343 * 10;
	//米

	cout << "总程时间:" << fixed << setprecision(6) << duration << "微秒(μs)\t\t";

	//单次毫秒数
	double distance = duration / 2.0;

	cout << "半程时间:" << fixed << setprecision(6) << distance << "微秒(μs)\t\t";

	//精确到毫米
	distance = distance * 343.0;

	cout << "测算距离为:" << fixed << setprecision(6) << distance << "微米(um)\t\t";

	//得出距离（毫米）
	distance = distance / 1000.0;
	cout << fixed << setprecision(6) << distance << "毫米(mm)\t\t";

	//得出距离（厘米） 
	distance = distance / 10.0;
	cout << fixed << setprecision(6) << distance << "厘米\t\t";

	//得出距离（米）
	distance = distance / 100.0;
	cout << fixed << setprecision(6) << distance << "米" << endl;
}
