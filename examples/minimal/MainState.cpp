#include <string>
#include <iomanip>
#include "Geist/Engine.h"
#include "Geist/Globals.h"

#include "LWGlobals.h"

using namespace std;

void MainState::Init(const std::string& configfile)
{

}

void MainState::Shutdown()
{

}

void MainState::OnEnter()
{

}

void MainState::OnExit()
{

}

void MainState::Update()
{
    // Check for exit
    if (IsKeyPressed(KEY_ESCAPE))
    {
        g_Engine->m_Done = true;
    }
}

void MainState::Draw()
{

}

