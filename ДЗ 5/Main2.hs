module Main where

--Создать тип данных для бинарного дерева, хранящего в листьях элементы произвольного типа.
data BinarySearchTree a =
                        Null
                        | Node a (BinarySearchTree a)  (BinarySearchTree a)
                        deriving (Show)
-- interp. binary search tree with different types


tree_null = Null
tree_one = Node "Hello" Null Null
tree_two = Node "World" (Node "!" Null Null) (tree_one)

--Реализовать функцию подсчёта высоты этого дерева.
height :: BinarySearchTree a -> Int
height Null = 0
height (Node _ left right) = max (height left) (height right) + 1

--main = putStrLn (show (height tree_two))

--Реализовать функцию tmap, принимающюю дерево и функцию преобразования элемента (a -> b) и
--возвращающую новое дерево той же формы, но содержащее элементы, полученные применением функции к исходным элементам.
tmap :: (a -> b) -> BinarySearchTree a -> BinarySearchTree b
tmap operation tr = case tr of
                Null -> Null
                Node l m r -> Node (operation l) (tmap operation m) (tmap operation r)

main = putStrLn("It's OK")