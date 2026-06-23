#include <Globals.h>
#include <Engine.h>
#include <ResourceManager.h>
#include <StateMachine.h>
#include <ScriptingSystem.h>
#include <SoundSystem.h>
#include <InputSystem.h>
#include <Logging.h>
#include <sstream>
#include <fstream>
#include <chrono>

#include "rlgl.h"

using namespace std;
using namespace std::chrono;

void Engine::Init(const std::string &configfile)
{
	Log("Starting Engine::Init()");
	m_Done = false;
	m_ConfigFileName = configfile;
	m_EngineConfig.Load(configfile);

	g_ResourceManager = make_unique<ResourceManager>();
	g_ResourceManager->Init(configfile);
	g_StateMachine = make_unique<StateMachine>();
	g_StateMachine->Init(configfile);
	g_ScriptingSystem = make_unique<ScriptingSystem>();
	g_ScriptingSystem->Init(configfile);
	g_InputSystem = make_unique<InputSystem>();
	g_InputSystem->Init(configfile);

	m_GameUpdates = 0;

	m_startTime = steady_clock::now();

	m_CurrentFrame = 0;

	m_debugDrawing = false;

	m_RenderWidth = m_EngineConfig.GetNumber("h_renderres");
	m_RenderHeight = m_EngineConfig.GetNumber("v_renderres");

	m_ScreenWidth = m_EngineConfig.GetNumber("h_res");
	m_ScreenHeight = m_EngineConfig.GetNumber("v_res");

	m_useVirtualResolution = m_EngineConfig.GetNumber("use_virtual_resolution") != 0;

	//  Initialize Raylib and the screen.
	std::string windowTitle = m_EngineConfig.GetString("name");
	SetConfigFlags(FLAG_VSYNC_HINT);
	SetTraceLogLevel(LOG_NONE);
	InitWindow(g_Engine->m_EngineConfig.GetNumber("h_res"), g_Engine->m_EngineConfig.GetNumber("v_res"), windowTitle.c_str());
	SetExitKey(KEY_NULL); // We'll handle exiting with ESC
	if (g_Engine->m_EngineConfig.GetNumber("full_screen") == 1)
	{
		ToggleFullscreen();
	}
	SetTargetFPS(300);

	//  Relies on Raylib, so let's set it up after Raylib has started.
	g_SoundSystem = make_unique<SoundSystem>();
	g_SoundSystem->Init(configfile);

	HideCursor(); // We'll use our own.

	m_renderTarget = LoadRenderTexture(static_cast<int>(m_RenderWidth), static_cast<int>(m_RenderHeight));
	SetTextureFilter(m_renderTarget.texture, TEXTURE_FILTER_POINT);
	LoadMouseCursor();

	Log("Done with Engine::Init()");
}

void Engine::Shutdown()
{
	UnloadMouseCursor();
	UnloadRenderTexture(m_renderTarget);

	g_SoundSystem->Shutdown();
	g_ScriptingSystem->Shutdown();
	g_StateMachine->Shutdown();
	g_ResourceManager->Shutdown();
	g_InputSystem->Shutdown();
	CloseAudioDevice();
}

void Engine::Update()
{
	m_lastFrameInMS = GameTimeInMS() - m_lastFrameTimeStamp;
	m_lastFrameTimeStamp = GameTimeInMS();
	m_lastFrameInSecs = m_lastFrameInMS / 1000.0f;

	for (int i = 1; i < 50; ++i)
	{
		m_UpdateFrames[i - 1] = m_UpdateFrames[i];
	}
	m_UpdateFrames[49] = m_lastUpdateInMS;

	for (int i = 1; i < 50; ++i)
	{
		m_DrawFrames[i - 1] = m_DrawFrames[i];
	}
	m_DrawFrames[49] = m_lastFrameInMS - m_lastUpdateInMS;

	int64_t _updateTime = GameTimeInMS();

	g_InputSystem->Update();
	g_ResourceManager->Update();
	g_StateMachine->Update();
	g_ScriptingSystem->Update();
	g_SoundSystem->Update();

	if (WindowShouldClose())
	{
		m_Done = true;
	}

	// F12 takes a screenshot
	if (IsKeyPressed(KEY_F12))
	{
		CaptureScreenshot();
	}

	// F9 toggles the debug drawing
	if (IsKeyPressed(KEY_F9))
	{
		m_debugDrawing = !m_debugDrawing;
	}

	++m_GameUpdates;

	m_lastUpdateInMS = GameTimeInMS() - _updateTime;
	m_lastUpdateInSecs = m_lastUpdateInMS / 1000.0f;
}

