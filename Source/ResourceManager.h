///////////////////////////////////////////////////////////////////////////
//
// Name:     RESOURCEMANAGER.H
// Author:   Anthony Salter
// Date:     2/03/05
// Purpose:  The ResourceManager subsystem.
//
///////////////////////////////////////////////////////////////////////////

#ifndef _RESOURCEMANAGER_H_
#define _RESOURCEMANAGER_H_

#include "Object.h"
#include "Primitives.h"
#include "soloud_wav.h"
#include <map>

class ResourceManager : public Object
{
public:
	ResourceManager() {};

	virtual void Init(const std::string& configfile);
	virtual void Shutdown();
	virtual void Update();
	virtual void Draw() {};

	void ClearTextures();

	std::map<std::string, std::unique_ptr<Texture> > m_TextureList;
	std::map<std::string, std::unique_ptr<Mesh> > m_MeshList;
	std::map<std::string, SoLoud::Wav* > m_SoundList;

	void AddTexture(const std::string& textureName, bool mipmaps = true);
	void AddMesh(const std::string& meshName);
	void AddSound(const std::string& soundName);

	//  The pointers that these functions hand out are for access ONLY.  Do not
	//  delete them.  You didn't make these resources, you have no business
	//  deleting them.
	Texture* GetTexture(const std::string& textureName, bool mipmaps = true);
	Mesh* GetMesh(const std::string& meshname);
	SoLoud::Wav* GetSound(const std::string& soundname);
	void ReloadTextures();
};

#endif