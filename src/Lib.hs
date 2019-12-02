module Lib
    ( mainFunc
    ) where

import System.IO
import Data.Char
import Arquivos ( leituraDeArquivo, escreveArquivo )
import ImagemPPM

mainFunc :: IO ()
mainFunc = do
  contents <- leituraDeArquivo "/home/gabriel/workspace/projeto_de_funcional/PaintFuncional/src/arquivo.txt"
  let imagem = imagemPPM 100 100
  let novaImagem = limpaTela (200,200) (255, 0, 0)
  escreveArquivo novaImagem "/home/gabriel/workspace/projeto_de_funcional/PaintFuncional/arquivo.ppm"
