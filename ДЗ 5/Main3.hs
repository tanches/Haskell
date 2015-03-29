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

fn_for_list :: ListOfDiffTypes -> a
fn_for_list list = case list of
                    Null -> undefined
                    Cons str list -> undefined str (fn_for_list list)