-- 
module GameObject (GameObject(GameObject), Prop(..), getInt, getBool, getFloat,
  getString, render, setProps, setProp) where
  import Graphics.Gloss
  import Data.Maybe

  data Prop = StrProp String | BoolProp Bool | FloatProp Float | IntProp Int
    deriving Eq
  data GameObject = GameObject String (Maybe Picture) [(String, Prop)]

  instance Eq GameObject where
    (==) x y = (getId x) == (getId y)

  getInt :: String -> GameObject -> Int
  getInt tag (GameObject _ _ props)
    = toInt $ snd $ head $ filter ((== tag) . fst) props 
    where
      toInt (IntProp x) = x
      toInt _ = error "cannot"
  
  getBool :: String -> GameObject -> Bool
  getBool tag (GameObject _ _ props)
    = toBool $ snd $ head $ filter ((== tag) . fst) props 
    where
      toBool (BoolProp x) = x
      toBool _ = error "cannot"

  getString :: String -> GameObject -> String
  getString tag (GameObject _ _ props)
    = toStr $ snd $ head $ filter ((== tag) . fst) props 
    where
      toStr (StrProp x) = x
      toStr _ = error "cannot"

  getFloat :: String -> GameObject -> Float
  getFloat tag (GameObject _ _ props)
    = toFloat $ snd $ head $ filter ((== tag) . fst) props 
    where
      toFloat (FloatProp x) = x
      toFloat _ = error "cannot"

  setProp :: (String, Prop) -> GameObject -> GameObject
  setProp (tag, prop) (GameObject n img props)
    = GameObject n img ((tag, prop) : repl)
    where repl = filter ((/=tag) . fst) props
  
  setProps :: [(String, Prop)] -> GameObject -> GameObject
  setProps props obj = (foldr (.) id [setProp p | p <- props]) obj

  render :: GameObject -> Picture
  render (GameObject i pic props) = 
    translate (getFloat "x" obj) (getFloat "y" obj) $ fromJust pic
    where obj = (GameObject i pic props)

  update :: Monad m => m GameObject -> m GameObject
  update = id

  getId :: GameObject -> String
  getId (GameObject id _ _) = id