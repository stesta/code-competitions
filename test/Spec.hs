import CodeWars.CategorizeNewMemberSpec
import CodeWars.DescendingOrderSpec
import CodeWars.DisemvowelTrollsSpec
import CodeWars.RecreationOneSpec
import CodeWars.SumTheStringsSpec

import Test.Hspec

main :: IO ()
main = do
    hspec CodeWars.CategorizeNewMemberSpec.spec
    hspec CodeWars.DescendingOrderSpec.spec
    hspec CodeWars.DisemvowelTrollsSpec.spec
    hspec CodeWars.RecreationOneSpec.spec
    hspec CodeWars.SumTheStringsSpec.spec