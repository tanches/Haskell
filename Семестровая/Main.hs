module Main where

data Term2 =
    Variable String
    | Abstraction Term2 Term2
    | Application String Term2 deriving (Show)
-- Interp. Data definition

data Term =
    Var Integer
    | Abs Term
    | App Term Term deriving (Show)
-- Interp. Data definition for lambda calculus

-- Shift
termShift :: Integer -> Integer -> Term -> Term
termShift d b term = case term of
    Var v -> if (v >= b) then Var (v + d) else Var v
    Abs t -> Abs (termShift d (b + 1) t)
    App t1 t2 -> App (termShift d b t1) (termShift d b t2)

-- Substitution
termSubst :: Integer -> Term -> Term -> Term
termSubst d b term = case term of
    Var v -> if (v == d) then b else Var v
    Abs t -> Abs (termSubst (d + 1) (termShift 1 0 b) t)
    App t1 t2 -> App (termSubst d b t1) (termSubst d b t2)

termSubstTop :: Term -> Term -> Term
termSubstTop s v =
    termShift (-1) 0 (termSubst 0 (termShift 1 0 s) v)

-- Evaluator
eval :: Term -> Term
eval term = case term of
    Var v -> Var v
    Abs t -> Abs (eval t)
    App t1 t2 -> termSubstTop (eval t1) (eval t2)

main = putStrLn (show (eval (App (Abs (Var 3)) (Var 1))))