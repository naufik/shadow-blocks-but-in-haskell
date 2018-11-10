# Shadow Blocks Reloaded

A Haskell practice project where I try to recreate the Shadow Blocks (a.k.a. Sokoban Game) in Haskell.

![](https://i.imgur.com/Q3aQ9pM.png)

To be honest, I do not know if I can maintain this as I seem to have reached a dead and due to limitations of the Gloss graphics library, I may recreate the project using a proper game engine.

## Progress

- **10 November**: The player can now properly move, although mostly everything is still hardcoded in `Main.hs`. May want to create better abstraction for this purpose but I am still trying to figure out how.

## Issues

So as you may wonder, the following are the unresolved issues I am having with
the project.

- This game is based on the graphics library `gloss`. Gloss is great as a graphics library and it goes the extra mile for allowing "games" to be played by having an update loop and a keyboard event handler. However I seem to not be able to find an "on button hold" event.
- With `Haskell`'s type system, we have inheritance but we do not have heterogeneous lists. Making it somewhat difficult to have a "World" containing different types of entity. Right now my workaround to this is the Prop system (somewhat like a make-believe/make-do entity component system).