module Render
  ( render
  ) where

  import Graphics.Gloss

  render :: IO ()
  render = render1

  render1 :: IO ()
  render1 = do
    display (InWindow "Shadow Blocks Reloaded" (800, 600) (10, 10)) white drawing

  drawing :: Picture
  drawing = pictures [(Circle 80)]
