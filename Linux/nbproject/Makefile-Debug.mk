#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Environment
MKDIR=mkdir
CP=cp
GREP=grep
NM=nm
CCADMIN=CCadmin
RANLIB=ranlib
CC=gcc
CCC=g++
CXX=g++
FC=gfortran
AS=as

# Macros
CND_PLATFORM=GNU-Linux
CND_DLIB_EXT=so
CND_CONF=Debug
CND_DISTDIR=dist
CND_BUILDDIR=build

# Include project Makefile
include Makefile

# Object Directory
OBJECTDIR=${CND_BUILDDIR}/${CND_CONF}/${CND_PLATFORM}

# Object Files
OBJECTFILES= \
	${OBJECTDIR}/_ext/fcdaa271/BaseUnits.o \
	${OBJECTDIR}/_ext/fcdaa271/Config.o \
	${OBJECTDIR}/_ext/fcdaa271/Display.o \
	${OBJECTDIR}/_ext/fcdaa271/Engine.o \
	${OBJECTDIR}/_ext/fcdaa271/Font.o \
	${OBJECTDIR}/_ext/fcdaa271/GUIElements.o \
	${OBJECTDIR}/_ext/fcdaa271/Globals.o \
	${OBJECTDIR}/_ext/fcdaa271/Gui.o \
	${OBJECTDIR}/_ext/fcdaa271/IO.o \
	${OBJECTDIR}/_ext/fcdaa271/Input.o \
	${OBJECTDIR}/_ext/fcdaa271/Logging.o \
	${OBJECTDIR}/_ext/fcdaa271/MemoryManager.o \
	${OBJECTDIR}/_ext/fcdaa271/ParticleSystem.o \
	${OBJECTDIR}/_ext/fcdaa271/Primitives.o \
	${OBJECTDIR}/_ext/fcdaa271/RNG.o \
	${OBJECTDIR}/_ext/fcdaa271/ResourceManager.o \
	${OBJECTDIR}/_ext/fcdaa271/Sound.o \
	${OBJECTDIR}/_ext/fcdaa271/StateMachine.o \
	${OBJECTDIR}/_ext/fcdaa271/SteamManager.o \
	${OBJECTDIR}/_ext/fcdaa271/TooltipSystem.o \
	${OBJECTDIR}/_ext/f4c466b2/soloud_sfxr.o \
	${OBJECTDIR}/_ext/d5c9a5c7/darray.o \
	${OBJECTDIR}/_ext/d5c9a5c7/klatt.o \
	${OBJECTDIR}/_ext/d5c9a5c7/resonator.o \
	${OBJECTDIR}/_ext/d5c9a5c7/soloud_speech.o \
	${OBJECTDIR}/_ext/d5c9a5c7/tts.o \
	${OBJECTDIR}/_ext/49f5e027/dr_impl.o \
	${OBJECTDIR}/_ext/49f5e027/soloud_wav.o \
	${OBJECTDIR}/_ext/49f5e027/soloud_wavstream.o \
	${OBJECTDIR}/_ext/49f5e027/stb_vorbis.o \
	${OBJECTDIR}/_ext/34b27db4/soloud_sdl2_static.o \
	${OBJECTDIR}/_ext/2955b066/soloud.o \
	${OBJECTDIR}/_ext/2955b066/soloud_audiosource.o \
	${OBJECTDIR}/_ext/2955b066/soloud_bus.o \
	${OBJECTDIR}/_ext/2955b066/soloud_core_3d.o \
	${OBJECTDIR}/_ext/2955b066/soloud_core_basicops.o \
	${OBJECTDIR}/_ext/2955b066/soloud_core_faderops.o \
	${OBJECTDIR}/_ext/2955b066/soloud_core_filterops.o \
	${OBJECTDIR}/_ext/2955b066/soloud_core_getters.o \
	${OBJECTDIR}/_ext/2955b066/soloud_core_setters.o \
	${OBJECTDIR}/_ext/2955b066/soloud_core_voicegroup.o \
	${OBJECTDIR}/_ext/2955b066/soloud_core_voiceops.o \
	${OBJECTDIR}/_ext/2955b066/soloud_fader.o \
	${OBJECTDIR}/_ext/2955b066/soloud_fft.o \
	${OBJECTDIR}/_ext/2955b066/soloud_fft_lut.o \
	${OBJECTDIR}/_ext/2955b066/soloud_file.o \
	${OBJECTDIR}/_ext/2955b066/soloud_filter.o \
	${OBJECTDIR}/_ext/2955b066/soloud_queue.o \
	${OBJECTDIR}/_ext/2955b066/soloud_thread.o \
	${OBJECTDIR}/_ext/2f72b67f/soloud_bassboostfilter.o \
	${OBJECTDIR}/_ext/2f72b67f/soloud_biquadresonantfilter.o \
	${OBJECTDIR}/_ext/2f72b67f/soloud_dcremovalfilter.o \
	${OBJECTDIR}/_ext/2f72b67f/soloud_echofilter.o \
	${OBJECTDIR}/_ext/2f72b67f/soloud_fftfilter.o \
	${OBJECTDIR}/_ext/2f72b67f/soloud_flangerfilter.o \
	${OBJECTDIR}/_ext/2f72b67f/soloud_lofifilter.o \
	${OBJECTDIR}/_ext/2f72b67f/soloud_robotizefilter.o \
	${OBJECTDIR}/_ext/2f72b67f/soloud_waveshaperfilter.o \
	${OBJECTDIR}/_ext/d7af6fe0/tinyxml2.o


