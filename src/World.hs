module World (World, defaultWorld, getByName) where
  import GameObject
  import Graphics.Gloss
  import Graphics.Gloss.Juicy
  import System.IO.Unsafe

  type World = [GameObject]
  type Behavior = (String, String, World -> GameObject -> GameObject)


  updateWorld :: World -> World
  updateWorld world = map (run defaultBehaviors) world
  
  -- runBehavior :: Behavior -> (World -> GameObject -> GameObject)
  -- runBehavior (_, target, f) = 

  defaultWorld :: World
  defaultWorld = defaultFloors ++ [defaultPlayer] 

  defaultBehaviors :: [Behavior]

  defaultPlayer :: GameObject
  defaultPlayer = setProps [("x", FloatProp 0), ("y", FloatProp 0), ("moveable", 
    BoolProp True)] (GameObject "Player" (pngPlayer) [])

  defaultFloors :: [GameObject]
  defaultFloors = [GameObject "Wall" (pngFloor) [("x", FloatProp x),
    ("y", FloatProp y)] | x <- tiles, y <- tiles]
    where tiles = [-224,-192..224]
  
  pngPlayer :: Maybe Picture
  pngPlayer = unsafePerformIO $ loadJuicyPNG "./res/player_left.png"

  pngFloor :: Maybe Picture
  pngFloor = unsafePerformIO $ loadJuicyPNG "./res/floor.png"

  getByName :: String -> World -> GameObject
  getByName name world = head $ filter (\x -> getId x == name) world