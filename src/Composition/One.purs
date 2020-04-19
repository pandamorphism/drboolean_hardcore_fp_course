module Composition.One where

import Prelude (Unit, map, ($), (<<<), (<>), (>>>))

import Data.Array (reverse)
import Data.String (Pattern(..), joinWith, split, toLower, toUpper, trim)
import Data.String.CodeUnits (toCharArray, singleton)
import Effect (Effect)
import Effect.Class.Console (logShow)

foreign import unsafeFirst :: forall a. Array a -> a 

exclaim :: String -> String
exclaim str = str <> "!"

-- compose f . g is <<<
--  compose g . j is >>>

shout :: String -> String
shout = exclaim <<< toUpper 
-- shout =  toUpper >>> exclaim

shoutFirst :: String -> String
shoutFirst = shout >>> toCharArray >>> unsafeFirst >>> singleton >>> (_ <> "!!!")

doStuff :: String -> String
doStuff = toLower >>> split (Pattern " ") >>> map trim >>> reverse >>> joinWith " "  


main :: Effect Unit
main = do 
    logShow $ "ab " <> "cd"