module Main where

import RIO
import RIO.Prelude.Simple (runSimpleApp)

import Entrypoint (app)

main :: IO ()
main = runSimpleApp app
