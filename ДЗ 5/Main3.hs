module Main where

-- Создать тип данных для списков, в которых чередуются элементы двух разных типов.
data ListOfDiffTypes = Null
                        | Cons String Int ListOfDiffTypes
                        | Con String Int String ListOfDiffTypes
                        | Cons2 Int String ListOfDiffTypes
                        | Con2 Int String Int ListOfDiffTypes
						
ex1 = Cons "hello" 5 Null
ex2 = Cons2 4 "wow" Null
ex3 = Con "wow" 3 "rest" Null
ex4 = Con "wow" 3 "rest" Null
ex5 = Cons "hello" 5 ex3

fn_for_list :: ListOfDiffTypes -> a
fn_for_list list = case list of
                    Null -> undefined
                    Cons str int list -> undefined str (fn_for_list list)
                    Con str int str2 list -> undefined str (fn_for_list list)
                    Cons2 int str list -> undefined str (fn_for_list list)
                    Con2 int str int2 list -> undefined str (fn_for_list list)

-- Реализовать функцию определения длины такого списка.
length2 :: ListOfDiffTypes -> Int
length2 l = case l of
                    Null -> 0
                    Cons str int l -> 2 + (length2 l)
                    Con str int str2 l -> 3 + (length2 l)
                    Cons2 int str l -> 2 + (length2 l)
                    Con2 int str int2 l -> 3 + (length2 l)

main = putStrLn (show (length2 ex5))