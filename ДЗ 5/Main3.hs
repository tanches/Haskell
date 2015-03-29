module Main where

-- Создать тип данных для списков, в которых чередуются элементы двух разных типов.
data ListOfDiffTypes = Null
                        | Cons String ListOfDiffTypes Int ListOfDiffTypes
                        | Con String ListOfDiffTypes Int ListOfDiffTypes String ListOfDiffTypes
                        | Cons2 Int ListOfDiffTypes String ListOfDiffTypes
                        | Con2 Int ListOfDiffTypes String ListOfDiffTypes Int ListOfDiffTypes
						
ex1 = Cons "hello" 5 Con "world" 3 "!"
ex2 = Cons2 4 "wow" 3 Con2 3 "same" 7