module CodeWars.DisemvowelTrolls where

disemvowel :: String -> String
disemvowel = filter (`notElem` "AEIOUaeiou")
