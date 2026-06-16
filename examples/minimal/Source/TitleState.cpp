#include <string>
#include <iomanip>
#include "Geist/Engine.h"
#include "Geist/Globals.h"

#include "GameGlobals.h"

using namespace std;

void TitleState::Init(const std::string& configfile)
{

}

void TitleState::Shutdown()
{

}

void TitleState::OnEnter()
{

}

void TitleState::OnExit()
{

}

void TitleState::Update()
{
	// Check for exit
	if (IsKeyPressed(KEY_ESCAPE))
	{
		g_Engine->m_Done = true;
	}
}

void TitleState::Draw()
{
	DrawRectangle(0, 0, g_Engine->m_RenderWidth, g_Engine->m_RenderHeight, BLUE);
	//DrawTextEx(*g_font, "Hello!", {0, 0}, g_font->baseSize, 1, WHITE);
	DrawOutlinedText(g_font, "Hello!", {0, 0}, g_font->baseSize, 1, WHITE);

	DrawOutlinedText(g_smallFont, "Hello!", {0, 20}, g_smallFont->baseSize, 1, WHITE);

}