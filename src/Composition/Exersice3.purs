module Composition.Exersice3 where

import Prelude
import Composition.ExampleData (Car, dollarValue)
import Data.List (List, foldr, length)

-- // Exercise 3:
-- // ============
-- // Use the helper function _average to refactor averageDollarValue as a composition
-- const _average = function(xs) { return _.reduce(_.add, 0, xs) / xs.length; }; // <- leave be
-- const averageDollarValue_ = function(cars) {
--   const dollar_values = _.map(_.prop('dollar_value'), cars);
--   return _average(dollar_values);
-- };
-- var averageDollarValue = function(cars) {
--   var dollar_values = _.map(function(c) { return c.dollar_value; }, cars);
--   return _average(dollar_values);
-- };
-- QUnit.test("Ex3: averageDollarValue", assert => {
--   assert.equal(averageDollarValue(CARS), 790700);
-- })
totalDollarValue :: List Car -> Int
totalDollarValue = map dollarValue >>> (\xs -> foldr (+) 0 xs / (length xs))
