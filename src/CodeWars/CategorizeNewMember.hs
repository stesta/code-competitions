module CodeWars.CategorizeNewMember where

data Membership = Open 
                | Senior 
                  deriving (Eq, Ord, Show)

openOrSenior :: [(Int, Int)] -> [Membership]
openOrSenior = map categorize
    where 
        categorize (age, handicap) 
            | age >= 55 && handicap > 7 = Senior
            | otherwise = Open

