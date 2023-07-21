# geist
Geist is the framework I use to make all my own games.  It is cross-platform between Windows and Linux.

I have used it to make the following games:

Inaria, my retro-inspired RPG
Planitia, my Populous-inspired RTS/God Game
Robot Wants It All, a collaboration with Hamumu Games that collects and upgrades all of the "Robot Wants" Flash games from the early 2000's
Ultima VII: Revisited, my attempt at a replacement engine for Ultima VII/Serpent Isle

Geist is designed to be kind of a middle ground between a "lightweight" engine and a "kitchen sink" engine.  Its most compelling feature is probably its UI system, which supports full animation of UI elements.

Geist relies upon the following libraries:

SDL2: For main game loop and input
GLEW and GLM: For OpenGL supprt (Geist uses OpenGL exclusively for rendering)
stb: For image loading and true-type font support
SoLoud: For audio
tinyxml2: For loading XML files :)

Minimalist versions of these libraries are included.

I've been working on this framework on and off for over ten years now.  That means that some of this code is extremely rusty and all of it should be refactored.  Constructive criticism is welcome!
