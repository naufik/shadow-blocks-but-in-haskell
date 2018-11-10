module Main where

import Graphics.Gloss
import Graphics.Gloss.Interface.Pure.Game
import GameObject
import World

import Data.List

main :: IO ()
main = do
  play (InWindow "Hello" (800, 600) (100,100)) white 60
    defaultWorld renderWorld handleEvent doNothing

renderWorld :: World -> Picture
renderWorld world = pictures (map render world)

doNothing :: a -> b -> b
doNothing _ b = b

handleEvent :: Event -> World -> World

handleEvent (EventKey (SpecialKey KeyUp) Down _ _) world = 
  (world \\ [p]) ++ [setProp ("y", floatProp ((getFloat "y" p) + 32)) p] 
  where
    p = getByName "Player" world 

handleEvent (EventKey (SpecialKey KeyDown) Down _ _) world = 
  (world \\ [p]) ++ [setProp ("y", floatProp ((getFloat "y" p) - 32)) p]
  where
    p = getByName "Player" world 

handleEvent (EventKey (SpecialKey KeyLeft) Down _ _) world = 
  (world \\ [p]) ++ [setProp ("x", floatProp ((getFloat "x" p) - 32)) p]
  where
    p = getByName "Player" world 

handleEvent (EventKey (SpecialKey KeyRight) Down _ _) world = 
  (world \\ [p]) ++ [setProp ("x", floatProp ((getFloat "x" p) + 32)) p]
  where
    p = getByName "Player" world 

handleEvent _ world = world