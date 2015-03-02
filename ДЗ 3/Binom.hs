module Main where

factorial n =
    -- ��������� �� 0 = 1
    if n == 0
        then 1
    else 
    -- ����������� ���������� ����������
        n * factorial (n-1)

-- ������������ �����������
binomKof :: Int -> Int -> Int
binomKof k n =
    if n == k
        then 1
    else
        div (factorial n) ((factorial k)*(factorial (n-k)))

main = putStrLn(show(binomKof 2 6))