module Main where

-- Создать тип данных для бинарного дерева поиска (binary search tree), хранящего значения типа Int.
data BinarySearchTree =
                        Null
                        | Node BinarySearchTree Int BinarySearchTree
                        deriving (Show)
-- interp. binary search tree

tree_null = Null
tree_one = Node Null 1 Null
tree_two = Node Null 2 tree_one
tree_three = Node Null 3 tree_two

--main = putStrLn (show tree_two)

-- Реализовать функцию подсчёта высоты этого дерева.
height :: BinarySearchTree -> Integer
height Null = 0
--находим максимальное дерево и к нему прибавляем 1, т.к. меньшее дерево и так войдет в большее по высоте
height (Node left _ right) = (max (height left) (height right)) + 1

--main = putStrLn (show (height tree_three))

-- Реализовать функцию суммирования всех элементов в дереве.
sumT :: BinarySearchTree -> Int
sumT Null = 0
sumT (Node left middle right) = (+) middle ((+) (sumT left) (sumT right))

main = putStrLn (show (sumT tree_three))

-- Реализовать функцию поиска заданного элемента в дереве.
find Null _ = (Null)
find (Node left toFind right) n
                             -- ищем справа
                             | n > toFind = Node left toFind (find right n)
                             -- ищем слева
                             | n < toFind = Node (find left n) toFind right
                             -- нашли!
                             | n == toFind = error "Actually, it isn't error. I really found this number"

main = putStrLn (show (find tree_two 2))