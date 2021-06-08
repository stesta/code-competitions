module CodeWars.RecreationOneSpec (spec) where

import CodeWars.RecreationOne (listSquared)
import Data.List
import Data.Maybe

import Test.Hspec
import Test.QuickCheck
import Test.Hspec.QuickCheck
import Text.Printf (printf)

-----------

sqFactorsSol :: Int -> [Int]
sqFactorsSol n = map (\x -> x * x) (nub (hlf ++ (reverse $ map (div n) hlf)))
    where hlf = filter ((== 0) . mod n) [1..truncate . sqrt $ fromIntegral n]
    
squaredFactorsSol :: Int -> Maybe (Int, Int)
squaredFactorsSol n = res
    where 
        s = sum (sqFactorsSol n)
        rac = truncate (sqrt (fromIntegral s)) 
        res = if (rac * rac == s) then Just (n, s) else Nothing

listSquaredSol :: Int -> Int -> [(Int, Int)]
listSquaredSol m n = concat $ map maybeToList (filter (\x -> x /= Nothing) (map squaredFactorsSol [m..n]))

---------------

testSquared :: Int -> Int -> [(Int, Int)] -> Spec
testSquared m n s = 
  it (printf "should return listSquared") $
    listSquared m n `shouldBe` s
        
spec :: Spec
spec = modifyMaxSuccess (const 25) $ do
    describe "listSquared" $ do        
        testSquared 1 250 [(1, 1), (42, 2500), (246, 84100)]
        testSquared 42 250 [(42, 2500), (246, 84100)]
        testSquared 250 500 [(287, 84100)]
        testSquared 300 600 []
        testSquared 600 1500 [(728, 722500), (1434, 2856100)]
        testSquared 1500 1800 [(1673, 2856100)]
        testSquared 1800 2000 [(1880, 4884100)]
        testSquared 2000 2200 []
        testSquared 2200 5000 [(4264, 24304900)]
        testSquared 5000 10000 [(6237, 45024100), (9799, 96079204), (9855, 113635600)]
        
        it "should work for random positive integers" $ property $ 
            forAll (choose (400, 500)) $ \m ->
                forAll (choose (600, 5000)) $ \n -> do
                    (listSquared m n  `shouldBe` listSquaredSol m n)