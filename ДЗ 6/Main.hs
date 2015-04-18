module Main where

-- map принимает на вход функцию и список. Возвращает список, где каждый элемент является результатом применения функции
-- map using foldr
-- map :: (a -> b) -> [a] -> [b]
-- foldr :: (a -> b -> b) -> b -> [a] -> b
map_foldr operation ass =
                        foldl func input ass
                            where
                                func as arr = [(operation arr)] ++ arr
                                input = []

-- map using foldl
-- map :: (a -> b) -> [a] -> [b]
-- foldl :: (a -> b -> a) -> a -> [b] -> a
map_foldl operation ass =
                        (foldl func input ass)
                            where
                                func as arr = arr ++ [(operation arr)]
                                input = []

-- =========================================================================================================================================

-- concatMap получает на вход функцию, возвращающую список списков, и исходный список, к которому применяется функция. Результат сращивается.
-- concatMap using foldr
-- concatMap :: (a -> [b]) -> [a] -> [b]
-- foldr :: (a -> b -> b) -> b -> [a] -> b
concatMap_foldr operation ass =
                                (foldr func input ass)
                                    where
                                        func arr as = (operation arr) ++ as
                                        input = []

-- concatMap using foldl
-- concatMap :: (a -> [b]) -> [a] -> [b]
-- foldl :: (a -> b -> a) -> a -> [b] -> a
concatMap_foldl operation ass =
                                reverse (foldl func input ass)
                                    where
                                        func as arr = reverse (operation arr) ++ as
                                        input = []
-- concatMap using recursive
concatMap_recursive operation ass = case ass of
                        [] -> []
                        as : ass' -> (++) (operation as) (concatMap_recursive operation ass')