module Main where

data ListOfDiffTypes = Null
                        | Cons String ListOfDiffTypes Int ListOfDiffTypes
                        | Con String ListOfDiffTypes
                        | Cons2 Int ListOfDiffTypes String ListOfDiffTypes
                        | Con2 Int ListOfDiffTypes