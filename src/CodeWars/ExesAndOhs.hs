module CodeWars.ExesAndOhs where

import Data.Char
import Data.List

xo :: String -> Bool
xo = uniform . counts
    where 
        counts = map length . group . sort . map toLower . filter (`elem` "XxOo")
        uniform xs
            | length xs == 1 = False
            | otherwise = length (nub xs) <= 1
