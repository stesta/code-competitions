module CodeWars.SumByFactors where

import Data.List (nub, groupBy, sortOn)

sumOfDivided :: [Integer] -> [(Integer, Integer)]
sumOfDivided xs = map combine groups
    where 
        factors = sortOn fst $ [(pfs,x) | x <- xs, pfs <- nub . primeFactors . abs $ x]
        groups = groupBy (\a b -> fst a == fst b) factors

combine :: [(Integer,Integer)] -> (Integer,Integer)
combine xs = (a, b)
    where 
        a = fst . head $ xs
        b = sum . nub . map snd $ xs

primeFactors :: Integer -> [Integer]
primeFactors n | n > 1 = go n (2:[3,5..])   -- or go n (2:[3,5..])
   where                               -- for one-off invocation
     go n ps@(p:t)
        | p*p > n    = [n]
        | r == 0     =  p : go q ps
        | otherwise  =      go n t
                where
                  (q,r) = quotRem n p