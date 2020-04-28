module Composition.Exercises.Spec (spec) where

import Prelude
import Composition.ExampleData (cars)
import Composition.Exersice1 (isLastInStock)
import Composition.Exersice2 (nameOfFirstCar)
import Composition.Exersice3 (totalDollarValue)
import Composition.Exersice4 (fastestCar, sanitizeNames)
import Data.List (length)
import Test.Spec (Spec, describe, it)
import Test.Spec.Assertions (shouldContain, shouldEqual)

spec :: Spec Unit
spec =
  describe "Composition" do
    describe "Exersice 1"
      let
        carsLen = length cars
      in
        do
          it "should have test data" do
            carsLen `shouldEqual` 6
          it "last car should not be in stock" do
            let
              isLast = isLastInStock cars
            isLast `shouldEqual` false
    describe "Exersice 2"
      let
        carName = nameOfFirstCar cars
      in
        do
          it "should return correct car name" do
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
        fastest `shouldEqual` "Aston Martin One-77 is the fastest"
