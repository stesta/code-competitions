module CodeWars.DescendingOrderSpec where
  
import CodeWars.DescendingOrder (descendingOrder)
import Test.Hspec
import Test.QuickCheck
import Data.List

spec :: Spec
spec = do
  describe "descendingOrder" $ do
    it "should work on several examples" $ do
      descendingOrder 0         `shouldBe` 0
      descendingOrder 1         `shouldBe` 1
      descendingOrder 15        `shouldBe` 51
      descendingOrder 1021      `shouldBe` 2110
      descendingOrder 123456789 `shouldBe` 987654321
    it "should work for random positive numbers" $ do
      property $ forAll (arbitrary `suchThat` (>=0)) $ \x ->
        descendingOrder x `shouldBe` solution x
  where solution = read . reverse . sort . show