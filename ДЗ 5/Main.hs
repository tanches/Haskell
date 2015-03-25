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

--main = putStrLn (show (height tree_three))

