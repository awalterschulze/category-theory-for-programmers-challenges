module Main where

import Data.Bifunctor
import Data.Char

data Pair a b = Pair a b
    deriving Show

-- A correct implementation of bimap
-- instance Bifunctor Pair where
--     bimap f g (Pair x y) = Pair (f x) (g y)

-- Bimap only implementing first and not second
instance Bifunctor Pair where
    first f (Pair x y) = Pair (f x) y

-- The compiler flag -Wmissing-methods results in an error being printed:
-- • No explicit implementation for
-- either ‘bimap’ or ‘second’
-- • In the instance declaration for ‘Bifunctor Pair’
-- |
-- 11 | instance Bifunctor Pair where
-- |          ^^^^^^^^^^^^^^
-- This shows that Haskell is smart enough to find missing implementations of methods.

main :: IO ()
main = print $ bimap toUpper (+1) (Pair 'a' 1)

