CC = g++
CFLAGS = -m64 -std=c++17
DEBUG_FLAGS = -g -DDEBUG_MODE
RELEASE_FLAGS = -O2 -DRELEASE_MODE
INCLUDES = -I./Source -I./ThirdParty/raylib/build/raylib/include -I./ThirdParty/raylib/build/raylib/external -I./ThirdParty/lua/src
LIBS = -L./ThirdParty/raylib/build/raylib -lraylib -L./ThirdParty/lua/src -llua -lGL -lm -lpthread
SOURCES = $(wildcard Source/*.cpp Source/Geist/*.cpp)
DEBUG_OBJECTS = $(patsubst Source/%.cpp, Build/Debug/%.o, $(SOURCES))
RELEASE_OBJECTS = $(patsubst Source/%.cpp, Build/Release/%.o, $(SOURCES))
DEBUG_DEPENDS = $(patsubst Source/%.cpp, Build/Debug/%.d, $(SOURCES))
RELEASE_DEPENDS = $(patsubst Source/%.cpp, Build/Release/%.d, $(SOURCES))
DEBUG_TARGET = Redist/libgeist_debug.a
RELEASE_TARGET = Redist/libgeist.a
LUA_LIB = ThirdParty/lua/src/liblua.a
RAYLIB_LIB = ThirdParty/raylib/build/raylib/libraylib.a

# Default target
all: debug

# Ensure Build and Redist directories exist
Build/Debug:
	@mkdir -p Build/Debug Build/Debug/Geist

Build/Release:
	@mkdir -p Build/Release Build/Release/Geist

Redist:
	@mkdir -p Redist

# Build liblua.a if needed
$(LUA_LIB):
	$(MAKE) -C ThirdParty/lua/src linux

# Build libraylib.a if needed
$(RAYLIB_LIB):
	$(MAKE) -C ThirdParty/raylib/src PLATFORM=PLATFORM_DESKTOP

# Debug target
debug: Build/Debug Redist $(LUA_LIB) $(RAYLIB_LIB) $(DEBUG_TARGET)

$(DEBUG_TARGET): $(DEBUG_OBJECTS)
	@ar rcs $@ $^

# Release target
release: Build/Release Redist $(LUA_LIB) $(RAYLIB_LIB) $(RELEASE_TARGET)

$(RELEASE_TARGET): $(RELEASE_OBJECTS)
	@ar rcs $@ $^

# Compile source files to debug object files
Build/Debug/%.o: Source/%.cpp
	$(CC) $(DEBUG_FLAGS) $(CFLAGS) $(INCLUDES) -c $< -o $@ -MD -MP

# Compile source files to release object files
Build/Release/%.o: Source/%.cpp
	$(CC) $(RELEASE_FLAGS) $(CFLAGS) $(INCLUDES) -c $< -o $@ -MD -MP

# Include dependency files
-include $(DEBUG_DEPENDS)
-include $(RELEASE_DEPENDS)

# Clean up
clean:
	rm -rf Build Redist

.PHONY: all debug release clean