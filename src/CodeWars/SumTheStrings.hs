module CodeWars.SumTheStrings where

import Text.Read (readMaybe)

sumStr :: String -> String -> String
sumStr s1 s2 = show $ parse (readMaybe s1) + parse (readMaybe s2)

parse :: Maybe Int -> Int
parse (Just x) = x
parse _ = 0
