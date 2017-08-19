module Main where

import Lib
import Ms

readMs :: IO (Multiset Int)
readMs = fmap fromList list
            where list = fmap (map read . words) getLine

main :: IO ()
main = do
    deltaX <- readMs
    print deltaX