# C Compiler Flags
CFLAGS=

# CC Compiler Flags
CCFLAGS=-m64
CXXFLAGS=-m64

# Fortran Compiler Flags
FFLAGS=

# Assembler Flags
ASFLAGS=

# Link Libraries and Options
LDLIBSOPTIONS=

# Build Targets
.build-conf: ${BUILD_SUBPROJECTS}
	"${MAKE}"  -f nbproject/Makefile-${CND_CONF}.mk ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/framework.a

${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/framework.a: ${OBJECTFILES}
	${MKDIR} -p ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}
	${RM} ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/framework.a
	${AR} -rv ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/framework.a ${OBJECTFILES} 
	$(RANLIB) ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/framework.a

${OBJECTDIR}/_ext/fcdaa271/BaseUnits.o: ../../../Libraries/Framework/Source/BaseUnits.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/fcdaa271
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I../../glm -I../../glew/include -I../../stb_truetype -I../../tinyxml2 -I../../steamworks/sdk/public/steam -I../../SoLoud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/fcdaa271/BaseUnits.o ../../../Libraries/Framework/Source/BaseUnits.cpp

${OBJECTDIR}/_ext/fcdaa271/Config.o: ../../../Libraries/Framework/Source/Config.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/fcdaa271
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I../../glm -I../../glew/include -I../../stb_truetype -I../../tinyxml2 -I../../steamworks/sdk/public/steam -I../../SoLoud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/fcdaa271/Config.o ../../../Libraries/Framework/Source/Config.cpp

${OBJECTDIR}/_ext/fcdaa271/Display.o: ../../../Libraries/Framework/Source/Display.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/fcdaa271
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I../../glm -I../../glew/include -I../../stb_truetype -I../../tinyxml2 -I../../steamworks/sdk/public/steam -I../../SoLoud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/fcdaa271/Display.o ../../../Libraries/Framework/Source/Display.cpp

${OBJECTDIR}/_ext/fcdaa271/Engine.o: ../../../Libraries/Framework/Source/Engine.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/fcdaa271
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I../../glm -I../../glew/include -I../../stb_truetype -I../../tinyxml2 -I../../steamworks/sdk/public/steam -I../../SoLoud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/fcdaa271/Engine.o ../../../Libraries/Framework/Source/Engine.cpp

${OBJECTDIR}/_ext/fcdaa271/Font.o: ../../../Libraries/Framework/Source/Font.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/fcdaa271
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I../../glm -I../../glew/include -I../../stb_truetype -I../../tinyxml2 -I../../steamworks/sdk/public/steam -I../../SoLoud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/fcdaa271/Font.o ../../../Libraries/Framework/Source/Font.cpp

