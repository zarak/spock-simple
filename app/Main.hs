{-# LANGUAGE OverloadedStrings #-}
module Main where

import Lib
import Web.Spock as Spock
import Web.Spock.Config as Spock
import Data.Aeson as A

main :: IO ()
main = do
  spockCfg <- defaultSpockCfg () PCNoDatabase ()
  runSpock 3000 $ spock spockCfg $ do
    get root $ do
      Spock.html "<div>Hello world!</div>"
    get "users" $ do
      Spock.json (A.object [ "users" .= users ])
    get ("users" <//> var <//> "friends") $ \userID -> do
      Spock.json (A.object [ "userID" .= (userID :: Int), "friends" .= A.Null ])

  where users :: [String]
        users = ["bob", "alice"]
