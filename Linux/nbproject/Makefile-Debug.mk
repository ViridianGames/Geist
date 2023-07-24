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
	${OBJECTDIR}/_ext/98fc376a/BaseUnits.o \
	${OBJECTDIR}/_ext/98fc376a/Config.o \
	${OBJECTDIR}/_ext/98fc376a/Display.o \
	${OBJECTDIR}/_ext/98fc376a/Engine.o \
	${OBJECTDIR}/_ext/98fc376a/Font.o \
	${OBJECTDIR}/_ext/98fc376a/GUIElements.o \
	${OBJECTDIR}/_ext/98fc376a/Globals.o \
	${OBJECTDIR}/_ext/98fc376a/Gui.o \
	${OBJECTDIR}/_ext/98fc376a/IO.o \
	${OBJECTDIR}/_ext/98fc376a/Input.o \
	${OBJECTDIR}/_ext/98fc376a/Logging.o \
	${OBJECTDIR}/_ext/98fc376a/MemoryManager.o \
	${OBJECTDIR}/_ext/98fc376a/ParticleSystem.o \
	${OBJECTDIR}/_ext/98fc376a/Primitives.o \
	${OBJECTDIR}/_ext/98fc376a/RNG.o \
	${OBJECTDIR}/_ext/98fc376a/ResourceManager.o \
	${OBJECTDIR}/_ext/98fc376a/Sound.o \
	${OBJECTDIR}/_ext/98fc376a/StateMachine.o \
	${OBJECTDIR}/_ext/98fc376a/TooltipSystem.o \
	${OBJECTDIR}/_ext/1a597bf6/soloud_sfxr.o \
	${OBJECTDIR}/_ext/ea6e7a0b/darray.o \
	${OBJECTDIR}/_ext/ea6e7a0b/klatt.o \
	${OBJECTDIR}/_ext/ea6e7a0b/resonator.o \
	${OBJECTDIR}/_ext/ea6e7a0b/soloud_speech.o \
	${OBJECTDIR}/_ext/ea6e7a0b/tts.o \
	${OBJECTDIR}/_ext/b6871263/dr_impl.o \
	${OBJECTDIR}/_ext/b6871263/soloud_wav.o \
	${OBJECTDIR}/_ext/b6871263/soloud_wavstream.o \
	${OBJECTDIR}/_ext/b6871263/stb_vorbis.o \
	${OBJECTDIR}/_ext/b4a831f0/soloud_sdl2_static.o \
	${OBJECTDIR}/_ext/380d8baa/soloud.o \
	${OBJECTDIR}/_ext/380d8baa/soloud_audiosource.o \
	${OBJECTDIR}/_ext/380d8baa/soloud_bus.o \
	${OBJECTDIR}/_ext/380d8baa/soloud_core_3d.o \
	${OBJECTDIR}/_ext/380d8baa/soloud_core_basicops.o \
	${OBJECTDIR}/_ext/380d8baa/soloud_core_faderops.o \
	${OBJECTDIR}/_ext/380d8baa/soloud_core_filterops.o \
	${OBJECTDIR}/_ext/380d8baa/soloud_core_getters.o \
	${OBJECTDIR}/_ext/380d8baa/soloud_core_setters.o \
	${OBJECTDIR}/_ext/380d8baa/soloud_core_voicegroup.o \
	${OBJECTDIR}/_ext/380d8baa/soloud_core_voiceops.o \
	${OBJECTDIR}/_ext/380d8baa/soloud_fader.o \
	${OBJECTDIR}/_ext/380d8baa/soloud_fft.o \
	${OBJECTDIR}/_ext/380d8baa/soloud_fft_lut.o \
	${OBJECTDIR}/_ext/380d8baa/soloud_file.o \
	${OBJECTDIR}/_ext/380d8baa/soloud_filter.o \
	${OBJECTDIR}/_ext/380d8baa/soloud_misc.o \
	${OBJECTDIR}/_ext/380d8baa/soloud_queue.o \
	${OBJECTDIR}/_ext/380d8baa/soloud_thread.o \
	${OBJECTDIR}/_ext/6fa0d0c3/soloud_bassboostfilter.o \
	${OBJECTDIR}/_ext/6fa0d0c3/soloud_biquadresonantfilter.o \
	${OBJECTDIR}/_ext/6fa0d0c3/soloud_dcremovalfilter.o \
	${OBJECTDIR}/_ext/6fa0d0c3/soloud_echofilter.o \
	${OBJECTDIR}/_ext/6fa0d0c3/soloud_fftfilter.o \
	${OBJECTDIR}/_ext/6fa0d0c3/soloud_flangerfilter.o \
	${OBJECTDIR}/_ext/6fa0d0c3/soloud_freeverbfilter.o \
	${OBJECTDIR}/_ext/6fa0d0c3/soloud_lofifilter.o \
	${OBJECTDIR}/_ext/6fa0d0c3/soloud_robotizefilter.o \
	${OBJECTDIR}/_ext/6fa0d0c3/soloud_waveshaperfilter.o


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
	"${MAKE}"  -f nbproject/Makefile-${CND_CONF}.mk ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/geist.a

