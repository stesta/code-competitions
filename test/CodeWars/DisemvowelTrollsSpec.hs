module CodeWars.DisemvowelTrollsSpec (spec) where

import Control.Monad
import Data.List (intercalate)
import qualified Data.Vector as V
import CodeWars.DisemvowelTrolls (disemvowel)
import Test.Hspec
import Test.QuickCheck

becomes :: String -> String -> Expectation
becomes input expected = when (actual /= expected) $ expectationFailure message
 where
  actual = disemvowel input
  message =
    intercalate
      "\n"
      [ "Input:\n  " <> show input
      , "Expected:\n  " <> show expected
      , "Your answer:\n  " <> show actual
      ]

spec :: Spec
spec = do
  it "should work for single words" $ do
    "hat" `becomes` "ht"
    "queen" `becomes` "qn"
    "onomatopoeia" `becomes` "nmtp"
  it "should work for phrases" $ do
    "i like toast" `becomes` " lk tst"
    "the quick brown fox jumps over the lazy dog" `becomes` "th qck brwn fx jmps vr th lzy dg"
  it "should preserve case" $ do
    "The Quick Brown Fox Jumps Over The Lazy Dog" `becomes` "Th Qck Brwn Fx Jmps vr Th Lzy Dg"
  it "should preserve punctuation" $ do
    "This. Is, A? Misuse; Of: Punctuation!" `becomes` "Ths. s, ? Mss; f: Pncttn!"
  it "should pass random tests" $ do
    replicateM_ 100 $ do
      input <- generate testcase
      input `becomes` filter (`notElem` "aoeuiAOEUI") input

testcase :: Gen String
testcase = do
  let chars = "abcdefghijklmnopqrsruvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ?!,@#$%^&*()[]{};         "
  size <- choose (20, 100)
  replicateM size (elements chars)