#include "Game.h"
#include "Map.h"
#include "Clan.h"
#include "Render.h"

int main()
{
   InitWindow(FINAL_WIDTH, FINAL_HEIGHT, "ClanDestiny");
   SetTargetFPS(60);

   Font gameFont = LoadFontEx("Data/Fonts/softsquare.ttf", 9, nullptr, 0);
   if (gameFont.texture.id == 0)
   {
      TraceLog(LOG_ERROR, "Failed to load gameFont: Data/Fonts/softsquare.ttf");
      CloseWindow();
      return 1;
   }

   Font largeFont = LoadFontEx("Data/Fonts/softsquare.ttf", 18, nullptr, 0);
   if (largeFont.texture.id == 0)
   {
      TraceLog(LOG_ERROR, "Failed to load largeFont: Data/Fonts/softsquare.ttf");
      UnloadFont(gameFont);
      CloseWindow();
      return 1;
   }

   RenderTexture2D target = LoadRenderTexture(BASE_WIDTH, BASE_HEIGHT);
   Texture2D tileset = LoadTexture("Images/tiles.png");
   std::vector<Clan> clans;
   std::vector<SquareTile> map;
   std::vector<Village> villages;
   std::vector<Unit> units;
   generateMap(map, villages, clans);

   int viewX = GRID_WIDTH / 2;
   int viewY = GRID_HEIGHT / 2;
   float waterAnimTime = 0.0f;
   int waterFrame = 0;

   while (!WindowShouldClose())
   {
      if (IsMouseButtonDown(MOUSE_LEFT_BUTTON))
      {
         Vector2 mousePos = GetMousePosition();
         float renderMouseX = mousePos.x / SCALE_FACTOR;
         float renderMouseY = mousePos.y / SCALE_FACTOR;
         int mx = static_cast<int>((renderMouseX - MINIMAP_OFFSET_X) / MINIMAP_CELL_SIZE);
         int my = static_cast<int>((renderMouseY - MINIMAP_OFFSET_Y) / MINIMAP_CELL_SIZE);
         if (mx >= 0 && mx < GRID_WIDTH && my >= 0 && my < GRID_HEIGHT)
         {
            viewX = mx;
            viewY = my;
            if (viewX < VIEW_TILES_X / 2) viewX = VIEW_TILES_X / 2;
            if (viewX > GRID_WIDTH - VIEW_TILES_X / 2 - 1) viewX = GRID_WIDTH - VIEW_TILES_X / 2 - 1;
            if (viewY < VIEW_TILES_Y / 2) viewY = VIEW_TILES_Y / 2;
            if (viewY > GRID_HEIGHT - VIEW_TILES_Y / 2 - 1) viewY = GRID_HEIGHT - VIEW_TILES_Y / 2 - 1;
         }
      }

      drawView(target, map, tileset, viewX, viewY, waterAnimTime, waterFrame, clans, villages, gameFont, largeFont);

      BeginDrawing();
      ClearBackground(BLACK);
      DrawTexturePro(target.texture,
         { 0, 0, (float)BASE_WIDTH, (float)-BASE_HEIGHT },
         { 0, 0, (float)FINAL_WIDTH, (float)FINAL_HEIGHT },
         { 0, 0 }, 0.0f, WHITE);
      EndDrawing();
   }

   UnloadFont(largeFont);
   UnloadFont(gameFont);
   UnloadTexture(tileset);
   UnloadRenderTexture(target);
   CloseWindow();
   return 0;
}