${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/geist.a: ${OBJECTFILES}
	${MKDIR} -p ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}
	${RM} ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/geist.a
	${AR} -rv ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/geist.a ${OBJECTFILES} 
	$(RANLIB) ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/geist.a

${OBJECTDIR}/_ext/98fc376a/BaseUnits.o: ../Source/BaseUnits.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/98fc376a
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I/usr/include/glm -I/usr/include/GL -I/usr/include/stb -I/usr/include/tinyxml2 -I../ThirdParty/soloud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/98fc376a/BaseUnits.o ../Source/BaseUnits.cpp

${OBJECTDIR}/_ext/98fc376a/Config.o: ../Source/Config.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/98fc376a
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I/usr/include/glm -I/usr/include/GL -I/usr/include/stb -I/usr/include/tinyxml2 -I../ThirdParty/soloud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/98fc376a/Config.o ../Source/Config.cpp

${OBJECTDIR}/_ext/98fc376a/Display.o: ../Source/Display.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/98fc376a
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I/usr/include/glm -I/usr/include/GL -I/usr/include/stb -I/usr/include/tinyxml2 -I../ThirdParty/soloud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/98fc376a/Display.o ../Source/Display.cpp

${OBJECTDIR}/_ext/98fc376a/Engine.o: ../Source/Engine.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/98fc376a
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I/usr/include/glm -I/usr/include/GL -I/usr/include/stb -I/usr/include/tinyxml2 -I../ThirdParty/soloud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/98fc376a/Engine.o ../Source/Engine.cpp

${OBJECTDIR}/_ext/98fc376a/Font.o: ../Source/Font.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/98fc376a
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I/usr/include/glm -I/usr/include/GL -I/usr/include/stb -I/usr/include/tinyxml2 -I../ThirdParty/soloud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/98fc376a/Font.o ../Source/Font.cpp

${OBJECTDIR}/_ext/98fc376a/GUIElements.o: ../Source/GUIElements.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/98fc376a
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I/usr/include/glm -I/usr/include/GL -I/usr/include/stb -I/usr/include/tinyxml2 -I../ThirdParty/soloud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/98fc376a/GUIElements.o ../Source/GUIElements.cpp

${OBJECTDIR}/_ext/98fc376a/Globals.o: ../Source/Globals.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/98fc376a
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I/usr/include/glm -I/usr/include/GL -I/usr/include/stb -I/usr/include/tinyxml2 -I../ThirdParty/soloud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/98fc376a/Globals.o ../Source/Globals.cpp

${OBJECTDIR}/_ext/98fc376a/Gui.o: ../Source/Gui.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/98fc376a
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I/usr/include/glm -I/usr/include/GL -I/usr/include/stb -I/usr/include/tinyxml2 -I../ThirdParty/soloud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/98fc376a/Gui.o ../Source/Gui.cpp

${OBJECTDIR}/_ext/98fc376a/IO.o: ../Source/IO.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/98fc376a
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I/usr/include/glm -I/usr/include/GL -I/usr/include/stb -I/usr/include/tinyxml2 -I../ThirdParty/soloud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/98fc376a/IO.o ../Source/IO.cpp

${OBJECTDIR}/_ext/98fc376a/Input.o: ../Source/Input.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/98fc376a
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I/usr/include/glm -I/usr/include/GL -I/usr/include/stb -I/usr/include/tinyxml2 -I../ThirdParty/soloud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/98fc376a/Input.o ../Source/Input.cpp

