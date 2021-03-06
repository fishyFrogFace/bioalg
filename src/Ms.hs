module Ms
    ( Multiset(..)
    , show
    , fromList
    , msmap
    , size
    ) where

import Data.List (sort)

data Multiset a = Multiset [a]
                  deriving (Eq)

instance Show a => Show (Multiset a) where
    show = mshow
    
mshow :: Show a => Multiset a -> String
mshow (Multiset []) = "ms{\216}"
mshow (Multiset elems) = "ms{" ++ show' elems
                        where show' :: Show a => [a] -> Prelude.String
                              show' [x] = Prelude.show x ++ "}"
                              show' (x:xs) = Prelude.show x ++ (',' : show' xs)

fromList :: Ord a => [a] -> Multiset a
fromList [] = (Multiset [])
fromList l = Multiset $ sort l

msmap :: ([t] -> [a]) -> Multiset t -> Multiset a
msmap f (Multiset n) = Multiset (f n)

size :: Multiset a -> Int
size (Multiset n) = Prelude.length n
