# if you don't know what this file is, see README.md

cmake_minimum_required(VERSION 3.15)
project(Geist VERSION 0.1.0 LANGUAGES C CXX)

# Set C++17 standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Enable solution folders in Visual Studio
set_property(GLOBAL PROPERTY USE_FOLDERS ON)

# Options
option(GEIST_BUILD_EXAMPLES "Build example applications" ON)
option(GEIST_BUILD_GHOST "Build Ghost GUI editor tool" ON)

# ============================================================================
# Lua Library (prebuilt or built from source)
# ============================================================================
# Check if prebuilt lua libraries exist (both Debug and Release)
if(WIN32)
    set(LUA_LIB_PATH_DEBUG "${CMAKE_CURRENT_SOURCE_DIR}/ThirdParty/lua/lib/Debug/lua.lib")
    set(LUA_LIB_PATH_RELEASE "${CMAKE_CURRENT_SOURCE_DIR}/ThirdParty/lua/lib/Release/lua.lib")
elseif(UNIX)
    set(LUA_LIB_PATH_DEBUG "${CMAKE_CURRENT_SOURCE_DIR}/ThirdParty/lua/lib/Debug/liblua.a")
    set(LUA_LIB_PATH_RELEASE "${CMAKE_CURRENT_SOURCE_DIR}/ThirdParty/lua/lib/Release/liblua.a")
endif()

if(EXISTS ${LUA_LIB_PATH_DEBUG} AND EXISTS ${LUA_LIB_PATH_RELEASE})
    # Use prebuilt lua libraries (like raylib)
    add_library(lua STATIC IMPORTED GLOBAL)
    set_target_properties(lua PROPERTIES
        IMPORTED_LOCATION "${LUA_LIB_PATH_RELEASE}"
        IMPORTED_LOCATION_DEBUG "${LUA_LIB_PATH_DEBUG}"
        IMPORTED_LOCATION_RELEASE "${LUA_LIB_PATH_RELEASE}"
        INTERFACE_INCLUDE_DIRECTORIES "${CMAKE_CURRENT_SOURCE_DIR}/ThirdParty/lua/Source"
    )
    add_library(Geist::lua ALIAS lua)
    set(LUA_PREBUILT TRUE)
    message(STATUS "Using prebuilt Lua libraries:")
    message(STATUS "  Debug:   ${LUA_LIB_PATH_DEBUG}")
    message(STATUS "  Release: ${LUA_LIB_PATH_RELEASE}")
else()
    # Build lua from source and output to ThirdParty/lua/lib/Debug and Release
    file(GLOB LUA_SOURCES "ThirdParty/lua/src/*.c")
    list(FILTER LUA_SOURCES EXCLUDE REGEX "lua\\.c$")
    list(FILTER LUA_SOURCES EXCLUDE REGEX "luac\\.c$")

    add_library(lua STATIC ${LUA_SOURCES})
    target_include_directories(lua PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/ThirdParty/lua/src>
    )
    set_target_properties(lua PROPERTIES
        LINKER_LANGUAGE C
        POSITION_INDEPENDENT_CODE ON
        FOLDER "Geist/ThirdParty"
        ARCHIVE_OUTPUT_DIRECTORY_DEBUG "${CMAKE_CURRENT_SOURCE_DIR}/ThirdParty/lua/lib/Debug"
        ARCHIVE_OUTPUT_DIRECTORY_RELEASE "${CMAKE_CURRENT_SOURCE_DIR}/ThirdParty/lua/lib/Release"
        ARCHIVE_OUTPUT_DIRECTORY_RELWITHDEBINFO "${CMAKE_CURRENT_SOURCE_DIR}/ThirdParty/lua/lib/Release"
        ARCHIVE_OUTPUT_DIRECTORY_MINSIZEREL "${CMAKE_CURRENT_SOURCE_DIR}/ThirdParty/lua/lib/Release"
    )
    add_library(Geist::lua ALIAS lua)
    set(LUA_PREBUILT FALSE)
    message(STATUS "Building Lua from source (will output to ThirdParty/lua/lib/Debug and Release)")
endif()

# ============================================================================
# Raylib (imported prebuilt library)
# ============================================================================
add_library(raylib STATIC IMPORTED GLOBAL)