${OBJECTDIR}/_ext/98fc376a/Logging.o: ../Source/Logging.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/98fc376a
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I/usr/include/glm -I/usr/include/GL -I/usr/include/stb -I/usr/include/tinyxml2 -I../ThirdParty/soloud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/98fc376a/Logging.o ../Source/Logging.cpp

${OBJECTDIR}/_ext/98fc376a/MemoryManager.o: ../Source/MemoryManager.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/98fc376a
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I/usr/include/glm -I/usr/include/GL -I/usr/include/stb -I/usr/include/tinyxml2 -I../ThirdParty/soloud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/98fc376a/MemoryManager.o ../Source/MemoryManager.cpp

${OBJECTDIR}/_ext/98fc376a/ParticleSystem.o: ../Source/ParticleSystem.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/98fc376a
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I/usr/include/glm -I/usr/include/GL -I/usr/include/stb -I/usr/include/tinyxml2 -I../ThirdParty/soloud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/98fc376a/ParticleSystem.o ../Source/ParticleSystem.cpp

${OBJECTDIR}/_ext/98fc376a/Primitives.o: ../Source/Primitives.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/98fc376a
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I/usr/include/glm -I/usr/include/GL -I/usr/include/stb -I/usr/include/tinyxml2 -I../ThirdParty/soloud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/98fc376a/Primitives.o ../Source/Primitives.cpp

${OBJECTDIR}/_ext/98fc376a/RNG.o: ../Source/RNG.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/98fc376a
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I/usr/include/glm -I/usr/include/GL -I/usr/include/stb -I/usr/include/tinyxml2 -I../ThirdParty/soloud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/98fc376a/RNG.o ../Source/RNG.cpp

${OBJECTDIR}/_ext/98fc376a/ResourceManager.o: ../Source/ResourceManager.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/98fc376a
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I/usr/include/glm -I/usr/include/GL -I/usr/include/stb -I/usr/include/tinyxml2 -I../ThirdParty/soloud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/98fc376a/ResourceManager.o ../Source/ResourceManager.cpp

${OBJECTDIR}/_ext/98fc376a/Sound.o: ../Source/Sound.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/98fc376a
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I/usr/include/glm -I/usr/include/GL -I/usr/include/stb -I/usr/include/tinyxml2 -I../ThirdParty/soloud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/98fc376a/Sound.o ../Source/Sound.cpp

${OBJECTDIR}/_ext/98fc376a/StateMachine.o: ../Source/StateMachine.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/98fc376a
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I/usr/include/glm -I/usr/include/GL -I/usr/include/stb -I/usr/include/tinyxml2 -I../ThirdParty/soloud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/98fc376a/StateMachine.o ../Source/StateMachine.cpp

${OBJECTDIR}/_ext/98fc376a/TooltipSystem.o: ../Source/TooltipSystem.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/98fc376a
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I/usr/include/glm -I/usr/include/GL -I/usr/include/stb -I/usr/include/tinyxml2 -I../ThirdParty/soloud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/98fc376a/TooltipSystem.o ../Source/TooltipSystem.cpp

${OBJECTDIR}/_ext/1a597bf6/soloud_sfxr.o: ../ThirdParty/soloud/src/audiosource/sfxr/soloud_sfxr.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/1a597bf6
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I/usr/include/glm -I/usr/include/GL -I/usr/include/stb -I/usr/include/tinyxml2 -I../ThirdParty/soloud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1a597bf6/soloud_sfxr.o ../ThirdParty/soloud/src/audiosource/sfxr/soloud_sfxr.cpp

${OBJECTDIR}/_ext/ea6e7a0b/darray.o: ../ThirdParty/soloud/src/audiosource/speech/darray.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/ea6e7a0b
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I/usr/include/glm -I/usr/include/GL -I/usr/include/stb -I/usr/include/tinyxml2 -I../ThirdParty/soloud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/ea6e7a0b/darray.o ../ThirdParty/soloud/src/audiosource/speech/darray.cpp

${OBJECTDIR}/_ext/ea6e7a0b/klatt.o: ../ThirdParty/soloud/src/audiosource/speech/klatt.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/ea6e7a0b
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I/usr/include/glm -I/usr/include/GL -I/usr/include/stb -I/usr/include/tinyxml2 -I../ThirdParty/soloud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/ea6e7a0b/klatt.o ../ThirdParty/soloud/src/audiosource/speech/klatt.cpp

