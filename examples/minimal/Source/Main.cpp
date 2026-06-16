///////////////////////////////////////////////////////////////////////////
//
// Name:     MAIN.CPP
// Author:   Anthony Salter
// Date:     2/03/05
// Purpose:  Contains the entry point for the program.
//
///////////////////////////////////////////////////////////////////////////

#include "Geist/Globals.h"
#include "Geist/Engine.h"
#include "Geist/StateMachine.h"
#include "raylib.h"
#include <string>
#include <memory>
#include <filesystem>

#include "llimits.h"
#include "GameGlobals.h"

#include "rlgl.h"

#define RLGL_IMPLEMENTATION
#define RLGL_SOFT_RENDER

#ifdef _WIN32
// Forward declare Windows types and functions we need
typedef void* HWND;
typedef void* HICON;
typedef void* HMODULE;
typedef void* HINSTANCE;
#ifdef _WIN64
typedef long long LONG_PTR;
#else
typedef long LONG_PTR;
#endif
typedef LONG_PTR LRESULT;
typedef LONG_PTR LPARAM;
typedef unsigned int UINT;

#define MAKEINTRESOURCE(i) ((char*)((unsigned long long)((unsigned short)(i))))
#define WM_SETICON 0x0080
#define ICON_SMALL 0
#define ICON_BIG 1
#define IMAGE_ICON 1
#define LR_DEFAULTSIZE 0x0040
#define LR_SHARED 0x8000

extern "C" {
	__declspec(dllimport) HWND __stdcall GetActiveWindow(void);
	__declspec(dllimport) HICON __stdcall LoadIconA(HINSTANCE hInstance, const char* lpIconName);
	__declspec(dllimport) HMODULE __stdcall GetModuleHandleA(const char* lpModuleName);
	__declspec(dllimport) LRESULT __stdcall SendMessageA(HWND hWnd, UINT Msg, LPARAM wParam, LPARAM lParam);
}

#define LoadIcon LoadIconA
#define GetModuleHandle GetModuleHandleA
#define SendMessage SendMessageA
#endif


using namespace std;
using namespace std::filesystem;

int main(int argv, char** argc)
{
   // Create global engine instance
   g_Engine = std::make_unique<Engine>();

   // Initialize with configuration file
   g_Engine->Init("engine.cfg");
	g_Engine->m_useVirtualResolution = true;

	// Create global objects
	g_drawScale = g_Engine->m_ScreenHeight / g_Engine->m_RenderHeight;

	g_font = make_shared<Font>(LoadFontEx("Fonts/softsquare.ttf", 9, NULL, 0));
	g_smallFont = make_shared<Font>(LoadFontEx("Fonts/littleleague.ttf", 7, NULL, 0));

   // Create and register our example state
   TitleState* titleState = new TitleState();
   titleState->Init("");
   g_StateMachine->RegisterState(STATE_TITLESTATE, titleState, "TitleState");

	SetupGameState* setupGameState = new SetupGameState();
	setupGameState->Init("");
	g_StateMachine->RegisterState(STATE_SETUPGAMESTATE, setupGameState, "SetupGameState");

	CastleDesignState* castleDesignState = new CastleDesignState();
	castleDesignState->Init("");
	g_StateMachine->RegisterState(STATE_CASTLEDESIGNSTATE, castleDesignState, "CastleDesignState");

	MainState* mainState = new MainState();
	mainState->Init("");
	g_StateMachine->RegisterState(STATE_MAINSTATE, mainState, "MainState");

	CombatState* combatState = new CombatState();
	combatState->Init("");
	g_StateMachine->RegisterState(STATE_COMBATSTATE, combatState, "CombatState");

	OptionsState* optionsState = new OptionsState();
	optionsState->Init("");
	g_StateMachine->RegisterState(STATE_OPTIONSSTATE, optionsState, "OptionsState");

   g_StateMachine->MakeStateTransition(STATE_TITLESTATE);

   // Main game loop
   while (!g_Engine->m_Done && !WindowShouldClose())
   {
      g_Engine->Update();
      g_Engine->Draw();
   }

   // Cleanup
   g_Engine->Shutdown();

   return 0;
}
