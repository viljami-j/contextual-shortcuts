# CShorts - Contextual Shortcuts
A simple tool that provides contextual shortcuts for any application that has defined a keyset.

## Why to use?
* Context has never been easier - just write a single line to a text file from any point in your code!
* Sets a low bar to implement contextual shortcuts that can really make a difference in productivity.

## How to use?
### Define a keyset
*What is a keyset*?

It is a file that contains all of your application's contexts, actions & keybinds for each defined action.

```xml
<Keyset>
<!-- Contexts are like spaces that are meant to contain only the relevant shortcuts, 
     e.g. the user clicks some window that has it's own special shortcuts  -->
    <Context name="some cool context in your program"> 
    <!-- An action could be something like 'Undo', 'Redo', etc. 
         That is, any keyboard shortcut in your program. -->
        <Action name="some cool action in your program"> 
            <CTRL/>  <!-- Keybinds are written in all caps. Refer to key-examples.txt if you have trouble. -->
            <ALT/>
            <D/>
        </Action>
        <Action>
            <CTRL/>
            <F/>
        </Action>
    </Context>
</Keyset>
```

###  Change the context
Write to 'cshorts.txt' from any point in your code in the following format:  
```[YourKeySetName] [ContextYouWishToUse]```

So if you had a keyset for Blender & wanted to see shortcuts relevant to a context named 'Sculpting' you would write like so:  
```BlenderKeyset.xml Sculpting```

### Done!
Now your users don't need to waste time navigating sheets of keyboard shortcuts, it's all contextual!

## Have a feature request? Open an issue!