${OBJECTDIR}/_ext/fcdaa271/GUIElements.o: ../../../Libraries/Framework/Source/GUIElements.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/fcdaa271
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I../../glm -I../../glew/include -I../../stb_truetype -I../../tinyxml2 -I../../steamworks/sdk/public/steam -I../../SoLoud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/fcdaa271/GUIElements.o ../../../Libraries/Framework/Source/GUIElements.cpp

${OBJECTDIR}/_ext/fcdaa271/Globals.o: ../../../Libraries/Framework/Source/Globals.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/fcdaa271
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I../../glm -I../../glew/include -I../../stb_truetype -I../../tinyxml2 -I../../steamworks/sdk/public/steam -I../../SoLoud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/fcdaa271/Globals.o ../../../Libraries/Framework/Source/Globals.cpp

${OBJECTDIR}/_ext/fcdaa271/Gui.o: ../../../Libraries/Framework/Source/Gui.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/fcdaa271
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I../../glm -I../../glew/include -I../../stb_truetype -I../../tinyxml2 -I../../steamworks/sdk/public/steam -I../../SoLoud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/fcdaa271/Gui.o ../../../Libraries/Framework/Source/Gui.cpp

${OBJECTDIR}/_ext/fcdaa271/IO.o: ../../../Libraries/Framework/Source/IO.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/fcdaa271
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I../../glm -I../../glew/include -I../../stb_truetype -I../../tinyxml2 -I../../steamworks/sdk/public/steam -I../../SoLoud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/fcdaa271/IO.o ../../../Libraries/Framework/Source/IO.cpp

${OBJECTDIR}/_ext/fcdaa271/Input.o: ../../../Libraries/Framework/Source/Input.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/fcdaa271
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I../../glm -I../../glew/include -I../../stb_truetype -I../../tinyxml2 -I../../steamworks/sdk/public/steam -I../../SoLoud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/fcdaa271/Input.o ../../../Libraries/Framework/Source/Input.cpp

${OBJECTDIR}/_ext/fcdaa271/Logging.o: ../../../Libraries/Framework/Source/Logging.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/fcdaa271
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I../../glm -I../../glew/include -I../../stb_truetype -I../../tinyxml2 -I../../steamworks/sdk/public/steam -I../../SoLoud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/fcdaa271/Logging.o ../../../Libraries/Framework/Source/Logging.cpp

${OBJECTDIR}/_ext/fcdaa271/MemoryManager.o: ../../../Libraries/Framework/Source/MemoryManager.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/fcdaa271
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I../../glm -I../../glew/include -I../../stb_truetype -I../../tinyxml2 -I../../steamworks/sdk/public/steam -I../../SoLoud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/fcdaa271/MemoryManager.o ../../../Libraries/Framework/Source/MemoryManager.cpp

${OBJECTDIR}/_ext/fcdaa271/ParticleSystem.o: ../../../Libraries/Framework/Source/ParticleSystem.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/fcdaa271
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I../../glm -I../../glew/include -I../../stb_truetype -I../../tinyxml2 -I../../steamworks/sdk/public/steam -I../../SoLoud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/fcdaa271/ParticleSystem.o ../../../Libraries/Framework/Source/ParticleSystem.cpp

${OBJECTDIR}/_ext/fcdaa271/Primitives.o: ../../../Libraries/Framework/Source/Primitives.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/fcdaa271
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I../../glm -I../../glew/include -I../../stb_truetype -I../../tinyxml2 -I../../steamworks/sdk/public/steam -I../../SoLoud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/fcdaa271/Primitives.o ../../../Libraries/Framework/Source/Primitives.cpp

${OBJECTDIR}/_ext/fcdaa271/RNG.o: ../../../Libraries/Framework/Source/RNG.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/fcdaa271
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I../../glm -I../../glew/include -I../../stb_truetype -I../../tinyxml2 -I../../steamworks/sdk/public/steam -I../../SoLoud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/fcdaa271/RNG.o ../../../Libraries/Framework/Source/RNG.cpp