if(WIN32)
    set_target_properties(raylib PROPERTIES
        IMPORTED_LOCATION "${CMAKE_CURRENT_SOURCE_DIR}/ThirdParty/raylib/lib/raylib.lib"
        INTERFACE_INCLUDE_DIRECTORIES "${CMAKE_CURRENT_SOURCE_DIR}/ThirdParty/raylib/include"
    )
elseif(UNIX AND NOT APPLE)
    set_target_properties(raylib PROPERTIES
        IMPORTED_LOCATION "${CMAKE_CURRENT_SOURCE_DIR}/ThirdParty/raylib/lib/libraylib.a"
        INTERFACE_INCLUDE_DIRECTORIES "${CMAKE_CURRENT_SOURCE_DIR}/ThirdParty/raylib/include"
    )
elseif(APPLE)
    set_target_properties(raylib PROPERTIES
        IMPORTED_LOCATION "${CMAKE_CURRENT_SOURCE_DIR}/ThirdParty/raylib/lib/libraylib.a"
        INTERFACE_INCLUDE_DIRECTORIES "${CMAKE_CURRENT_SOURCE_DIR}/ThirdParty/raylib/include"
    )
endif()

add_library(Geist::raylib ALIAS raylib)

# ============================================================================
# nlohmann/json (header-only interface library)
# ============================================================================
add_library(nlohmann_json INTERFACE)
target_include_directories(nlohmann_json INTERFACE
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/ThirdParty>
)

add_library(Geist::json ALIAS nlohmann_json)

# ============================================================================
# Geist Library
# ============================================================================
file(GLOB GEIST_SOURCES
    "src/*.cpp"
    "tools/ghost/Source/GhostSerializer.cpp"
    "tools/ghost/Source/GhostWindow.cpp"
    "tools/ghost/Source/GhostState.cpp"
    "tools/ghost/Source/GhostResourceLoader.cpp"
)

file(GLOB GEIST_HEADERS
    "include/geist/*.h"
)

add_library(geist STATIC ${GEIST_SOURCES} ${GEIST_HEADERS})

target_include_directories(geist PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/ThirdParty/raylib/include>
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/ThirdParty/lua/Source>
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/ThirdParty>
)

# Private include for ghost tool source files that haven't been moved yet
target_include_directories(geist PRIVATE
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/tools/ghost/Source>
)

target_compile_features(geist PUBLIC cxx_std_17)

# Platform-specific settings
if(WIN32)
    target_compile_definitions(geist PUBLIC
        PLATFORM_DESKTOP
        GRAPHICS_API_OPENGL_33
    )
    target_compile_definitions(geist PRIVATE
        _CRT_SECURE_NO_WARNINGS
    )

    target_link_libraries(geist INTERFACE
        lua
        raylib
        nlohmann_json
        winmm
        OpenGL32
        gdi32
    )

elseif(UNIX AND NOT APPLE)
    target_compile_definitions(geist PUBLIC
        PLATFORM_DESKTOP
        GRAPHICS_API_OPENGL_33
    )

    target_link_libraries(geist INTERFACE
        lua
        raylib
        nlohmann_json
        GL
        m
        pthread
        dl
        rt
        X11
    )

elseif(APPLE)
    target_compile_definitions(geist PUBLIC
        PLATFORM_DESKTOP
        GRAPHICS_API_OPENGL_33
    )

    target_link_libraries(geist INTERFACE
        lua
        raylib
        nlohmann_json
        "-framework Cocoa"
        "-framework OpenGL"
        "-framework IOKit"
    )
endif()

target_compile_definitions(geist PRIVATE
    $<$<CONFIG:Debug>:DEBUG_MODE>
    $<$<CONFIG:Release>:RELEASE_MODE>
    $<$<CONFIG:Release>:NDEBUG>
)

if(MSVC)
    target_compile_options(geist PRIVATE
        /W3
        /MP
        $<$<CONFIG:Debug>:/Od /Zi>
        $<$<CONFIG:Release>:/O2>
    )
else()
    target_compile_options(geist PRIVATE
        -Wall
        $<$<CONFIG:Debug>:-g>
        $<$<CONFIG:Release>:-O2>
    )
endif()

