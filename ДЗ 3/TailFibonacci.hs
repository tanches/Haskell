module Main where

-- числа Фибоначчи: 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, ...
fibonacciTail n = go n
    where
        go 0 = 0
        go 1 = 1
        go 2 = 1
        go n = go (n-1) + go (n-2)

main = putStrLn(show(fibonacciTail 3))