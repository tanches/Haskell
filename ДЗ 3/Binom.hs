module Main where

factorial n =
    -- факториал от 0 = 1
    if n == 0
        then 1
    else 
    -- рекурсивное вычисление факториала
        n * factorial (n-1)

-- биномиальный коэффициент
binomKof k n =
    if n < k
        then error "First argument must be less than second"
    else
        if n == k
            then 1
        else
            div (factorial n) ((factorial k) * (factorial (n-k)))

-- _________________________________________________________________________

-- хвостовая рекурсия
factorial' :: Integer -> Integer
factorial' n = go n 1
    where
        go 0 k = k
        go 1 k = k
        go n k = go (n-1) (k*n)

binomKof2 k n =
    if n < k
        then error "First argument must be less than second"
    else
        if n == k
            then 1
        else
            div (factorial' n) ((factorial' k) * (factorial' (n-k)))

main = putStrLn (show (binomKof2 2 5))