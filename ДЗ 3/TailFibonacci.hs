module Main where

-- числа Фибоначчи: 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, ...
fibonacciTail n = go n 1
    where
        go 0 k = k
        go 1 k = k
        go 2 k = 1
        go n k = go (n-1) k + go (n-2) k

main = putStrLn (show (fibonacciTail 7))