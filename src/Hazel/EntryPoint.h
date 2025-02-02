﻿#pragma once
#ifdef HZ_PLATFORM_WINDOWAS

extern Hazel::Application* Hazel::CreateApplication();

int main(int argc,char** argv) {

	Hazel::Log::Init();
	HZ_CORE_ERROR("Initialzed Log!");
	HZ_INFO("Hello!");

	printf("Hazel Engine\n");
	auto app = Hazel::CreateApplication();
	app->Run();
	delete app;
	return 0;
}
#endif // HZ_PLATFORM_WINDOWS
