module Composition.Exersice4 where

import Prelude
import Composition.ExampleData (Car(..), name)
import Data.List (List, head, sortBy)
import Data.Maybe (fromJust)
import Data.String (Pattern(..), Replacement(..), replaceAll, toLower)
import Partial.Unsafe (unsafePartial)

-- // Exercise 4:
-- // ============
-- // Write a function: sanitizeNames() using compose that returns a list of lowercase and
--  underscored names: e.g: sanitizeNames(["Hello World"]) //=> ["hello_world"].
-- QUnit.test("Ex4: sanitizeNames", assert => {
--   assert.deepEqual(sanitizeNames(CARS), 
-- ['ferrari_ff', 'spyker_c12_zagato', 'jaguar_xkr_s', 'audi_r8', 'aston_martin_one_77', 'pagani_huayra']);
-- })
sanitize :: String -> String
sanitize = toLower >>> replaceAll (Pattern " ") (Replacement "_")

sanitizeNames :: List Car -> List String
sanitizeNames = map name >>> map sanitize

-- const fastestCar = function(cars) {
--   const sorted = _.sortBy(car => car.horsepower, cars);
--   const fastest = _.last(sorted);
--   return fastest.name + ' is the fastest';
-- }
compareCars :: Car -> Car -> Ordering
compareCars (Car { horsepower: h1 }) (Car { horsepower: h2 }) = if h2 - h1 > 0 then GT else if h2 - h1 < 0 then LT else EQ

fastestCar :: List Car -> String
fastestCar = sortBy compareCars >>> map name >>> head >>> unsafePartial fromJust >>> (\c -> c <> " is the fastest")
