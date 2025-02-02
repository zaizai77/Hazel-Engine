﻿#pragma once

#ifdef HZ_PLATFORM_WINDOWAS
#ifdef HAZEL_BUILD_DLL 
	#define HAZEL_API __declspec(dllexport)
#else 
	#define HAZEL_API __declspec(dllimport)
#endif // HZ_BUILD_DLL
#else 
	#error Hazel only support Windows!
#endif // HZ_PLATFORM_WINDOWAS

#define BIT(X) (1 << X)
