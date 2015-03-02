module Main where

factorial n =
    -- факториал от 0 = 1
    if n == 0
        then 1
    else 
    -- рекурсивное вычисление факториала
        n * factorial (n-1)

-- биномиальный коэффициент
binomKof :: Int -> Int -> Int
binomKof k n =
    if n == k
        then 1
    else
        div (factorial n) ((factorial k)*(factorial (n-k)))

main = putStrLn(show(binomKof 2 6))