﻿module Fibonacci where

import Data.Array
-- числа Фибоначчи: 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, ...
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci 2 = 1
-- рекурсивное вычисление n-го элемента в ряде чисел Фибоначчи
fibonacci n = fibonacci (n-1) + fibonacci (n-2)

fibArray :: Int -> Array Int Int
fibArray n = arr
    -- запись ряда чисел Фибоначчи из n элементов в массив
    -- так как вычисляемое значение зависит от текущей позиции в выходном массиве, необходимо указывать этот самый счетчик
    where arr = array (0, n) ([(0, 0), (1, 1), (2, 1)] ++ [(i, arr!(i-2) + arr!(i-1)) | i <- [3..n]])

fibList n = list where list = [0, 1, 1] ++ [((fibonacci i)) | i <- [3..n]]

main = putStrLn ((show (fibArray 10)) ++ "\n" ++ (show (3)) ++ " element is " ++ show (fibonacci 3) ++ "\n" ++ show (fibList 10))