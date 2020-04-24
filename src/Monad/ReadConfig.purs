module Monad.ReadConfig where

import Prelude
import Data.Argonaut (class DecodeJson, decodeJson, jsonParser, (.:))
import Data.Either (Either(..))
import Data.Maybe (Maybe(..))
import Effect (Effect)
import Effect.Console (log)
import Effect.Exception (try)
import Node.Encoding (Encoding(..))
import Node.FS.Sync (readTextFile)

data Port
  = Port { port :: Int }

instance showPort :: Show Port where
  show (Port p) = show p

instance decodePort :: DecodeJson Port where
  decodeJson json = do
    obj <- decodeJson json
    port <- obj .: "port"
    pure $ Port { port }

getPort :: String -> Effect (Maybe Int)
getPort path = do
  txt <- try $ readTextFile UTF8 path
  pure case txt of
    (Left error) -> Nothing
    (Right lines) -> case decodeJson =<< jsonParser lines of
      (Left error) -> Nothing
      (Right (Port { port: n })) -> Just n

main :: Effect Unit
main = do
  port <- getPort "src/resources/config.json"
  log
    $ case port of
        Nothing -> "Some default port"
        Just p -> show p
