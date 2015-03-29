module Main where

-- Создать тип данных для списков, в которых чередуются элементы двух разных типов.
data ListOfDiffTypes = Null
                        | Cons String ListOfDiffTypes Int ListOfDiffTypes
                        | Con String ListOfDiffTypes
                        | Cons2 Int ListOfDiffTypes String ListOfDiffTypes
                        | Con2 Int ListOfDiffTypes