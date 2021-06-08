module CodeWars.SumTheStringsSpec (spec) where

import CodeWars.SumTheStrings
import Test.Hspec
import Test.QuickCheck

import Data.Function (on)

spec :: Spec
spec = do
  it "Basic tests" $ do
    sumStr "4" "5" `shouldBe` "9"
    sumStr "34" "5" `shouldBe` "39"
    sumStr "" "8" `shouldBe` "8"
    sumStr "9" "" `shouldBe` "9"
    sumStr "" "" `shouldBe` "0"
  it "Random tests" $ do
    forAll (show <$> choose (0, 200 :: Int)) $ \ a -> do
      forAll (show <$> choose (0, 200 :: Int)) $ \ b -> do
        sumStr a b `shouldBe` sol a b

sol :: String -> String -> String
sol = (show .) . ((+) `on` read)