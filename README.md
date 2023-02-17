# CShorts - Contextual Shortcuts
A simple tool that provides contextual shortcuts for any application that has defined a keyset.

## Why to use?
* Provides an easy way to learn shortcuts, should be essential to any application that works with multiple contexts e.g. Blender, Unreal Engine, Godot.
* Setting a context has never been easier - just write a single line to a text file from any point in your code!
* Sets a low bar to implement contextual shortcuts that can really make a difference in productivity.

### What is a context?
* TODO: Add a demonstrative .gif

## How to use?
### Define a keyset
*What is a keyset*?

It is a file that contains all of your application's contexts, actions & keybinds for each defined action.

```xml
<Keyset>
<!-- Contexts are like spaces that are meant to contain only the relevant shortcuts, 
     e.g. the user clicks some window that has it's own special shortcuts  -->
    <Context name="someCoolContextInYourProgram"> 
        <Shortcut name="someCoolShortcutInYourProgram"> 
            <CTRL/>  <!-- Keybinds are written in all caps. Refer to key-examples.txt if you have trouble. -->
            <ALT/>
            <D/>
        </Shortcut>
	<Shortcut name="anotherCoolShortcut">
            <CTRL/>
            <F/>
        </Shortcut>
    </Context>
</Keyset>
```

###  Change the context
Write to 'cshorts.txt' from any point in your code in the following format:  
```
YourKeySetName
ContextYouWishToUse
```

So if you had a keyset for Blender & wanted to see shortcuts relevant to a context named 'Sculpting' you would write like so:  
```
BlenderKeyset.xml
Sculpting
```

### Done!
Now your users don't need to waste time navigating sheets of keyboard shortcuts, it's all contextual!

## Have a feature request? Open an issue!