${OBJECTDIR}/_ext/fcdaa271/ResourceManager.o: ../../../Libraries/Framework/Source/ResourceManager.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/fcdaa271
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I../../glm -I../../glew/include -I../../stb_truetype -I../../tinyxml2 -I../../steamworks/sdk/public/steam -I../../SoLoud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/fcdaa271/ResourceManager.o ../../../Libraries/Framework/Source/ResourceManager.cpp

${OBJECTDIR}/_ext/fcdaa271/Sound.o: ../../../Libraries/Framework/Source/Sound.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/fcdaa271
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I../../glm -I../../glew/include -I../../stb_truetype -I../../tinyxml2 -I../../steamworks/sdk/public/steam -I../../SoLoud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/fcdaa271/Sound.o ../../../Libraries/Framework/Source/Sound.cpp

${OBJECTDIR}/_ext/fcdaa271/StateMachine.o: ../../../Libraries/Framework/Source/StateMachine.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/fcdaa271
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I../../glm -I../../glew/include -I../../stb_truetype -I../../tinyxml2 -I../../steamworks/sdk/public/steam -I../../SoLoud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/fcdaa271/StateMachine.o ../../../Libraries/Framework/Source/StateMachine.cpp

${OBJECTDIR}/_ext/fcdaa271/SteamManager.o: ../../../Libraries/Framework/Source/SteamManager.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/fcdaa271
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I../../glm -I../../glew/include -I../../stb_truetype -I../../tinyxml2 -I../../steamworks/sdk/public/steam -I../../SoLoud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/fcdaa271/SteamManager.o ../../../Libraries/Framework/Source/SteamManager.cpp

${OBJECTDIR}/_ext/fcdaa271/TooltipSystem.o: ../../../Libraries/Framework/Source/TooltipSystem.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/fcdaa271
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I../../glm -I../../glew/include -I../../stb_truetype -I../../tinyxml2 -I../../steamworks/sdk/public/steam -I../../SoLoud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/fcdaa271/TooltipSystem.o ../../../Libraries/Framework/Source/TooltipSystem.cpp

${OBJECTDIR}/_ext/f4c466b2/soloud_sfxr.o: ../../../Libraries/SoLoud/src/audiosource/sfxr/soloud_sfxr.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/f4c466b2
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I../../glm -I../../glew/include -I../../stb_truetype -I../../tinyxml2 -I../../steamworks/sdk/public/steam -I../../SoLoud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/f4c466b2/soloud_sfxr.o ../../../Libraries/SoLoud/src/audiosource/sfxr/soloud_sfxr.cpp

${OBJECTDIR}/_ext/d5c9a5c7/darray.o: ../../../Libraries/SoLoud/src/audiosource/speech/darray.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/d5c9a5c7
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I../../glm -I../../glew/include -I../../stb_truetype -I../../tinyxml2 -I../../steamworks/sdk/public/steam -I../../SoLoud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/d5c9a5c7/darray.o ../../../Libraries/SoLoud/src/audiosource/speech/darray.cpp

${OBJECTDIR}/_ext/d5c9a5c7/klatt.o: ../../../Libraries/SoLoud/src/audiosource/speech/klatt.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/d5c9a5c7
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I../../glm -I../../glew/include -I../../stb_truetype -I../../tinyxml2 -I../../steamworks/sdk/public/steam -I../../SoLoud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/d5c9a5c7/klatt.o ../../../Libraries/SoLoud/src/audiosource/speech/klatt.cpp

${OBJECTDIR}/_ext/d5c9a5c7/resonator.o: ../../../Libraries/SoLoud/src/audiosource/speech/resonator.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/d5c9a5c7
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I../../glm -I../../glew/include -I../../stb_truetype -I../../tinyxml2 -I../../steamworks/sdk/public/steam -I../../SoLoud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/d5c9a5c7/resonator.o ../../../Libraries/SoLoud/src/audiosource/speech/resonator.cpp

