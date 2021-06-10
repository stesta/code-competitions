module CodeWars.InfiniteDigitalString where

import Data.List ( findIndex, isPrefixOf, tails )

findPosition :: String -> Int
findPosition = position . search text
    where 
        text = concatMap show [1..]
        position (Just x) = x
        position _ = -1

search :: String -> String -> Maybe Int
search xs x = (x `isPrefixOf`) `findIndex` tails xs


