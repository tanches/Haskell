module Main where

-- PROBLEM A
data DinnerOrder = Chicken | Pasta | NotOrder deriving (Show)
-- Interp. Various for dinner
-- Examples don't need
fn_for_dinner_order :: DinnerOrder -> a
fn_for_dinner_order d = case d of
                        Chicken  -> undefined
                        Pasta    -> undefined
                        NotOrder -> undefined

-- PROBLEM B
dinner_order_to_msg :: DinnerOrder -> String
dinner_order_to_msg dotm = case dotm of
                                Chicken  -> "The passenger ordered chicken."
                                Pasta    -> "The passenger ordered pasta."
                                NotOrder -> "The passenger didn'r order a dinner."

main = putStrLn (dinner_order_to_msg Pasta)