${OBJECTDIR}/_ext/d5c9a5c7/soloud_speech.o: ../../../Libraries/SoLoud/src/audiosource/speech/soloud_speech.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/d5c9a5c7
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I../../glm -I../../glew/include -I../../stb_truetype -I../../tinyxml2 -I../../steamworks/sdk/public/steam -I../../SoLoud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/d5c9a5c7/soloud_speech.o ../../../Libraries/SoLoud/src/audiosource/speech/soloud_speech.cpp

${OBJECTDIR}/_ext/d5c9a5c7/tts.o: ../../../Libraries/SoLoud/src/audiosource/speech/tts.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/d5c9a5c7
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I../../glm -I../../glew/include -I../../stb_truetype -I../../tinyxml2 -I../../steamworks/sdk/public/steam -I../../SoLoud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/d5c9a5c7/tts.o ../../../Libraries/SoLoud/src/audiosource/speech/tts.cpp

${OBJECTDIR}/_ext/49f5e027/dr_impl.o: ../../../Libraries/SoLoud/src/audiosource/wav/dr_impl.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/49f5e027
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I../../glm -I../../glew/include -I../../stb_truetype -I../../tinyxml2 -I../../steamworks/sdk/public/steam -I../../SoLoud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/49f5e027/dr_impl.o ../../../Libraries/SoLoud/src/audiosource/wav/dr_impl.cpp

${OBJECTDIR}/_ext/49f5e027/soloud_wav.o: ../../../Libraries/SoLoud/src/audiosource/wav/soloud_wav.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/49f5e027
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I../../glm -I../../glew/include -I../../stb_truetype -I../../tinyxml2 -I../../steamworks/sdk/public/steam -I../../SoLoud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/49f5e027/soloud_wav.o ../../../Libraries/SoLoud/src/audiosource/wav/soloud_wav.cpp

${OBJECTDIR}/_ext/49f5e027/soloud_wavstream.o: ../../../Libraries/SoLoud/src/audiosource/wav/soloud_wavstream.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/49f5e027
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I../../glm -I../../glew/include -I../../stb_truetype -I../../tinyxml2 -I../../steamworks/sdk/public/steam -I../../SoLoud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/49f5e027/soloud_wavstream.o ../../../Libraries/SoLoud/src/audiosource/wav/soloud_wavstream.cpp

${OBJECTDIR}/_ext/49f5e027/stb_vorbis.o: ../../../Libraries/SoLoud/src/audiosource/wav/stb_vorbis.c
	${MKDIR} -p ${OBJECTDIR}/_ext/49f5e027
	${RM} "$@.d"
	$(COMPILE.c) -g -DWITH_SDL2_STATIC -I/usr/include/SDL2 -I../../glm -I../../glew/include -I../../stb_truetype -I../../tinyxml2 -I../../steamworks/sdk/public/steam -I../../SoLoud/include -I../Source -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/49f5e027/stb_vorbis.o ../../../Libraries/SoLoud/src/audiosource/wav/stb_vorbis.c

${OBJECTDIR}/_ext/34b27db4/soloud_sdl2_static.o: ../../../Libraries/SoLoud/src/backend/sdl2_static/soloud_sdl2_static.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/34b27db4
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I../../glm -I../../glew/include -I../../stb_truetype -I../../tinyxml2 -I../../steamworks/sdk/public/steam -I../../SoLoud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/34b27db4/soloud_sdl2_static.o ../../../Libraries/SoLoud/src/backend/sdl2_static/soloud_sdl2_static.cpp

${OBJECTDIR}/_ext/2955b066/soloud.o: ../../../Libraries/SoLoud/src/core/soloud.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/2955b066
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I../../glm -I../../glew/include -I../../stb_truetype -I../../tinyxml2 -I../../steamworks/sdk/public/steam -I../../SoLoud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/2955b066/soloud.o ../../../Libraries/SoLoud/src/core/soloud.cpp

${OBJECTDIR}/_ext/2955b066/soloud_audiosource.o: ../../../Libraries/SoLoud/src/core/soloud_audiosource.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/2955b066
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I../../glm -I../../glew/include -I../../stb_truetype -I../../tinyxml2 -I../../steamworks/sdk/public/steam -I../../SoLoud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/2955b066/soloud_audiosource.o ../../../Libraries/SoLoud/src/core/soloud_audiosource.cpp

