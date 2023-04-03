#pragma once
#include <sstream>

#ifdef _WIN32
#include <windows.h>
#else
#include <sys/time.h>
#endif  // _WIND32
// 定义64位整形
#if defined(_WIN32) && !defined(CYGWIN)
typedef __int64 int64_t;
#else 
typedef long long int64t;
#endif  // _WIN32


class TimeUtils {
public:
	//获取UTC毫秒数
	static int64_t getCurrentTime();
	//获取UTC微秒(μs)
	static int64_t getSysTimeMicros();
};
