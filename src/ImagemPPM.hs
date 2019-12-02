module ImagemPPM 
      ( Pixel(..)
      , ImagemPPM(..)
      , pixel
      , imagemPPM
      , limpaTela ) where

data Pixel = Pixel Int Int Int deriving ( Show )
data ImagemPPM = ImagemPPM Int Int[[Maybe Pixel]] deriving ( Show)

pixel :: Int -> Int -> Int -> Maybe Pixel
pixel r g b
  | r < 0 && g < 0 && b < 0 = Nothing
  | otherwise = Just $ Pixel r g b

imagemPPM :: Int -> Int -> Maybe ImagemPPM
imagemPPM x y
  | x < 0 && y < 0 = Nothing
  | otherwise = Just $ ImagemPPM x y $ replicate x $ replicate y (pixel 255 255 255)

limpaTela :: (Int, Int) -> (Int, Int, Int) -> Maybe ImagemPPM
limpaTela (x,y) (r,g,b)
  | r < 0 && g < 0 && b < 0 = Nothing
  | otherwise = Just $ ImagemPPM x y $ replicate x $ replicate y (pixel r g b)
