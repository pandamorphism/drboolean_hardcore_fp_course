module Composition.Exersice1 where

import Prelude

import Composition.ExampleData (Car, cars, isInStock)
import Data.List (List, head, reverse)
import Data.Maybe (fromJust)
import Effect (Effect)
import Effect.Class.Console (logShow)
import Partial.Unsafe (unsafePartial)



-- // Exercise 1:
-- // ============
-- // use _.compose() to rewrite the function below. Hint: _.prop() is curried.

-- const isLastInStock = cars => {
--   var reversed_cars = _.last(cars)
--   return _.prop('in_stock', reversed_cars)
-- }

-- QUnit.test("Ex1: isLastInStock", assert => {
--   assert.deepEqual(isLastInStock(CARS), false);
-- })

isLastInStock :: List Car -> Boolean
isLastInStock = reverse >>> head >>>  unsafePartial fromJust  >>> isInStock

main :: Effect Unit
main = do
  logShow cars