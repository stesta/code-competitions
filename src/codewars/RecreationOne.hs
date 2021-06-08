listSquared :: Int -> Int -> [(Int, Int)]
listSquared m n = [(x,y) | x <- [m..n], let y = sumsqdiv (divisors x), isSquare y]

divisors :: Int -> [Int]
divisors n = [x | x <- [1..n], n `mod` x == 0]

sumsqdiv :: [Int] -> Int 
sumsqdiv = sum . map (^2)

isSquare :: Integral a => a -> Bool
isSquare n = sq * sq == n
    where sq = floor $ sqrt $ (fromIntegral n::Double)