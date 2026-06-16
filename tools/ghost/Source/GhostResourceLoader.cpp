#include "GhostResourceLoader.h"
#include <../Source/Logging.h>
#include <fstream>

#ifdef GHOST_USE_EMBEDDED_RESOURCES
#include "GhostEmbeddedResources.h"
#endif

using namespace std;

string GhostResourceLoader::GetFilename(const string& path)
{
    size_t lastSlash = path.find_last_of("/\\");
    return (lastSlash != string::npos) ? path.substr(lastSlash + 1) : path;
}

ghost_json GhostResourceLoader::LoadGhostJson(const string& filename)
{
    string justFilename = GetFilename(filename);

#ifdef GHOST_USE_EMBEDDED_RESOURCES
    // Try to load from embedded resources first
    const char* embeddedData = GhostEmbeddedResources::GetResource(justFilename);
    if (embeddedData)
    {
        try
        {
            ghost_json j = ghost_json::parse(embeddedData);
            Log("GhostResourceLoader: Loaded '" + justFilename + "' from embedded resources");
            return j;
        }
        catch (const exception& e)
        {
            Log("GhostResourceLoader: Error parsing embedded resource '" + justFilename + "': " + string(e.what()));
        }
    }
#endif

    // Fall back to loading from file
    try
    {
        ifstream file(filename);
        if (!file.is_open())
        {
            Log("GhostResourceLoader: Could not open file: " + filename);
            return ghost_json();
        }

        ghost_json j;
        file >> j;
        file.close();

        Log("GhostResourceLoader: Loaded '" + filename + "' from file");
        return j;
    }
    catch (const exception& e)
    {
        Log("GhostResourceLoader: Error loading file '" + filename + "': " + string(e.what()));
        return ghost_json();
    }
}

string GhostResourceLoader::LoadGhostConfig()
{
#ifdef GHOST_USE_EMBEDDED_RESOURCES
    // Try to load from embedded resources first
    const char* embeddedData = GhostEmbeddedResources::GetResource("ghost.cfg");
    if (embeddedData)
    {
        Log("GhostResourceLoader: Loaded ghost.cfg from embedded resources");
        return string(embeddedData);
    }
#endif

    // Fall back to loading from file
    try
    {
        ifstream file("Data/ghost.cfg");
        if (!file.is_open())
        {
            Log("GhostResourceLoader: Could not open ghost.cfg");
            return "";
        }

        string content((istreambuf_iterator<char>(file)), istreambuf_iterator<char>());
        file.close();

        Log("GhostResourceLoader: Loaded ghost.cfg from file");
        return content;
    }
    catch (const exception& e)
    {
        Log("GhostResourceLoader: Error loading ghost.cfg: " + string(e.what()));
        return "";
    }
}

std::vector<unsigned char> GhostResourceLoader::LoadBinaryFile(const string& path)
{
#ifdef GHOST_USE_EMBEDDED_RESOURCES
    // Try to load from embedded resources first
    auto binaryResource = GhostEmbeddedResources::GetBinaryResource(path);
    if (binaryResource.data != nullptr && binaryResource.size > 0)
    {
        Log("GhostResourceLoader: Loaded '" + path + "' from embedded resources (" +
            std::to_string(binaryResource.size) + " bytes)");
        return std::vector<unsigned char>(binaryResource.data, binaryResource.data + binaryResource.size);
    }
#endif

    // Fall back to loading from file
    try
    {
        ifstream file("Data/" + path, ios::binary);
        if (!file.is_open())
        {
            Log("GhostResourceLoader: Could not open binary file: Data/" + path);
            return std::vector<unsigned char>();
        }

        // Get file size
        file.seekg(0, ios::end);
        size_t fileSize = file.tellg();
        file.seekg(0, ios::beg);

        // Read file into vector
        std::vector<unsigned char> buffer(fileSize);
        file.read(reinterpret_cast<char*>(buffer.data()), fileSize);
        file.close();

        Log("GhostResourceLoader: Loaded '" + path + "' from file (" + std::to_string(fileSize) + " bytes)");
        return buffer;
    }
    catch (const exception& e)
    {
        Log("GhostResourceLoader: Error loading binary file '" + path + "': " + string(e.what()));
        return std::vector<unsigned char>();
    }
}
