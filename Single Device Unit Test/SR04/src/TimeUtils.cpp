#include "TimeUtils.h"
#include <iostream>

int64_t TimeUtils::getCurrentTime() {
	struct timeval tv;
	gettimeofday(&tv, NULL);    //该函数在sys/time.h头文件中
	return tv.tv_sec * 1000LL + tv.tv_usec / 1000LL;
}

// 获取系统的当前时间，单位微秒(us)
int64_t TimeUtils::getSysTimeMicros() {
#ifdef _WIN32
// 从1601年1月1日0:0:0:000到1970年1月1日0:0:0:000的时间(单位100ns)
#define EPOCHFILETIME (116444736000000000UL)
	FILETIME ft;
	LARGE_INTEGER li;
	int64_t tt = 0;
	GetSystemTimeAsFileTime(&ft);
	li.LowPart = ft.dwLowDateTime;
	li.HighPart = ft.dwHighDateTime;
	// 从1970年1月1日0:0:0:000到现在的微秒数(UTC时间)
	tt = (li.QuadPart - EPOCHFILETIME) /10;
	return tt;
#else
	timeval tv;
	gettimeofday(&tv, 0);
	return (int64_t)tv.tv_sec * 1000000 + (int64_t)tv.tv_usec;
#endif // _WIN32
	return 0;
}
