module Arquivos 
      ( leituraDeArquivo
      , escreveArquivo
      ) where

import System.IO
import Data.Char
import ImagemPPM

type Linhas = [String]

leituraDeArquivo :: String -> IO Linhas
leituraDeArquivo nome = do
  conteudo <- readFile nome
  return $ lines conteudo

escrevePixel :: String -> Maybe Pixel -> IO ()
escrevePixel nomeArquivo pixel =
  case pixel of
    Just (Pixel r g b)
      -> appendFile nomeArquivo $ show r ++ " " ++ show g ++ " " ++ show b ++ "\n"
    Nothing
      -> putStrLn "Veio aqui"

desenhaLinha :: String -> [Maybe Pixel] -> IO ()
desenhaLinha _ []                       = return ()
desenhaLinha nomeArquivo (pixel:pixels) = do
  escrevePixel nomeArquivo pixel
  desenhaLinha nomeArquivo pixels

percorreLinhas :: String -> ImagemPPM -> IO ()
percorreLinhas nomeArquivo (ImagemPPM x y [])             = return ()
percorreLinhas nomeArquivo (ImagemPPM x y (linha:linhas)) = do
  desenhaLinha nomeArquivo linha
  percorreLinhas nomeArquivo (ImagemPPM x y linhas)

escrevePPM :: ImagemPPM -> String -> IO ()
escrevePPM imagem@(ImagemPPM x y _) nomeArquivo = do
  writeFile nomeArquivo "P3\n"
  appendFile nomeArquivo $ show x ++ " " ++ show y ++ "\n"
  appendFile nomeArquivo "255\n"
  percorreLinhas nomeArquivo imagem

escreveArquivo :: Maybe ImagemPPM -> String -> IO ()
escreveArquivo imagem nomeArquivo = do
  case imagem of
    Just matrizPixels
      -> escrevePPM matrizPixels nomeArquivo
    Nothing
      -> putStrLn "Nothing"
