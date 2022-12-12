// contextual-shortcuts.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>
#include <fstream>
#include "Keyset.h"
#include "CLog.hpp"

using namespace std;

struct ProgramState
{
    Keyset Keyset;
    bool isKeysetLoaded;

    string ContextName;
    bool isContextLoaded;

    ProgramState() {};
};

int main()
{
    ProgramState ps;
    // Check if a file exists
    if (auto infile = ifstream("cshorts.txt"))
    {
        string line;

        // Try to load keyset
        getline(infile, line); 

        if (ps.isKeysetLoaded = ps.Keyset.LoadKeyset(line)) {

        }

        if (ps.isKeysetLoaded) {
            getline(infile, line);
            auto iter = ps.Keyset.contexts.find(ps.ContextName);

            for (auto shortcut : iter->second.shortcuts) {

            }
        }

        infile.close();
    }
    else CLog::ToChannels("Failed to open cshorts.txt", CLog::Error);

    return 0;
}
