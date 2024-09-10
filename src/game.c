#include <raylib.h>
#include "shared.h"

#define PLAYER_SPEED 300

// Called on every frame
void Update(GameState *gameState)
{
    static float x = 0;
    static float y = 0;
    BeginDrawing();
    {
        ClearBackground((Color){25, 25, 25, 255});
        if (IsKeyDown(KEY_D)) 
        {
            x += GetFrameTime() * PLAYER_SPEED;
        }
        if (IsKeyDown(KEY_A)) 
        {
            x -= GetFrameTime() * PLAYER_SPEED;
        }
        if (IsKeyDown(KEY_S)) 
        {
            y += GetFrameTime() * PLAYER_SPEED;
        }
        if (IsKeyDown(KEY_W)) 
        {
            y -= GetFrameTime() * PLAYER_SPEED;
        }
        DrawRectangle((int)x, (int)y, 100, 100, (Color){100, 150, 50, 255});
    }
    EndDrawing();
}

// Called when you recompile the program while its running
void HotReload(GameState *gameState)
{
    TraceLog(LOG_INFO, "HOTRELOAD");
}

// Called before the dynamic libraries get swapped
void HotUnload(GameState *gameState)
{
    TraceLog(LOG_INFO, "HOTUNLOAD");
}

// Called at the the start of the program
void Initialize(GameState *gameState)
{
    InitWindow(1280, 720, "PLACEHOLDER");
    SetTargetFPS(60);
}
