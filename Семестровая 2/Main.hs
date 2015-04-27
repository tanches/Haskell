module Main where

type Context = [(String, Type)]
-- interp. list of variable's names and links

data Type =
      Bool
    | Arr Type Type deriving (Eq)
-- interp. type of typed arithmetic expression

data Term =
      TermTrue
    | TermFalse
    | TermIf Term Term Term
    | TermVar String
    | TermAbs String Type Term
    | TermApp Term Term
-- interp. view terms

context :: Context -> (String, Type) -> Context
context ctx t = t : ctx

getTypeFromContext ctx var = case (lookup var ctx) of
    Just typ -> typ
    Nothing -> error "Wrong type of binding for variable"
-- find variable type in the context

checkType :: Context -> Term -> Type
checkType ctx t = case t of
    TermTrue -> Bool
    TermFalse -> Bool
    TermIf t1 t2 t3 -> if (checkType ctx t1 == Bool)
                           then
                               let
                                   type2 = checkType ctx t2
                               in
                                   if (type2 == checkType ctx t3)
                                       then type2
                                   else error "Different types"
                       else error "Not a boolean"
    TermVar v -> getTypeFromContext ctx v
    TermAbs str typ t -> Arr typ (checkType (context ctx (str, typ)) t)
    TermApp t1 t2 -> let
                        type1 = checkType ctx t1
                        type2 = checkType ctx t2
                     in case type1 of
                            Arr t11 t12 -> if (t11 == type2) then t12 else error "Different types"
                            _ -> error "Type is null"

main = putStrLn ("OK")