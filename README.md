# Contextual Shortcuts
A simple tool that provides contextual shortcuts for any application that has defined a keyset.

## Why to use?
* Provides an easy way to learn shortcuts, should be essential to any application that works with multiple contexts e.g. Blender, Unreal Engine, Godot.
* Setting a context has never been easier - just write a single line to a text file from any point in your code!
* Sets a low bar to implement contextual shortcuts that can really make a difference in productivity.

## How to use?
### Define a keyset
*What is a keyset*?

It is a file that contains all of your application's contexts, actions & keybinds for each defined action.

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
