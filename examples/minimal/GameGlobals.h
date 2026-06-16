#include "CastleDesignState.h"
#include "CombatState.h"
#include "MainState.h"
#include "OptionsState.h"
#include "SetupGameState.h"
#include "TitleState.h"
#include "raylib.h"

enum GameStates
{
    STATE_TITLESTATE = 0,
    STATE_MAINSTATE,
    STATE_OPTIONSSTATE,
    STATE_COMBATSTATE,
    STATE_CASTLEDESIGNSTATE,
    STATE_SETUPGAMESTATE,
    STATE_LASTSTATE
};