module Main where

-- PROBLEM A
type OatmealTemp = Int --Temperature of breakfast
-- Interp. The value of degrees of heating oatmeal
cold, ideal, hot :: OatmealTemp
-- Value's examples
cold = 0
ideal = 10
hot = 20
-- Templates
fn_for_oatmeal_temp :: OatmealTemp -> a
fn_for_oatmeal_temp o = (undefined o)

-- PROBLEM B
data Adjustment = ToLeft | ToRight | LeaveAsIs deriving (Show)
-- Interp. States of stove's knob should be
-- Examples don't need
fn_for_adjustment :: Adjustment -> a
fn_for_adjustment adj = case adj of
                        ToLeft    -> undefined
                        ToRight   -> undefined
                        LeaveAsIs -> undefined

-- PROBLEM C
oatmeal_temp_to_adjustment :: OatmealTemp -> Adjustment
oatmeal_temp_to_adjustment current =
                                if current < ideal
                                    then ToRight
                                else
                                    if current > ideal
                                        then ToLeft
                                    else LeaveAsIs

main = putStrLn (show (oatmeal_temp_to_adjustment 5))