${OBJECTDIR}/_ext/ea6e7a0b/resonator.o: ../ThirdParty/soloud/src/audiosource/speech/resonator.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/ea6e7a0b
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I/usr/include/glm -I/usr/include/GL -I/usr/include/stb -I/usr/include/tinyxml2 -I../ThirdParty/soloud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/ea6e7a0b/resonator.o ../ThirdParty/soloud/src/audiosource/speech/resonator.cpp

${OBJECTDIR}/_ext/ea6e7a0b/soloud_speech.o: ../ThirdParty/soloud/src/audiosource/speech/soloud_speech.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/ea6e7a0b
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I/usr/include/glm -I/usr/include/GL -I/usr/include/stb -I/usr/include/tinyxml2 -I../ThirdParty/soloud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/ea6e7a0b/soloud_speech.o ../ThirdParty/soloud/src/audiosource/speech/soloud_speech.cpp

${OBJECTDIR}/_ext/ea6e7a0b/tts.o: ../ThirdParty/soloud/src/audiosource/speech/tts.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/ea6e7a0b
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I/usr/include/glm -I/usr/include/GL -I/usr/include/stb -I/usr/include/tinyxml2 -I../ThirdParty/soloud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/ea6e7a0b/tts.o ../ThirdParty/soloud/src/audiosource/speech/tts.cpp

${OBJECTDIR}/_ext/b6871263/dr_impl.o: ../ThirdParty/soloud/src/audiosource/wav/dr_impl.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/b6871263
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I/usr/include/glm -I/usr/include/GL -I/usr/include/stb -I/usr/include/tinyxml2 -I../ThirdParty/soloud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/b6871263/dr_impl.o ../ThirdParty/soloud/src/audiosource/wav/dr_impl.cpp

${OBJECTDIR}/_ext/b6871263/soloud_wav.o: ../ThirdParty/soloud/src/audiosource/wav/soloud_wav.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/b6871263
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I/usr/include/glm -I/usr/include/GL -I/usr/include/stb -I/usr/include/tinyxml2 -I../ThirdParty/soloud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/b6871263/soloud_wav.o ../ThirdParty/soloud/src/audiosource/wav/soloud_wav.cpp

${OBJECTDIR}/_ext/b6871263/soloud_wavstream.o: ../ThirdParty/soloud/src/audiosource/wav/soloud_wavstream.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/b6871263
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I/usr/include/glm -I/usr/include/GL -I/usr/include/stb -I/usr/include/tinyxml2 -I../ThirdParty/soloud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/b6871263/soloud_wavstream.o ../ThirdParty/soloud/src/audiosource/wav/soloud_wavstream.cpp

${OBJECTDIR}/_ext/b6871263/stb_vorbis.o: ../ThirdParty/soloud/src/audiosource/wav/stb_vorbis.c
	${MKDIR} -p ${OBJECTDIR}/_ext/b6871263
	${RM} "$@.d"
	$(COMPILE.c) -g -DWITH_SDL2_STATIC -I/usr/include/SDL2 -I/usr/include/glm -I/usr/include/GL -I/usr/include/stb -I/usr/include/tinyxml2 -I../ThirdParty/soloud/include -I../Source -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/b6871263/stb_vorbis.o ../ThirdParty/soloud/src/audiosource/wav/stb_vorbis.c

${OBJECTDIR}/_ext/b4a831f0/soloud_sdl2_static.o: ../ThirdParty/soloud/src/backend/sdl2_static/soloud_sdl2_static.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/b4a831f0
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I/usr/include/glm -I/usr/include/GL -I/usr/include/stb -I/usr/include/tinyxml2 -I../ThirdParty/soloud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/b4a831f0/soloud_sdl2_static.o ../ThirdParty/soloud/src/backend/sdl2_static/soloud_sdl2_static.cpp

${OBJECTDIR}/_ext/380d8baa/soloud.o: ../ThirdParty/soloud/src/core/soloud.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/380d8baa
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I/usr/include/glm -I/usr/include/GL -I/usr/include/stb -I/usr/include/tinyxml2 -I../ThirdParty/soloud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/380d8baa/soloud.o ../ThirdParty/soloud/src/core/soloud.cpp

