module Main where

import Lib  
import SimpleJSON

main :: IO ()
main = someFunc >>= print
