# geist
Geist is the framework I use to make all my own games.  It is cross-platform between Windows and Linux.


I have used it to make the following games:


*  Inaria, my retro-inspired RPG
*  Planitia, my Populous-inspired RTS/God Game
*  Robot Wants It All, a collaboration with Hamumu Games based on the "Robot Wants" Flash games from the early 2000's
*  Ultima VII: Revisited, my attempt at a replacement engine for Ultima VII/Serpent Isle

Geist is designed to be kind of a middle ground between a "lightweight" engine and a "kitchen sink" engine.  Its most compelling feature is probably its UI system, which supports full animation of UI elements.

Geist relies upon the following libraries:

*  SDL2: For main game loop and input
*  GLEW and GLM: For OpenGL supprt (Geist uses OpenGL exclusively for rendering)
*  stb: For image loading and true-type font support
*  SoLoud: For audio
*  tinyxml2: For loading XML files :)

Minimalist versions of these libraries are included.

I've been working on this framework on and off for over ten years now.  That means that some of this code is extremely rusty and all of it should be refactored.  Constructive criticism is welcome!

Any and all questions and comments can be sent to anthony.salter@gmail.com.

This engine is Open Source.  It is released under the Simplified BSD (or FreeBSD License). The upshot is that I retain copyright, but you are free to do anything you wish with this source code (up to and including developing a commercial project with it) as long as you attribute the original source to me. This source is being provided “as-is” and I take no responsibility for any problems you may have with it.

The complete text of the license follows.

Copyright 2023 Anthony Salter. All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY ANTHONY SALTER ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL ANTHONY SALTER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

The views and conclusions contained in the software and documentation are those of the authors and should not be interpreted as representing official policies, either expressed or implied, of Anthony Salter.
