module Entrypoint (app) where

import RIO
import RIO.Prelude.Simple (SimpleApp)

app :: RIO SimpleApp ()
app = logInfo "Hello from RIO in `rules_haskell`"
