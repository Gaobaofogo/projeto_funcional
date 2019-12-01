module Lib
    ( mainFunc
    ) where

import System.IO
import Data.Char
import Arquivos ( leituraDeArquivo )

mainFunc :: IO ()
mainFunc = do
  contents <- leituraDeArquivo "/home/gabriel/workspace/projeto_de_funcional/PaintFuncional/src/arquivo.txt"
  putStr $ contents!!0
