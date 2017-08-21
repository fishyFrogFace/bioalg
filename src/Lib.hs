module Lib
    ( solve
    , setSize
    ) where

import Math.NumberTheory.Powers.Squares
import qualified Data.Set as S
import Ms

setSize :: Int -> Maybe Int
setSize ms
    |isSquare sq && even num = Just (num `div` 2)
    |otherwise               = Nothing
    where sq = 8*ms+1
          num = 1+(integerSquareRoot' sq)

solve :: Multiset Int -> Maybe (S.Set Int)
solve ms = case (setSize $ size ms) of
            Just x  -> Just (S.fromList ([1..x] :: [Int]))
            Nothing -> Nothing
