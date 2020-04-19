module Composition.Exersice2 where 

import Prelude

import Composition.ExampleData (Car, name)
import Data.List (List, head)
import Data.Maybe (fromJust)
import Partial.Unsafe (unsafePartial)

-- // Exercise 2:
-- // ============
-- // use _.compose(), _.prop() and _.head() to retrieve the name of the first car

-- const nameOfFirstCar = undefined

-- QUnit.test("Ex2: nameOfFirstCar", assert => {
--   assert.equal(nameOfFirstCar(CARS), "Ferrari FF");
-- })

nameOfFirstCar :: List Car -> String
nameOfFirstCar = head >>> unsafePartial fromJust >>> name