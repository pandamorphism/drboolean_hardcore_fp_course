module Composition.ExampleData where

import Prelude

import Data.List (List(..), (:))


cars :: List Car
cars =
  (Car { name: "Ferrari FF", horsepower: 660, dollar_value: 700000, in_stock: true })
    : (Car { name: "Spyker C12 Zagato", horsepower: 650, dollar_value: 648000, in_stock: false })
    : (Car { name: "Jaguar XKR-S", horsepower: 550, dollar_value: 132000, in_stock: false })
    : (Car { name: "Audi R8", horsepower: 525, dollar_value: 114200, in_stock: false })
    : (Car { name: "Aston Martin One-77", horsepower: 750, dollar_value: 1850000, in_stock: true })
    : (Car { name: "Pagani Huayra", horsepower: 700, dollar_value: 1300000, in_stock: false })
    : Nil

data Car
  = Car
    { name :: String
    , horsepower :: Int
    , dollar_value :: Int
    , in_stock :: Boolean
    }

isInStock :: Car -> Boolean
isInStock (Car {in_stock: stock}) = stock

name :: Car -> String
name (Car {name: n}) = n

instance showCar :: Show Car where
  show (Car { name: n, horsepower: horsepower, dollar_value: dollar_value, in_stock: in_stock }) = "(" <> show n <> ", " <> show horsepower <> ", " <> show dollar_value <> ", " <> show in_stock <> ")"
