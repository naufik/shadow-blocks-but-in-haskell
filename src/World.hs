module World (World, defaultWorld, getByName) where
  import GameObject
  import Graphics.Gloss
  import Graphics.Gloss.Juicy
  import System.IO.Unsafe

  type World = [GameObject]

  defaultWorld :: World
  defaultWorld = defaultFloors ++ [defaultPlayer] 

  defaultPlayer :: GameObject
  defaultPlayer = setProps [("x", floatProp 0), ("y", floatProp 0), ("moveable", 
    boolProp True)] (newObj "Player" (pngPlayer) [])


  defaultFloors :: [GameObject]
  defaultFloors = [newObj "Wall" (pngFloor) [("x", floatProp x),
    ("y", floatProp y)] | x <- tiles, y <- tiles]
    where tiles = [-224,-192..224]
  
  pngPlayer :: Maybe Picture
  pngPlayer = unsafePerformIO $ loadJuicyPNG "./res/player_left.png"

  pngFloor :: Maybe Picture
  pngFloor = unsafePerformIO $ loadJuicyPNG "./res/floor.png"

  getByName :: String -> World -> GameObject
  getByName name world = head $ filter (\x -> getId x == name) world