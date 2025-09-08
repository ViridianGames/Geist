//
// Created by asalter on 9/8/25.
//

#ifndef GEIST_GUIEDITORENGINE_H
#define GEIST_GUIEDITORENGINE_H

class GuiEditorEngine : public Engine
{
public:
	int g_DrawScale;
	float m_fontSize;
	Texture* m_Cursor;
	float m_DrawScale;
	Font m_font;
	RenderTexture m_renderTarget;

};

#endif //GEIST_GUIEDITORENGINE_H