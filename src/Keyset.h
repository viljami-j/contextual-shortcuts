#pragma once

#include <string>
#include <map>
#include <vector>
#include <tinyxml2.h>
#include <string>
#include "CLog.hpp"

using namespace tinyxml2;

struct Shortcut
{
    std::string name;
    std::vector<std::string> keybinds;

    Shortcut() {};
    Shortcut(std::string name, std::vector<std::string> keybinds) {
        this->name = name;
        this->keybinds = keybinds;
    }
};

struct Context {

    std::string name;
    std::vector<Shortcut> shortcuts;

    Context();
    Context(XMLHandle contextElement) {
        XMLHandle shortcutElement = contextElement.FirstChildElement("Shortcut");
        name = contextElement.ToElement()->FirstAttribute()->Value();

        // Load all shortcuts
        for (XMLHandle e = shortcutElement; e.ToElement() != nullptr; e = e.NextSiblingElement("Shortcut")) {
            // Get first keyElement of current shortcutElement
            XMLHandle keyElement = e.FirstChildElement();
            
            std::string shortcutName = e.ToElement()->FirstAttribute()->Value();
            printf("INFOR - ShortcutName: %s\n", shortcutName.c_str());

            std::vector<std::string> keybind;

            for (XMLHandle e = keyElement; e.ToElement() != nullptr; e = e.NextSiblingElement()) {
                std::string key = e.ToElement()->Name();
                printf("Key: %s\n", key.c_str());

                keybind.push_back(key);
            }

            shortcuts.push_back(Shortcut(shortcutName, keybind));
        }
    }
};


class Keyset
{
private:
    void ReloadContexts();
    XMLDocument doc;

public:
    std::map<std::string, Context> contexts;

    Keyset() {};

    /* Opens a keyset from the specified filepath **/
    Keyset(std::string filepath);   

    bool LoadKeyset(std::string filepath) {
        if (doc.LoadFile(filepath.c_str()) == XML_SUCCESS) {
            ReloadContexts();
            for (auto context : contexts) {
                for (auto shortcut : context.second.shortcuts) {
                    printf("\nOUTPUTTED ShortcutName: %s\n", shortcut.name.c_str());
                    for (auto keybind : shortcut.keybinds) {
                        printf("\nOUTPUTTED Key: %s\n", keybind.c_str());
                    }
                }
            }

            return true;
        }
        else CLog::ToChannels(doc.ErrorIDToName(doc.ErrorID()), CLog::Error);

        return false;
    }
    

    

};