${OBJECTDIR}/_ext/2955b066/soloud_bus.o: ../../../Libraries/SoLoud/src/core/soloud_bus.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/2955b066
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I../../glm -I../../glew/include -I../../stb_truetype -I../../tinyxml2 -I../../steamworks/sdk/public/steam -I../../SoLoud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/2955b066/soloud_bus.o ../../../Libraries/SoLoud/src/core/soloud_bus.cpp

${OBJECTDIR}/_ext/2955b066/soloud_core_3d.o: ../../../Libraries/SoLoud/src/core/soloud_core_3d.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/2955b066
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I../../glm -I../../glew/include -I../../stb_truetype -I../../tinyxml2 -I../../steamworks/sdk/public/steam -I../../SoLoud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/2955b066/soloud_core_3d.o ../../../Libraries/SoLoud/src/core/soloud_core_3d.cpp

${OBJECTDIR}/_ext/2955b066/soloud_core_basicops.o: ../../../Libraries/SoLoud/src/core/soloud_core_basicops.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/2955b066
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I../../glm -I../../glew/include -I../../stb_truetype -I../../tinyxml2 -I../../steamworks/sdk/public/steam -I../../SoLoud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/2955b066/soloud_core_basicops.o ../../../Libraries/SoLoud/src/core/soloud_core_basicops.cpp

${OBJECTDIR}/_ext/2955b066/soloud_core_faderops.o: ../../../Libraries/SoLoud/src/core/soloud_core_faderops.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/2955b066
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I../../glm -I../../glew/include -I../../stb_truetype -I../../tinyxml2 -I../../steamworks/sdk/public/steam -I../../SoLoud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/2955b066/soloud_core_faderops.o ../../../Libraries/SoLoud/src/core/soloud_core_faderops.cpp

${OBJECTDIR}/_ext/2955b066/soloud_core_filterops.o: ../../../Libraries/SoLoud/src/core/soloud_core_filterops.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/2955b066
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I../../glm -I../../glew/include -I../../stb_truetype -I../../tinyxml2 -I../../steamworks/sdk/public/steam -I../../SoLoud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/2955b066/soloud_core_filterops.o ../../../Libraries/SoLoud/src/core/soloud_core_filterops.cpp

${OBJECTDIR}/_ext/2955b066/soloud_core_getters.o: ../../../Libraries/SoLoud/src/core/soloud_core_getters.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/2955b066
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I../../glm -I../../glew/include -I../../stb_truetype -I../../tinyxml2 -I../../steamworks/sdk/public/steam -I../../SoLoud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/2955b066/soloud_core_getters.o ../../../Libraries/SoLoud/src/core/soloud_core_getters.cpp

${OBJECTDIR}/_ext/2955b066/soloud_core_setters.o: ../../../Libraries/SoLoud/src/core/soloud_core_setters.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/2955b066
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I../../glm -I../../glew/include -I../../stb_truetype -I../../tinyxml2 -I../../steamworks/sdk/public/steam -I../../SoLoud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/2955b066/soloud_core_setters.o ../../../Libraries/SoLoud/src/core/soloud_core_setters.cpp

${OBJECTDIR}/_ext/2955b066/soloud_core_voicegroup.o: ../../../Libraries/SoLoud/src/core/soloud_core_voicegroup.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/2955b066
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I../../glm -I../../glew/include -I../../stb_truetype -I../../tinyxml2 -I../../steamworks/sdk/public/steam -I../../SoLoud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/2955b066/soloud_core_voicegroup.o ../../../Libraries/SoLoud/src/core/soloud_core_voicegroup.cpp

${OBJECTDIR}/_ext/2955b066/soloud_core_voiceops.o: ../../../Libraries/SoLoud/src/core/soloud_core_voiceops.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/2955b066
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I../../glm -I../../glew/include -I../../stb_truetype -I../../tinyxml2 -I../../steamworks/sdk/public/steam -I../../SoLoud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/2955b066/soloud_core_voiceops.o ../../../Libraries/SoLoud/src/core/soloud_core_voiceops.cpp

