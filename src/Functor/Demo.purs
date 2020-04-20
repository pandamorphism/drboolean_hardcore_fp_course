module Functor.Demo where

import Prelude
import Control.Comonad (extract)
import Data.Identity (Identity(..))
import Data.List (List(..), head, filter, (:))
import Data.Maybe (fromJust)
import Partial.Unsafe (unsafePartial)

-- const halfFirstLargeNumber = xs => {
--     const found = xs.filter(x => x >= 20)
--     const answer = first(found) / 2;
--     return `The anser is ${answer}`
-- }
-- 
-- const res = halfFirstLargeNumber([1,4,50])
nums :: List Int
nums = (1) : (4) : (50) : Nil

-- using map only
halfFirstLargeNumber :: List Int -> Int
halfFirstLargeNumber xs =
  extract $ Identity xs
    <#> filter (\x -> x >= 20)
    <#> head
    <#> unsafePartial fromJust
    <#> (\x -> x / 2)

--  map composition 
halfFirstLargeNumber' :: List Int -> Int
halfFirstLargeNumber' xs =
  extract
    $ filter (\x -> x >= 20)
    >>> head
    >>> unsafePartial fromJust
    >>> (\x -> x / 2)
    <$> Identity xs
