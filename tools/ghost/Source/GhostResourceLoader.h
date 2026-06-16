#ifndef GHOST_RESOURCE_LOADER_H
#define GHOST_RESOURCE_LOADER_H

#include <string>
#include <vector>
#include <nlohmann/json.hpp>

using ghost_json = nlohmann::ordered_json;

// Wrapper class to load Ghost resources from embedded data or files
class GhostResourceLoader
{
public:
    // Load a .ghost file from embedded resources (if available) or from disk
    static ghost_json LoadGhostJson(const std::string& filename);

    // Load ghost.cfg from embedded resources (if available) or from disk
    static std::string LoadGhostConfig();

    // Load a binary file (PNG, TTF, etc.) from embedded resources or disk
    // Returns the data and size as a pair. Empty vector on failure.
    static std::vector<unsigned char> LoadBinaryFile(const std::string& path);

private:
    // Extract just the filename from a path
    static std::string GetFilename(const std::string& path);
};

#endif // GHOST_RESOURCE_LOADER_H
