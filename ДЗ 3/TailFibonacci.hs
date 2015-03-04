module Main where

-- числа Фибоначчи: 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, ...
fibonacciTail :: Integer -> Integer
fibonacciTail n = go n (0, 1)
    where
        go n (m, k) | n == 0 = m
                    | otherwise = go (n - 1) (k, m + k)

main = putStrLn (show (fibonacciTail 9))