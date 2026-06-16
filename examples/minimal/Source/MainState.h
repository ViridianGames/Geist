#ifndef _MAINSTATE_H_
#define _MAINSTATE_H_

#include "Geist/State.h"

class MainState : public State
{
public:
    MainState() {};
    ~MainState() override {};

    void Init(const std::string& configfile) override;
    void Shutdown() override;
    void Update() override;
    void Draw() override;

    void OnEnter() override;
    void OnExit() override;
};

#endif