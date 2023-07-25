//  This is all the stuff that should be publicly available from anywhere, so
//  they all go in one file for convenience.
#ifndef _FRAMEWORKGLOBALS_H_
#define _FRAMEWORKGLOBALS_H_

#include "Engine.h"
#include "ResourceManager.h"
#include "MemoryManager.h"
#ifdef REQUIRES_STEAM
#include "SteamManager.h"
#endif
#include "StateMachine.h"
#include "Display.h"
#include "Input.h"
#include "Sound.h"
#include "Config.h"
#include "Object.h"
#include "State.h"
#include "Gui.h"
#include "GUIElements.h"
#include "Primitives.h"
#include "Logging.h"
#include "RNG.h"
#include "ParticleSystem.h"
#include "IO.h"

#include <list>
#include <deque>
#include <string>
#include <vector>
#include <memory>

#define SAFE_RELEASE(p) { if ( (p) ) { (p)->Release(); (p) = 0; } }
#define SAFE_DELETE(p) { if ( (p) ) { delete (p); (p) = 0; } }
#define SAFE_DELETE_ARRAY(p)  { if ( (p) ) { delete [] (p); (p) = 0; } }

#define PI (3.141592654f)

extern std::unique_ptr<Engine>           g_Engine;
extern std::unique_ptr<ResourceManager>  g_ResourceManager;
extern std::unique_ptr<MemoryManager>    g_MemoryManager;
extern std::unique_ptr<Display>          g_Display;
extern std::unique_ptr<Input>            g_Input;
extern std::unique_ptr<Sound>            g_Sound;
extern std::unique_ptr<StateMachine>     g_StateMachine;
#ifdef REQUIRES_STEAM
extern std::unique_ptr<SteamManager>     g_SteamManager;
#endif

//  GLM Wrappers
//glm::vec3 Normalize(glm::vec3 in);
//float Dot(glm::vec3 a, glm::vec3 b);
//glm::vec3 Cross(glm::vec3 a, glm::vec3 b);
//
//Mat4 Translate(Mat4 mat, glm::vec3 pos);
//Mat4 Rotate(Mat4 mat, float angle, glm::vec3 up);
//Mat4 Scale(Mat4 mat, glm::vec3 scaler);

int intersect_triangle(double orig[3], double dir[3],
	double vert0[3], double vert1[3], double vert2[3],
	double* t, double* u, double* v);

bool Pick(glm::vec3 _RayOrigin, glm::vec3 _RayDirection, glm::vec3 tri1, glm::vec3 tri2, glm::vec3 tri3, double& distance);

bool PickWithUV(glm::vec3 _RayOrigin, glm::vec3 _RayDirection, glm::vec3 tri1, glm::vec3 tri2, glm::vec3 tri3, double& distance, double& u, double& v);

#endif