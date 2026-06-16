#include <iosfwd>
#include <memory>
#include <string>
#include <sstream>
#include <vector>

#include "Geist/Globals.h"

#include "GameGlobals.h"

#include "Engine.h"
#include "raylib.h"

using namespace std;

void DrawOutlinedText(std::shared_ptr<Font> font, const std::string& text, Vector2 position, float fontSize, int spacing, Color color)
{
	DrawTextEx(*font, text.c_str(), Vector2{ position.x + 1, position.y + 1 }, fontSize, spacing, Color{ 0, 0, 0, color.a });
	DrawTextEx(*font, text.c_str(), Vector2{ position.x, position.y + 1 }, fontSize, spacing, Color{ 0, 0, 0, color.a });
	DrawTextEx(*font, text.c_str(), Vector2{ position.x - 1, position.y - 1 }, fontSize, spacing, Color{ 0, 0, 0, color.a });
	DrawTextEx(*font, text.c_str(), Vector2{ position.x, position.y - 1 }, fontSize, spacing, Color{ 0, 0, 0, color.a });
	DrawTextEx(*font, text.c_str(), Vector2{ position.x + 1, position.y - 1 }, fontSize, spacing, Color{ 0, 0, 0, color.a });
	DrawTextEx(*font, text.c_str(), Vector2{ position.x + 1, position.y }, fontSize, spacing, Color{ 0, 0, 0, color.a });
	DrawTextEx(*font, text.c_str(), Vector2{ position.x - 1, position.y + 1 }, fontSize, spacing, Color{ 0, 0, 0, color.a });
	DrawTextEx(*font, text.c_str(), Vector2{ position.x - 1, position.y }, fontSize, spacing, Color{ 0, 0, 0, color.a });
	DrawTextEx(*font, text.c_str(), position, fontSize, spacing, color);
}

void DrawParagraph(std::shared_ptr<Font> font, const std::string& text, Vector2 position, float maxwidth, float fontSize, int spacing, Color color, bool outlined)
{
	std::istringstream iss(text);
	std::string word;
	std::vector<std::string> lines;
	float lineWidth = 0;

	string rawline;
	string line;
	while (getline(iss, rawline))
	{
		std::stringstream lineStream(rawline);
		while (lineStream >> word)
		{
			int currentLineWidth = MeasureTextEx(*font, (line + word).c_str(), fontSize, spacing).x;
			if (currentLineWidth > maxwidth)
			{
				lines.push_back(line);
				line.clear();
				line += word + " ";
			}
			else
			{
				line += word + " ";
			}
		}

		lines.push_back(line);

		line.clear();
	}

	auto it = lines.begin();
	float y = position.y;
	while (it != lines.end())
	{
		if (outlined)
		{
			DrawOutlinedText(font, (*it).c_str(), Vector2{ position.x, y }, fontSize, spacing, color);
		}
		else
		{
			DrawTextEx(*font, (*it).c_str(), Vector2{ position.x, y }, fontSize, spacing, color);
		}
		y += fontSize * 1.2f;
		++it;
	}
}

std::vector<ConsoleString> g_ConsoleStrings;

void DrawConsole()
{
	int counter = 0;
	vector<ConsoleString>::iterator node = g_ConsoleStrings.begin();
	float shadowOffset = 1;
	if (shadowOffset < 1)
	{
		shadowOffset = 1;
	}
	for (node; node != g_ConsoleStrings.end(); ++node)
	{
		float elapsed = GetTime() - (*node).m_StartTime;
		if (elapsed > 9)
		{
			float alpha = float(9 - elapsed);
			if (alpha == 1.0f)
			{
				alpha = 0;
			}
			(*node).m_Color.a = alpha * 255;
		}

		if (elapsed < 10)
		{
			DrawOutlinedText(g_smallFont, (*node).m_String.c_str(), Vector2{ 0, float(counter * (g_smallFont->baseSize + 2)) }, g_smallFont->baseSize, 1, (*node).m_Color);

		}
		++counter;
	}

	node = g_ConsoleStrings.begin();
	for (node; node != g_ConsoleStrings.end();)
	{
		if (GetTime() - (*node).m_StartTime > 10)
		{
			node = g_ConsoleStrings.erase(node);
		}
		else
		{
			++node;
		}
	}
}

void DrawPerfCounter(Font* font, int loc)
{
	int vpos = 0;
	int hpos = 0;
	int width = g_Engine->m_RenderWidth * .20f;
	int height = g_Engine->m_RenderHeight * .20f;
	switch (loc)
	{
	case 0: // Bottom-left
		hpos = 0;
		vpos = g_Engine->m_RenderHeight - height;
		break;
	case 1: // Top-left
		hpos = 0;
		vpos = 0;
		break;
	case 2: // Bottom-right
		hpos = g_Engine->m_RenderWidth - width;
		vpos = g_Engine->m_RenderHeight - height;
		break;
	case 3: // Top-right
		hpos = g_Engine->m_RenderWidth - width;
		vpos = 0;
		break;
	}
	DrawRectangle(hpos, vpos, width, height, BLACK);
	DrawRectangleLines(hpos, vpos, width, height, BLUE);

	string perf_temp = to_string(int(1.0f / GetFrameTime())) + " fps (" + to_string(int(GetFrameTime() * 1000.0f)) + " mspf)";
	DrawTextEx(*font, perf_temp.c_str(), {hpos + (width * .05f), vpos + height - (font->baseSize * 1.01f)}, font->baseSize, 1, WHITE);
	// if (font)
	// {
	// 	DrawTextEx(*font, perf_temp.c_str(), {hpos + (width * .05f), vpos + height - (font->baseSize * 1.01f)}, font->baseSize, 1, WHITE);
	// }
	DrawTextEx(*font, "Draw", {hpos + (width * .05f), g_Engine->m_RenderHeight * .95f}, font->baseSize, 1, GREEN);
	DrawTextEx(*font, "Update", {hpos + (width * .3f), g_Engine->m_RenderHeight * .95f}, font->baseSize, 1,  YELLOW);
	DrawTextEx(*font, "Network", {hpos + (width * .65f), g_Engine->m_RenderHeight * .95f}, font->baseSize, 1, BLUE);
	int perf_i;
	for (perf_i = 0; perf_i < 50 - 1; perf_i++)
	{
		int h = std::max(1, int(g_Engine->m_UpdateFrames[perf_i] * 1000));
		int h2 = std::max(1, int(g_Engine->m_DrawFrames[perf_i] * 1000));
		DrawRectangle(hpos + 4 + (perf_i * 2), int(g_Engine->m_RenderHeight * .94f) - h, 2, h, GREEN);
		DrawRectangle(hpos + 4 + (perf_i * 2), int(g_Engine->m_RenderHeight * .94f) - (h + h2), 2, h2, YELLOW);
	}
}