${OBJECTDIR}/_ext/380d8baa/soloud_audiosource.o: ../ThirdParty/soloud/src/core/soloud_audiosource.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/380d8baa
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I/usr/include/glm -I/usr/include/GL -I/usr/include/stb -I/usr/include/tinyxml2 -I../ThirdParty/soloud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/380d8baa/soloud_audiosource.o ../ThirdParty/soloud/src/core/soloud_audiosource.cpp

${OBJECTDIR}/_ext/380d8baa/soloud_bus.o: ../ThirdParty/soloud/src/core/soloud_bus.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/380d8baa
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I/usr/include/glm -I/usr/include/GL -I/usr/include/stb -I/usr/include/tinyxml2 -I../ThirdParty/soloud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/380d8baa/soloud_bus.o ../ThirdParty/soloud/src/core/soloud_bus.cpp

${OBJECTDIR}/_ext/380d8baa/soloud_core_3d.o: ../ThirdParty/soloud/src/core/soloud_core_3d.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/380d8baa
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I/usr/include/glm -I/usr/include/GL -I/usr/include/stb -I/usr/include/tinyxml2 -I../ThirdParty/soloud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/380d8baa/soloud_core_3d.o ../ThirdParty/soloud/src/core/soloud_core_3d.cpp

${OBJECTDIR}/_ext/380d8baa/soloud_core_basicops.o: ../ThirdParty/soloud/src/core/soloud_core_basicops.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/380d8baa
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I/usr/include/glm -I/usr/include/GL -I/usr/include/stb -I/usr/include/tinyxml2 -I../ThirdParty/soloud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/380d8baa/soloud_core_basicops.o ../ThirdParty/soloud/src/core/soloud_core_basicops.cpp

${OBJECTDIR}/_ext/380d8baa/soloud_core_faderops.o: ../ThirdParty/soloud/src/core/soloud_core_faderops.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/380d8baa
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I/usr/include/glm -I/usr/include/GL -I/usr/include/stb -I/usr/include/tinyxml2 -I../ThirdParty/soloud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/380d8baa/soloud_core_faderops.o ../ThirdParty/soloud/src/core/soloud_core_faderops.cpp

${OBJECTDIR}/_ext/380d8baa/soloud_core_filterops.o: ../ThirdParty/soloud/src/core/soloud_core_filterops.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/380d8baa
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I/usr/include/glm -I/usr/include/GL -I/usr/include/stb -I/usr/include/tinyxml2 -I../ThirdParty/soloud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/380d8baa/soloud_core_filterops.o ../ThirdParty/soloud/src/core/soloud_core_filterops.cpp

${OBJECTDIR}/_ext/380d8baa/soloud_core_getters.o: ../ThirdParty/soloud/src/core/soloud_core_getters.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/380d8baa
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I/usr/include/glm -I/usr/include/GL -I/usr/include/stb -I/usr/include/tinyxml2 -I../ThirdParty/soloud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/380d8baa/soloud_core_getters.o ../ThirdParty/soloud/src/core/soloud_core_getters.cpp

${OBJECTDIR}/_ext/380d8baa/soloud_core_setters.o: ../ThirdParty/soloud/src/core/soloud_core_setters.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/380d8baa
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I/usr/include/glm -I/usr/include/GL -I/usr/include/stb -I/usr/include/tinyxml2 -I../ThirdParty/soloud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/380d8baa/soloud_core_setters.o ../ThirdParty/soloud/src/core/soloud_core_setters.cpp

${OBJECTDIR}/_ext/380d8baa/soloud_core_voicegroup.o: ../ThirdParty/soloud/src/core/soloud_core_voicegroup.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/380d8baa
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I/usr/include/glm -I/usr/include/GL -I/usr/include/stb -I/usr/include/tinyxml2 -I../ThirdParty/soloud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/380d8baa/soloud_core_voicegroup.o ../ThirdParty/soloud/src/core/soloud_core_voicegroup.cpp

${OBJECTDIR}/_ext/380d8baa/soloud_core_voiceops.o: ../ThirdParty/soloud/src/core/soloud_core_voiceops.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/380d8baa
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I/usr/include/glm -I/usr/include/GL -I/usr/include/stb -I/usr/include/tinyxml2 -I../ThirdParty/soloud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/380d8baa/soloud_core_voiceops.o ../ThirdParty/soloud/src/core/soloud_core_voiceops.cpp