set_target_properties(geist PROPERTIES FOLDER "Geist")
add_library(Geist::geist ALIAS geist)

# ============================================================================
# Examples
# ============================================================================
if(GEIST_BUILD_EXAMPLES)
    if(WIN32)
        add_executable(minimal_example WIN32 examples/minimal/main.cpp)
    else()
        add_executable(minimal_example examples/minimal/main.cpp)
    endif()

    target_link_libraries(minimal_example PRIVATE geist)
    set_target_properties(minimal_example PROPERTIES FOLDER "Geist/Examples")

    add_custom_command(TARGET minimal_example POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy_if_different
            ${CMAKE_CURRENT_SOURCE_DIR}/examples/minimal/engine.cfg
            $<TARGET_FILE_DIR:minimal_example>/engine.cfg
    )

    if(WIN32)
        set_target_properties(minimal_example PROPERTIES
            LINK_FLAGS "/ENTRY:mainCRTStartup"
        )
    endif()

    set_property(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY VS_STARTUP_PROJECT minimal_example)
endif()

# ============================================================================
# Ghost Editor Tool
# ============================================================================
if(GEIST_BUILD_GHOST)
    message(STATUS "Generating embedded resources...")
    execute_process(
        COMMAND ${CMAKE_COMMAND}
            -DOUTPUT_DIR=${CMAKE_BINARY_DIR}
            -DSOURCE_DIR=${CMAKE_SOURCE_DIR}
            -P ${CMAKE_SOURCE_DIR}/tools/ghost/embed_resources.cmake
        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
        RESULT_VARIABLE EMBED_RESULT
        OUTPUT_VARIABLE EMBED_OUTPUT
        ERROR_VARIABLE EMBED_ERROR
    )
    if(NOT EMBED_RESULT EQUAL 0)
        message(FATAL_ERROR "Failed to generate embedded resources:\n${EMBED_OUTPUT}\n${EMBED_ERROR}")
    endif()
    message(STATUS "Embedded resources generated successfully")

    if(WIN32)
        add_executable(ghost WIN32
            tools/ghost/Source/Main.cpp
            tools/ghost/Source/GhostResourceLoader.cpp
            tools/ghost/Source/ColorPickerState.cpp
            tools/ghost/Source/SpritePickerState.cpp
            tools/ghost/Source/FileChooserState.cpp
            tools/ghost/resources/ghost.rc
        )
    else()
        add_executable(ghost
            tools/ghost/Source/Main.cpp
            tools/ghost/Source/GhostResourceLoader.cpp
            tools/ghost/Source/ColorPickerState.cpp
            tools/ghost/Source/SpritePickerState.cpp
            tools/ghost/Source/FileChooserState.cpp
        )
    endif()

    target_include_directories(ghost PRIVATE
        ${CMAKE_CURRENT_BINARY_DIR}
        ${CMAKE_CURRENT_SOURCE_DIR}
        ${CMAKE_CURRENT_SOURCE_DIR}/tools/ghost/Source
    )

    target_link_libraries(ghost PRIVATE geist)
    target_compile_definitions(ghost PRIVATE GHOST_USE_EMBEDDED_RESOURCES)

    if(WIN32)
        set_target_properties(ghost PROPERTIES
            LINK_FLAGS "/ENTRY:mainCRTStartup"
            VS_DEBUGGER_WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/tools/ghost/data"
        )

        add_custom_command(TARGET ghost POST_BUILD
            COMMAND ${CMAKE_COMMAND} -E copy $<TARGET_FILE:ghost>
                    "${CMAKE_CURRENT_SOURCE_DIR}/tools/ghost/data/"
            COMMENT "Copying Ghost executable to data directory"
        )
    else()
        set_target_properties(ghost PROPERTIES
            RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/tools/ghost/data"
        )
    endif()
endif()

message(STATUS "")
message(STATUS "Geist Configuration:")
message(STATUS "  Version:        ${PROJECT_VERSION}")
message(STATUS "  Build examples: ${GEIST_BUILD_EXAMPLES}")
message(STATUS "  Build Ghost:    ${GEIST_BUILD_GHOST}")
message(STATUS "")
message(STATUS "Available targets: Geist::geist, Geist::lua, Geist::raylib, Geist::json")
message(STATUS "")
