module Main where

type Context = [(String, Type)]
-- interp. list of variable's names and links

data Type =
      Bool
    | Error
    | Arr Type Type deriving (Show, Eq)
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
    Nothing -> Error
--    Nothing -> error "Wrong type of binding for variable"
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
                                   else Error
--                                   else error "Different types"
                        else Error
--                       else error "Not a boolean"
    TermVar v -> getTypeFromContext ctx v
    TermAbs str typ t -> Arr typ (checkType (context ctx (str, typ)) t)
    TermApp t1 t2 -> let
                        type1 = checkType ctx t1
                        type2 = checkType ctx t2
                     in case type1 of
                            Arr t11 t12 -> if (t11 == type2) then t12
                                            else Error
--                                                else error "Different types"
                            _ -> Error
--                            _ -> error "Type is null"

checkTyp :: Type -> Bool
checkTyp typ = if (typ == Error) then False else True

--main = putStrLn (show (checkTyp(checkType [("x", Bool)] (TermApp (TermAbs "y" (Arr Bool Bool) (TermVar "x")) (TermAbs "y" Bool (TermVar "y"))))))
main = putStrLn (show (checkTyp(checkType [("x", Bool)] (TermApp (TermAbs "y" (Arr (Arr Bool Bool) Bool) (TermVar "y")) (TermAbs "x" Bool (TermVar "x"))))))