${OBJECTDIR}/_ext/380d8baa/soloud_fader.o: ../ThirdParty/soloud/src/core/soloud_fader.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/380d8baa
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I/usr/include/glm -I/usr/include/GL -I/usr/include/stb -I/usr/include/tinyxml2 -I../ThirdParty/soloud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/380d8baa/soloud_fader.o ../ThirdParty/soloud/src/core/soloud_fader.cpp

${OBJECTDIR}/_ext/380d8baa/soloud_fft.o: ../ThirdParty/soloud/src/core/soloud_fft.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/380d8baa
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I/usr/include/glm -I/usr/include/GL -I/usr/include/stb -I/usr/include/tinyxml2 -I../ThirdParty/soloud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/380d8baa/soloud_fft.o ../ThirdParty/soloud/src/core/soloud_fft.cpp

${OBJECTDIR}/_ext/380d8baa/soloud_fft_lut.o: ../ThirdParty/soloud/src/core/soloud_fft_lut.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/380d8baa
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I/usr/include/glm -I/usr/include/GL -I/usr/include/stb -I/usr/include/tinyxml2 -I../ThirdParty/soloud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/380d8baa/soloud_fft_lut.o ../ThirdParty/soloud/src/core/soloud_fft_lut.cpp

${OBJECTDIR}/_ext/380d8baa/soloud_file.o: ../ThirdParty/soloud/src/core/soloud_file.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/380d8baa
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I/usr/include/glm -I/usr/include/GL -I/usr/include/stb -I/usr/include/tinyxml2 -I../ThirdParty/soloud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/380d8baa/soloud_file.o ../ThirdParty/soloud/src/core/soloud_file.cpp

${OBJECTDIR}/_ext/380d8baa/soloud_filter.o: ../ThirdParty/soloud/src/core/soloud_filter.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/380d8baa
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I/usr/include/glm -I/usr/include/GL -I/usr/include/stb -I/usr/include/tinyxml2 -I../ThirdParty/soloud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/380d8baa/soloud_filter.o ../ThirdParty/soloud/src/core/soloud_filter.cpp

${OBJECTDIR}/_ext/380d8baa/soloud_misc.o: ../ThirdParty/soloud/src/core/soloud_misc.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/380d8baa
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I/usr/include/glm -I/usr/include/GL -I/usr/include/stb -I/usr/include/tinyxml2 -I../ThirdParty/soloud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/380d8baa/soloud_misc.o ../ThirdParty/soloud/src/core/soloud_misc.cpp

${OBJECTDIR}/_ext/380d8baa/soloud_queue.o: ../ThirdParty/soloud/src/core/soloud_queue.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/380d8baa
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I/usr/include/glm -I/usr/include/GL -I/usr/include/stb -I/usr/include/tinyxml2 -I../ThirdParty/soloud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/380d8baa/soloud_queue.o ../ThirdParty/soloud/src/core/soloud_queue.cpp

${OBJECTDIR}/_ext/380d8baa/soloud_thread.o: ../ThirdParty/soloud/src/core/soloud_thread.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/380d8baa
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I/usr/include/glm -I/usr/include/GL -I/usr/include/stb -I/usr/include/tinyxml2 -I../ThirdParty/soloud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/380d8baa/soloud_thread.o ../ThirdParty/soloud/src/core/soloud_thread.cpp

${OBJECTDIR}/_ext/6fa0d0c3/soloud_bassboostfilter.o: ../ThirdParty/soloud/src/filter/soloud_bassboostfilter.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/6fa0d0c3
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I/usr/include/glm -I/usr/include/GL -I/usr/include/stb -I/usr/include/tinyxml2 -I../ThirdParty/soloud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/6fa0d0c3/soloud_bassboostfilter.o ../ThirdParty/soloud/src/filter/soloud_bassboostfilter.cpp

${OBJECTDIR}/_ext/6fa0d0c3/soloud_biquadresonantfilter.o: ../ThirdParty/soloud/src/filter/soloud_biquadresonantfilter.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/6fa0d0c3
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I/usr/include/glm -I/usr/include/GL -I/usr/include/stb -I/usr/include/tinyxml2 -I../ThirdParty/soloud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/6fa0d0c3/soloud_biquadresonantfilter.o ../ThirdParty/soloud/src/filter/soloud_biquadresonantfilter.cpp

