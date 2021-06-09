import CodeWars.CategorizeNewMemberSpec ( spec )
import CodeWars.DescendingOrderSpec ( spec )
import CodeWars.DisemvowelTrollsSpec ( spec )
import CodeWars.PolyvariadicFunctionsSpec ( spec )
import CodeWars.RecreationOneSpec ( spec )
import CodeWars.SumByFactorsSpec ( spec )
import CodeWars.SumTheStringsSpec ( spec )

import Test.Hspec

main :: IO ()
main = do
    hspec CodeWars.CategorizeNewMemberSpec.spec
    hspec CodeWars.DescendingOrderSpec.spec
    hspec CodeWars.DisemvowelTrollsSpec.spec
    hspec CodeWars.PolyvariadicFunctionsSpec.spec
    hspec CodeWars.RecreationOneSpec.spec
    hspec CodeWars.SumByFactorsSpec.spec
    hspec CodeWars.SumTheStringsSpec.spec