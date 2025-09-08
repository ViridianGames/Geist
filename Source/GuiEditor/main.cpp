///////////////////////////////////////////////////////////////////////////
//
// Name:     MAIN.CPP
// Author:   Anthony Salter
// Date:     2/03/05
// Purpose:  Contains the entry point for the program.
//
///////////////////////////////////////////////////////////////////////////

#include "../Globals.h"
#include "../Engine.h"
#include "../ResourceManager.h"
#include "../StateMachine.h"
#include "../Primitives.h"
#include "../Logging.h"
#include "raylib.h"
#include "GuiEditorEngine.h"
#include "MainState.h"
#include <string>
#include <sstream>
#include <memory>
#include <filesystem>

#include "rlgl.h"

using namespace std;
using namespace std::filesystem;

int main(int argv, char** argc)
{
   try
   {
      unique_ptr<GuiEditorEngine> m_Engine = make_unique<GuiEditorEngine>();
      m_Engine->Init("Data/engine.cfg");

      //  Pick a random initial location
      int seed = (unsigned int)time(NULL);

      //  Initialize globals
      m_Engine->m_Cursor = g_ResourceManager->GetTexture("Images/pointer.png");

      m_Engine->m_DrawScale = g_Engine->m_ScreenHeight / g_Engine->m_RenderHeight;

      float baseFontSize = 9;
      const char* fontPath = "Data/Fonts/softsquare.ttf";
      //const char* fontPath = "Data/Fonts/babyblocks.ttf";

      const char* guiFontPath = "Data/Fonts/babyblocks.ttf"; float guiFontSize = 8;
      m_Engine->m_font = LoadFontEx(guiFontPath, guiFontSize, NULL, 0);
      m_Engine->m_fontSize = baseFontSize * int(m_Engine->g_DrawScale);


      Font guiFont = LoadFontEx(guiFontPath, guiFontSize, NULL, 0);
      shared_ptr<Font> g_guiFont = make_shared<Font>(guiFont);


      m_Engine->m_renderTarget = LoadRenderTexture(m_Engine->m_RenderWidth, m_Engine->m_RenderHeight);
      SetTextureFilter(m_Engine->m_renderTarget.texture, RL_TEXTURE_FILTER_ANISOTROPIC_4X);

      //  Initialize states
      Log("Initializing states.");

      State* _mainState = new MainState;
      _mainState->Init("engine.cfg");
      g_StateMachine->RegisterState(0, _mainState, "MAIN_STATE");

      g_StateMachine->MakeStateTransition(0);

      Log("Starting main loop.");
      while (!m_Engine->m_Done)
      {
         m_Engine->Update();
         m_Engine->Draw();
      }
   }

   catch (string errorCode)
   {
      Log(errorCode);
      exit(0);
   }

   return 0;
}