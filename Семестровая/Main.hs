module Main where

data Term =
    Var Int
    | Abs (String) (Term)
    | App (Term) (Term)
-- Interp. Data definition for lambda calculus