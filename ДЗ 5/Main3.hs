module Main where

-- Создать тип данных для списков, в которых чередуются элементы двух разных типов.
data ListOfDiffTypes a b = Null
                | Twist a (ListOfDiffTypes b a)
-- Interp. Definition of list with alternating types of elements

fn_for_list :: ListOfDiffTypes a b -> c
fn_for_list list = case list of
    Null -> undefined
    Twist b list -> undefined b (fn_for_list list)

list_empty = Null
list_one = Twist "string" list_empty
list_two = Twist "wow" (Twist 4 list_empty)

-- Реализовать функцию определения длины такого списка.
length2 :: ListOfDiffTypes a b -> Int
length2 l = case l of
                    Null -> 0
                    Twist b list -> 1 + (length2 list)

--main = putStrLn (show (length2 list_two))

-- Реализовать функцию dmap, принимающую такой список и две функции преобразования элементов,
-- и возвращающую новый список, содержащий преобразованные элементы в том же порядке, что и исходные.
--dmap :: ((a b) -> (c d)) -> ((c d) -> (e f)) -> ListOfDiffTypes a b -> ListOfDiffTypes e f
dmap operation operation2 list = case list of
                Null -> Null
                Twist arg list -> (operation operation2 arg) (dmap operation operation2 list)

main = putStrLn ("It's OK")