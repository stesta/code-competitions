{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE TypeFamilies #-}

module CodeWars.PolyvariadicFunctions where

-- Resources
-- https://stackoverflow.com/questions/3467279/how-to-create-a-polyvariadic-haskell-function
-- https://github.com/AJFarmar/haskell-polyvariadic
-- https://chrisdone.com/posts/haskell-constraint-trick/
-- https://www.codewars.com/kata/reviews/599aed6a26231e2cfc000517/groups/59b42c86adf82f17960000cf

-- `polyAdd` sums its arguments, all `Int`s.
polyAdd :: (IntReturnType r) => r
polyAdd = retInt 0

class IntReturnType r where
  retInt :: Int -> r
  
instance IntReturnType Int where
  retInt = id
  
instance (a ~ Int, IntReturnType r) => IntReturnType (a -> r) where
  retInt x = retInt . (x+) 
  
-- `polyList` turns its arguments into a list, polymorphically.
polyList :: (ListReturnType a r) => r
polyList = retList []

class ListReturnType a r | r -> a where
  retList :: [a] -> r

instance ListReturnType a [a] where
  retList = id
  
instance (ListReturnType a r) => ListReturnType a (a -> r) where
  retList xs x = retList (xs ++ [x])


-- `polyWords` turns its arguments into a spaced string.
polyWords :: (StrReturnType r) => r
polyWords = retStr ""

class StrReturnType r where
  retStr :: String -> r
  
instance StrReturnType String where
  retStr = id
  
instance (StrReturnType r) => StrReturnType (String -> r) where
  retStr s c = if s == "" then retStr (s ++ c) else retStr (s ++ " " ++ c)

-- BEST PRACTICE
---------------------------------

class Variadic a r t | t -> r where
  liftVariadic :: ([a] -> r) -> t

instance Variadic a r r where
  liftVariadic f = f []

instance (a ~ a', Variadic a r t) => Variadic a r (a' -> t) where -- requires UndecidableInstances
  liftVariadic f h = liftVariadic (f . (h:))

polyAdd' :: Variadic Int Int t => t
polyAdd' = liftVariadic (sum :: [Int] -> Int)

polyWords' :: Variadic String String t => t
polyWords' = liftVariadic unwords

polyList' :: Variadic a [a] t => t
polyList' = liftVariadic id
