module Monad.EitherExample where

import Prelude
import Data.Either (Either(..), either)
import Data.List (List(..), (:))
import Data.String (toUpper)
import Effect (Effect)
import Effect.Console (logShow)

type Color
  = { name :: String, hex :: String }

type Colors
  = List Color

colors ::
  List
    { hex :: String
    , name :: String
    }
colors = ({ name: "red", hex: "#ff0000" }) : ({ name: "green", hex: "#00ff00" }) : ({ name: "blue", hex: "#0000ff" }) : Nil

findColor :: String -> Colors -> Either String Color
findColor name Nil = Left "Not found"

findColor name (Cons x xs) = if x.name == name then Right x else findColor name xs

id :: forall a. a -> a
id x = x

main :: Effect Unit
main = do
  logShow
    $ either (\x -> "Error: " <> x) id
    $ findColor "red" colors
    <#> (\c -> c.hex)
    <#> toUpper
