#ifndef _TITLESTATE_H_
#define _TITLESTATE_H_

#include "Geist/State.h"

class TitleState : public State
{
public:
    TitleState() {};
    ~TitleState() override {};

    void Init(const std::string& configfile) override;
    void Shutdown() override;
    void Update() override;
    void Draw() override;

    void OnEnter() override;
    void OnExit() override;
};

#endif