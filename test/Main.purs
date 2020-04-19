module Test.Main where

import Prelude

import Composition.ExampleData (cars)
import Composition.Exersice1 (isLastInStock)
import Composition.Exersice2 (nameOfFirstCar)
import Data.List (length)
import Effect (Effect)
import Effect.Aff (launchAff_)
import Test.Spec (describe, it, pending)
import Test.Spec.Assertions (shouldEqual)
import Test.Spec.Reporter (specReporter)
import Test.Spec.Runner (runSpec)




main :: Effect Unit
main = launchAff_ $ runSpec [specReporter] do
  describe "Exersice 1" do
    it "should have test data" do
      let carsLen = length cars
      carsLen `shouldEqual` 6
    it "last car should not be in stock" do
      let isLast = isLastInStock cars
      isLast `shouldEqual` false
  describe "Exersice 2" do
    it "should return correct car name" do
      let carName = nameOfFirstCar cars
      carName `shouldEqual` "Ferrari FF"    
  pending "feature complete"  