${OBJECTDIR}/_ext/6fa0d0c3/soloud_dcremovalfilter.o: ../ThirdParty/soloud/src/filter/soloud_dcremovalfilter.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/6fa0d0c3
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I/usr/include/glm -I/usr/include/GL -I/usr/include/stb -I/usr/include/tinyxml2 -I../ThirdParty/soloud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/6fa0d0c3/soloud_dcremovalfilter.o ../ThirdParty/soloud/src/filter/soloud_dcremovalfilter.cpp

${OBJECTDIR}/_ext/6fa0d0c3/soloud_echofilter.o: ../ThirdParty/soloud/src/filter/soloud_echofilter.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/6fa0d0c3
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I/usr/include/glm -I/usr/include/GL -I/usr/include/stb -I/usr/include/tinyxml2 -I../ThirdParty/soloud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/6fa0d0c3/soloud_echofilter.o ../ThirdParty/soloud/src/filter/soloud_echofilter.cpp

${OBJECTDIR}/_ext/6fa0d0c3/soloud_fftfilter.o: ../ThirdParty/soloud/src/filter/soloud_fftfilter.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/6fa0d0c3
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I/usr/include/glm -I/usr/include/GL -I/usr/include/stb -I/usr/include/tinyxml2 -I../ThirdParty/soloud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/6fa0d0c3/soloud_fftfilter.o ../ThirdParty/soloud/src/filter/soloud_fftfilter.cpp

${OBJECTDIR}/_ext/6fa0d0c3/soloud_flangerfilter.o: ../ThirdParty/soloud/src/filter/soloud_flangerfilter.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/6fa0d0c3
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I/usr/include/glm -I/usr/include/GL -I/usr/include/stb -I/usr/include/tinyxml2 -I../ThirdParty/soloud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/6fa0d0c3/soloud_flangerfilter.o ../ThirdParty/soloud/src/filter/soloud_flangerfilter.cpp

${OBJECTDIR}/_ext/6fa0d0c3/soloud_freeverbfilter.o: ../ThirdParty/soloud/src/filter/soloud_freeverbfilter.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/6fa0d0c3
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I/usr/include/glm -I/usr/include/GL -I/usr/include/stb -I/usr/include/tinyxml2 -I../ThirdParty/soloud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/6fa0d0c3/soloud_freeverbfilter.o ../ThirdParty/soloud/src/filter/soloud_freeverbfilter.cpp

${OBJECTDIR}/_ext/6fa0d0c3/soloud_lofifilter.o: ../ThirdParty/soloud/src/filter/soloud_lofifilter.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/6fa0d0c3
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I/usr/include/glm -I/usr/include/GL -I/usr/include/stb -I/usr/include/tinyxml2 -I../ThirdParty/soloud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/6fa0d0c3/soloud_lofifilter.o ../ThirdParty/soloud/src/filter/soloud_lofifilter.cpp

${OBJECTDIR}/_ext/6fa0d0c3/soloud_robotizefilter.o: ../ThirdParty/soloud/src/filter/soloud_robotizefilter.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/6fa0d0c3
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I/usr/include/glm -I/usr/include/GL -I/usr/include/stb -I/usr/include/tinyxml2 -I../ThirdParty/soloud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/6fa0d0c3/soloud_robotizefilter.o ../ThirdParty/soloud/src/filter/soloud_robotizefilter.cpp

${OBJECTDIR}/_ext/6fa0d0c3/soloud_waveshaperfilter.o: ../ThirdParty/soloud/src/filter/soloud_waveshaperfilter.cpp
	${MKDIR} -p ${OBJECTDIR}/_ext/6fa0d0c3
	${RM} "$@.d"
	$(COMPILE.cc) -g -DWITH_SDL2_STATIC -D_DEBUG -I/usr/include/SDL2 -I/usr/include/glm -I/usr/include/GL -I/usr/include/stb -I/usr/include/tinyxml2 -I../ThirdParty/soloud/include -I../Source -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/6fa0d0c3/soloud_waveshaperfilter.o ../ThirdParty/soloud/src/filter/soloud_waveshaperfilter.cpp

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
