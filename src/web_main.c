#include "shared.h"
#include "hotloaded_main.c"

#include <emscripten/emscripten.h>

GameState* game_state;

void EmscriptenUpdate()
{
    Update(game_state);
}

int main(int argumentCount, char *argumentArray[])
{
    game_state = malloc(sizeof(GameState));
    Initialize(game_state);

    emscripten_set_main_loop(EmscriptenUpdate, 0, 1);

    CloseWindow();

    return 0;
}
