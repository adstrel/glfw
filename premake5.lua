project "glfw"
    kind "StaticLib"
    language "C"
    staticruntime "On"
    
    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")
    
    files
    {
        "include/GLFW/glfw3.h",
        "include/GLFW/glfw3native.h",

        "src/glfw_config.h",

        "src/internal.h",
        "src/mappings.h",

        "src/context.c",
        "src/init.c",
        "src/input.c",
        "src/monitor.c",
        "src/vulkan.c",
        "src/window.c"
    }
    
    filter "system:windows"
        systemversion "latest"

        defines
        {
            "_GLFW_WIN32",
            "_CRT_SECURE_NO_WARNINGS"
        }

        files
        {
            "src/win32_platform.h",
            "src/win32_joystick.h",
            "src/wgl_context.h",
            "src/egl_context.h",
            "src/osmesa_context.h",

            "src/win32_init.c",
            "src/win32_joystick.c",
            "src/win32_monitor.c",
            "src/win32_time.c",
            "src/win32_thread.c",
            "src/win32_window.c",
            "src/wgl_context.c",
            "src/egl_context.c",
            "src/osmesa_context.c"
        }

    filter "system:linux"
        defines
        {
            "_GLFW_X11",
            "_CRT_SECURE_NO_WARNINGS"
        }

        files
        {
            "src/x11_platform.h",
            "src/xkb_unicode.h",
            "src/posix_time.h",
            "src/posix_thread.h",
            "src/glx_context.h",
            "src/egl_context.h",
            "src/osmesa_context.h",

            "src/x11_init.c",
            "src/x11_monitor.c",
            "src/x11_window.c",
            "src/xkb_unicode.c",
            "src/posix_time.c",
            "src/posix_thread.c",
            "src/glx_context.c",
            "src/egl_context.c",
            "src/osmesa_context.c",

            "src/linux_joystick.h",
            "src/linux_joystick.c"
        }

    filter "configurations:Debug"
        runtime "Debug"
        optimize "Off"
        symbols "On"

    filter "configurations:Release"
        runtime "Debug"
        optimize "Speed"
        vectorextensions "AVX2"
        symbols "On"
        flags
        {
            "LinkTimeOptimization"
        }

    filter "configurations:Dist"
        runtime "Release"
        optimize "Speed"
        vectorextensions "AVX2"
        symbols "Off"
        flags
        {
            "LinkTimeOptimization",
            "FatalWarnings"
        }
