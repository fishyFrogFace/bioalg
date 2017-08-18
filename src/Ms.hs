module Ms
    ( Multiset(..)
    , show
    , fromList
    ) where

import Data.List (sort)

data Multiset a = Multiset [a] | Empty

instance Show a => Show (Multiset a) where
    show = mshow
    
mshow :: Show a => Multiset a -> String
mshow Empty = "ms{\216}"
mshow (Multiset elems) = "ms{" ++ show' elems
                        where show' :: Show a => [a] -> Prelude.String
                              show' [x] = Prelude.show x ++ "}"
                              show' (x:xs) = Prelude.show x ++ (',' : show' xs)

fromList :: Ord a => [a] -> Multiset a
fromList [] = Empty
fromList l = Multiset $ sort l