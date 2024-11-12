workspace "Hazel"
    architecture "x64"

    configurations {
        "Debug",
        "Release",
        "Dist"
    }

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

-- Include directories relative to root folder (solution directory)
IncludeDir = {}
IncludeDir["GLFW"] = "vendor/GLFW?include"

include "vendor/GLFW"

project "Hazel"
    location "Hazel"
    kind "SharedLib"
    language "C++"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    pchheader "hzpch.h"
    pchsource "src/Hazel/hzpch.cpp"

    files {
        "src/**.h",
        "src/**.cpp"
    }

    includedirs {
        "%src",
        "vendor/spdlog/include"
    }

    filter "system:windows"
        cppdialect "C++17"
        staticruntime "On"
        systemversion "latest"
        
        defines {
            "HZ_PLATFORM_WINDOWAS",
            "HAZEL_BUILD_DLL",
        }

        postbuildcommands {
            ("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
        }

    filter "configurations:Debug" 
        defines "HZ_DEBUG"
        symbols "On"

    filter "configurations:Release" 
        defines "HZ_RELEASE"
        optimize "On"

    filter "configurations:Dist" 
        defines "HZ_DIST"
        optimize "On"

project "Sandbox"
        location "Sandbox"
        kind "ConsoleApp"

        language "C++"

        files {
            "../%{prj.name}/src/**.h",
            "../%{prj.name}/src/**.cpp"
        }
    
        includedirs {
            "vendor/spdlog/include",
            "D:/vs2022/HazelEngine/Hazel/src"
        }

        links {
            "Hazel"
        }

        targetdir ("bin/" .. outputdir .. "/%{prj.name}")
        objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    filter "system:windows"
        cppdialect "C++17"
        staticruntime "On"
        systemversion "latest"
        
        defines {
            "HZ_PLATFORM_WINDOWAS",
        }

        filter "configurations:Debug" 
            defines "HZ_DEBUG"
            symbols "On"

        filter "configurations:Release" 
            defines "HZ_RELEASE"
            optimize "On"

        filter "configurations:Dist" 
            defines "HZ_DIST"
            optimize "On"