#include <tinyxml2.h>
#include <iostream>
#include "Keyset.h"
#include "CLog.hpp"

using namespace tinyxml2;

Keyset::Keyset(std::string filepath)
{
    LoadKeyset(filepath);
}

void Keyset::ReloadContexts()
{
    contexts.clear();

    XMLHandle docHandle(&doc);
    XMLHandle keysetElement = docHandle.FirstChildElement("Keyset");
    XMLHandle contextElement = keysetElement.FirstChildElement("Context");

    // Load Contexts
    for (XMLHandle e = contextElement; e.ToElement() != nullptr; e = e.NextSiblingElement("Context")) {
        std::string contextName = contextElement.ToElement()->FirstAttribute()->Value();
        contexts.emplace(contextName, Context(e));
    }
    /*auto it = contexts.find("someCoolContextInYourProgram");
    if (contexts.end() != it) {
        std::string test = it->second.name.c_str();
        printf("Context: %s\n", test.c_str());
    }*/
}

