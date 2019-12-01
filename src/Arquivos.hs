module Arquivos 
      ( leituraDeArquivo
      ) where

import System.IO
import Data.Char

type Linhas = [String]

leituraDeArquivo :: String -> IO Linhas
leituraDeArquivo nome = do
  conteudo <- readFile nome
  return $ lines conteudo
