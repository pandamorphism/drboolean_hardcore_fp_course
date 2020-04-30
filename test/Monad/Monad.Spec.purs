module ReadConfig.Spec (spec) where

import Prelude
import Data.Either (fromLeft, fromRight)
import Effect.Class (liftEffect)
import Monad.ReadConfig (getPort)
import Partial.Unsafe (unsafePartial)
import Test.Spec (Spec, describe, it)
import Test.Spec.Assertions (shouldEqual)

spec :: Spec Unit
spec =
  describe "Monad" do
    describe "ReadConfig specs" do
      it "should handle file not found" do
        eitherResult <- liftEffect $ getPort "path/unknown"
        unsafePartial $ fromLeft eitherResult `shouldEqual` "There is no file: path/unknown"
      it "should handle property not found" do
        eitherResult <- liftEffect $ getPort "test/Monad/config-without-data.json"
        unsafePartial $ fromLeft eitherResult `shouldEqual` "Cannot decode port from JSON"
      it "should return decoded port" do
        eitherResult <- liftEffect $ getPort "test/Monad/config-with-data.json"
        unsafePartial $ fromRight eitherResult `shouldEqual` 8081
