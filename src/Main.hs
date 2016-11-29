{-# LANGUAGE BangPatterns #-}
module Main where


foo :: Num a => [a] -> a
foo = go 0
  where
    go !acc []     = acc
    go !acc (x:xs) = do
      let !acc' = acc + x
      go acc' xs

main :: IO ()
main = print (foo [1..10] :: Int)
