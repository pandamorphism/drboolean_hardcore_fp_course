module Test.Main where

import Prelude
import Composition.ExampleData (cars)
import Composition.Exersice1 (isLastInStock)
import Composition.Exersice2 (nameOfFirstCar)
import Composition.Exersice3 (totalDollarValue)
import Composition.Exersice4 (fastestCar, sanitizeNames)
import Data.List (length)
import Effect (Effect)
import Effect.Aff (launchAff_)
import Test.Spec (describe, it, pending)
import Test.Spec.Assertions (shouldContain, shouldEqual)
import Test.Spec.Reporter (specReporter)
import Test.Spec.Runner (runSpec)

main :: Effect Unit
main =
  launchAff_
    $ runSpec [ specReporter ] do
        describe "Exersice 1" do
          it "should have test data" do
            let
              carsLen = length cars
            carsLen `shouldEqual` 6
          it "last car should not be in stock" do
            let
              isLast = isLastInStock cars
            isLast `shouldEqual` false
        describe "Exersice 2" do
          it "should return correct car name" do
            let
              carName = nameOfFirstCar cars
            carName `shouldEqual` "Ferrari FF"
        describe "Exersice 3" do
          it "should calculate average cost of cars" do
            let
              averageDollars = totalDollarValue cars
            averageDollars `shouldEqual` 790700
        describe "Exersice 4" do
          it "should sanitize names" do
            let
              names = sanitizeNames cars
            names `shouldContain` "ferrari_ff"
            names `shouldContain` "spyker_c12_zagato"
            names `shouldContain` "jaguar_xkr-s"
            names `shouldContain` "audi_r8"
            names `shouldContain` "aston_martin_one-77"
            names `shouldContain` "pagani_huayra"
          it "should find fastest" do
            let
              fastest = fastestCar cars
            fastestCar `shouldEqual` "Aston Martin One-77 is the fastest"
        pending "feature complete"
