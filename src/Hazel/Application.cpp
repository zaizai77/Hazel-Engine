﻿#include "D:\vs2022\HazelEngine\Hazel\src\Hazel\hzpch.h"
#include "Application.h"
#include "Log.h"
#include "../Hazel/Events/ApplicationEvent.h"

namespace Hazel {
	Application::~Application()
	{

	}

	Application::Application() {

	}

	void Application::Run() {

		WindowResizeEvent e(1280, 720);
		if (e.IsInCategory(EventCategoryApplication)) {
			HZ_TRACE(e.ToString());
		}
		if (e.IsInCategory(EventCategoryInput)) {
			HZ_TRACE(e.ToString());
		}


		while (true);
	}
}