void Engine::Draw()
{
	if (m_useVirtualResolution)
	{
		BeginTextureMode(m_renderTarget);
		ClearBackground(BLACK);
		g_ResourceManager->Draw();
		g_StateMachine->Draw();
		g_ScriptingSystem->Draw();
		g_InputSystem->Draw();
		DrawMouseCursor(true);
		EndTextureMode();

		BeginDrawing();
		ClearBackground(BLACK);
		DrawTexturePro(m_renderTarget.texture,
			{ 0, 0, m_RenderWidth, -m_RenderHeight },
			{ 0, 0, m_ScreenWidth, m_ScreenHeight },
			{ 0, 0 }, 0, WHITE);
		EndDrawing();
	}
	else
	{
		BeginDrawing();
		ClearBackground(BLACK);
		g_ResourceManager->Draw();
		g_StateMachine->Draw();
		g_ScriptingSystem->Draw();
		g_InputSystem->Draw();
		DrawMouseCursor(false);
		EndDrawing();
	}
}

float Engine::GetInputScale() const
{
	if (!m_useVirtualResolution || m_RenderHeight <= 0.0f)
	{
		return 1.0f;
	}

	return m_ScreenHeight / m_RenderHeight;
}

void Engine::LoadMouseCursor()
{
	const std::string cursorPath = m_EngineConfig.GetString("mouse_cursor");
	if (cursorPath.empty())
	{
		return;
	}

	m_MouseCursor = LoadTexture(cursorPath.c_str());
	if (m_MouseCursor.id == 0)
	{
		Log("Engine: Failed to load mouse cursor texture: " + cursorPath);
		return;
	}

	SetTextureFilter(m_MouseCursor, TEXTURE_FILTER_POINT);
	m_HasMouseCursor = true;
	m_MouseCursorHotspotX = static_cast<int>(m_EngineConfig.GetNumber("mouse_cursor_hotspot_x"));
	m_MouseCursorHotspotY = static_cast<int>(m_EngineConfig.GetNumber("mouse_cursor_hotspot_y"));
}

void Engine::UnloadMouseCursor()
{
	if (!m_HasMouseCursor)
	{
		return;
	}

	UnloadTexture(m_MouseCursor);
	m_MouseCursor = Texture2D{};
	m_HasMouseCursor = false;
}

void Engine::DrawMouseCursor(bool useRenderCoordinates)
{
	if (!m_HasMouseCursor || !g_StateMachine->ShouldDrawCursor() || !IsCursorOnScreen())
	{
		return;
	}

	Vector2 mouse = GetMousePosition();
	if (useRenderCoordinates)
	{
		const float inputScale = GetInputScale();
		mouse.x /= inputScale;
		mouse.y /= inputScale;
	}

	DrawTexture(
		m_MouseCursor,
		static_cast<int>(mouse.x) - m_MouseCursorHotspotX,
		static_cast<int>(mouse.y) - m_MouseCursorHotspotY,
		WHITE);
}

int64_t Engine::GameTimeInMS()
{
	return duration_cast<milliseconds>(steady_clock::now() - m_startTime).count();
}

void Engine::CaptureScreenshot()
{
	char filename[40];
	struct tm *timenow;

	time_t now = time(NULL);
	timenow = gmtime(&now);

	strftime(filename, sizeof(filename), "screenshot_%Y-%m-%d_%H_%M_%S.png", timenow);
	TakeScreenshot(filename);
}
