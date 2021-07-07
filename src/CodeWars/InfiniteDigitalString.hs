module CodeWars.InfiniteDigitalString where

import Data.List ( findIndex, isPrefixOf, tails )
import Data.Text (Text)
import qualified Data.Text as T
import Data.Text.Internal.Search

findPosition :: String -> Int
findPosition = head . indices (T.pack text) . T.pack
    where 
        text = concatMap show [1..]
        position (Just x) = x
        position _ = -1

search :: String -> String -> Maybe Int
search xs x = (x `isPrefixOf`) `findIndex` tails xs