${OBJECTDIR}/_ext/2955b066/soloud_fader.o: ../../../Libraries/SoLoud/src/core/soloud_fader.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/2955b066
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I../../glm -I../../glew/include -I../../stb_truetype -I../../tinyxml2 -I../../steamworks/sdk/public/steam -I../../SoLoud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/2955b066/soloud_fader.o ../../../Libraries/SoLoud/src/core/soloud_fader.cpp

${OBJECTDIR}/_ext/2955b066/soloud_fft.o: ../../../Libraries/SoLoud/src/core/soloud_fft.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/2955b066
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I../../glm -I../../glew/include -I../../stb_truetype -I../../tinyxml2 -I../../steamworks/sdk/public/steam -I../../SoLoud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/2955b066/soloud_fft.o ../../../Libraries/SoLoud/src/core/soloud_fft.cpp

${OBJECTDIR}/_ext/2955b066/soloud_fft_lut.o: ../../../Libraries/SoLoud/src/core/soloud_fft_lut.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/2955b066
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I../../glm -I../../glew/include -I../../stb_truetype -I../../tinyxml2 -I../../steamworks/sdk/public/steam -I../../SoLoud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/2955b066/soloud_fft_lut.o ../../../Libraries/SoLoud/src/core/soloud_fft_lut.cpp

${OBJECTDIR}/_ext/2955b066/soloud_file.o: ../../../Libraries/SoLoud/src/core/soloud_file.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/2955b066
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I../../glm -I../../glew/include -I../../stb_truetype -I../../tinyxml2 -I../../steamworks/sdk/public/steam -I../../SoLoud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/2955b066/soloud_file.o ../../../Libraries/SoLoud/src/core/soloud_file.cpp

${OBJECTDIR}/_ext/2955b066/soloud_filter.o: ../../../Libraries/SoLoud/src/core/soloud_filter.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/2955b066
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I../../glm -I../../glew/include -I../../stb_truetype -I../../tinyxml2 -I../../steamworks/sdk/public/steam -I../../SoLoud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/2955b066/soloud_filter.o ../../../Libraries/SoLoud/src/core/soloud_filter.cpp

${OBJECTDIR}/_ext/2955b066/soloud_queue.o: ../../../Libraries/SoLoud/src/core/soloud_queue.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/2955b066
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I../../glm -I../../glew/include -I../../stb_truetype -I../../tinyxml2 -I../../steamworks/sdk/public/steam -I../../SoLoud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/2955b066/soloud_queue.o ../../../Libraries/SoLoud/src/core/soloud_queue.cpp

${OBJECTDIR}/_ext/2955b066/soloud_thread.o: ../../../Libraries/SoLoud/src/core/soloud_thread.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/2955b066
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I../../glm -I../../glew/include -I../../stb_truetype -I../../tinyxml2 -I../../steamworks/sdk/public/steam -I../../SoLoud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/2955b066/soloud_thread.o ../../../Libraries/SoLoud/src/core/soloud_thread.cpp

${OBJECTDIR}/_ext/2f72b67f/soloud_bassboostfilter.o: ../../../Libraries/SoLoud/src/filter/soloud_bassboostfilter.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/2f72b67f
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I../../glm -I../../glew/include -I../../stb_truetype -I../../tinyxml2 -I../../steamworks/sdk/public/steam -I../../SoLoud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/2f72b67f/soloud_bassboostfilter.o ../../../Libraries/SoLoud/src/filter/soloud_bassboostfilter.cpp

${OBJECTDIR}/_ext/2f72b67f/soloud_biquadresonantfilter.o: ../../../Libraries/SoLoud/src/filter/soloud_biquadresonantfilter.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/2f72b67f
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I../../glm -I../../glew/include -I../../stb_truetype -I../../tinyxml2 -I../../steamworks/sdk/public/steam -I../../SoLoud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/2f72b67f/soloud_biquadresonantfilter.o ../../../Libraries/SoLoud/src/filter/soloud_biquadresonantfilter.cpp

