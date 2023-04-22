# Contextual Shortcuts
A simple tool that provides contextual shortcuts for any application that has defined [a keyset](https://github.com/viljami-j/contextual-shortcuts#define-a-keyset).

Extremely easy to implement!

## Why to use?
* Provides an easy way to learn shortcuts, should be relevant to any application that works with multiple contexts e.g. Blender, Unreal Engine, Godot.
* Spare the cognitive load of searching (interruption, open web browser, think of query, parse findings).
* Allows people to start using shortcuts right away, instead of when they bother to look them up.

## How to use?
### Define a keyset
*What is a keyset*?

It is a file that contains all of your application's contexts, related actions & keybinds defined for each action.

*What is a context*?

Contexts are like spaces that are meant to contain only the relevant shortcuts, 
e.g. the user clicks some window that has it's own special shortcuts.

```xml
<Keyset>
   <!-- Keys in a keybind are separated by whitespaces. Refer to key-examples.txt for appropriate key names. -->
    <Shortcut context="someContext" shortcut="someCoolShortcutInYourProgram" keybind="CTRL ALT D"/> 
    <Shortcut context="anotherContext" shortcut="anotherCoolShortcut" keybind="CTRL F"/>
</Keyset>
```

###  Change the context
Write to 'cs.txt' from any point in your code in the following format:  
```
YourKeySetName ContextYouWishToUse
```

So if you had a keyset for Blender & wanted to see shortcuts relevant to a context named 'Sculpting' you would write like so:  
```
BlenderKeyset.xml Sculpting
```

### Done!
Now your users don't need to waste time navigating sheets of keyboard shortcuts, it's all contextual!

## Have a feature request? Open an issue!