${OBJECTDIR}/_ext/2f72b67f/soloud_dcremovalfilter.o: ../../../Libraries/SoLoud/src/filter/soloud_dcremovalfilter.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/2f72b67f
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I../../glm -I../../glew/include -I../../stb_truetype -I../../tinyxml2 -I../../steamworks/sdk/public/steam -I../../SoLoud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/2f72b67f/soloud_dcremovalfilter.o ../../../Libraries/SoLoud/src/filter/soloud_dcremovalfilter.cpp

${OBJECTDIR}/_ext/2f72b67f/soloud_echofilter.o: ../../../Libraries/SoLoud/src/filter/soloud_echofilter.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/2f72b67f
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I../../glm -I../../glew/include -I../../stb_truetype -I../../tinyxml2 -I../../steamworks/sdk/public/steam -I../../SoLoud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/2f72b67f/soloud_echofilter.o ../../../Libraries/SoLoud/src/filter/soloud_echofilter.cpp

${OBJECTDIR}/_ext/2f72b67f/soloud_fftfilter.o: ../../../Libraries/SoLoud/src/filter/soloud_fftfilter.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/2f72b67f
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I../../glm -I../../glew/include -I../../stb_truetype -I../../tinyxml2 -I../../steamworks/sdk/public/steam -I../../SoLoud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/2f72b67f/soloud_fftfilter.o ../../../Libraries/SoLoud/src/filter/soloud_fftfilter.cpp

${OBJECTDIR}/_ext/2f72b67f/soloud_flangerfilter.o: ../../../Libraries/SoLoud/src/filter/soloud_flangerfilter.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/2f72b67f
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I../../glm -I../../glew/include -I../../stb_truetype -I../../tinyxml2 -I../../steamworks/sdk/public/steam -I../../SoLoud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/2f72b67f/soloud_flangerfilter.o ../../../Libraries/SoLoud/src/filter/soloud_flangerfilter.cpp

${OBJECTDIR}/_ext/2f72b67f/soloud_lofifilter.o: ../../../Libraries/SoLoud/src/filter/soloud_lofifilter.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/2f72b67f
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I../../glm -I../../glew/include -I../../stb_truetype -I../../tinyxml2 -I../../steamworks/sdk/public/steam -I../../SoLoud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/2f72b67f/soloud_lofifilter.o ../../../Libraries/SoLoud/src/filter/soloud_lofifilter.cpp

${OBJECTDIR}/_ext/2f72b67f/soloud_robotizefilter.o: ../../../Libraries/SoLoud/src/filter/soloud_robotizefilter.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/2f72b67f
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I../../glm -I../../glew/include -I../../stb_truetype -I../../tinyxml2 -I../../steamworks/sdk/public/steam -I../../SoLoud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/2f72b67f/soloud_robotizefilter.o ../../../Libraries/SoLoud/src/filter/soloud_robotizefilter.cpp

${OBJECTDIR}/_ext/2f72b67f/soloud_waveshaperfilter.o: ../../../Libraries/SoLoud/src/filter/soloud_waveshaperfilter.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/2f72b67f
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I../../glm -I../../glew/include -I../../stb_truetype -I../../tinyxml2 -I../../steamworks/sdk/public/steam -I../../SoLoud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/2f72b67f/soloud_waveshaperfilter.o ../../../Libraries/SoLoud/src/filter/soloud_waveshaperfilter.cpp

${OBJECTDIR}/_ext/d7af6fe0/tinyxml2.o: ../../../Libraries/tinyxml2/tinyxml2.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/d7af6fe0
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I../../glm -I../../glew/include -I../../stb_truetype -I../../tinyxml2 -I../../steamworks/sdk/public/steam -I../../SoLoud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/d7af6fe0/tinyxml2.o ../../../Libraries/tinyxml2/tinyxml2.cpp

# Subprojects
.build-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${CND_BUILDDIR}/${CND_CONF}

# Subprojects
.clean-subprojects:

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
