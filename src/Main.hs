module Main where
import Control.Concurrent


runInParallel :: IO a -> IO b -> IO (a,b)
runInParallel ioX ioY = do
  varX <- newIVar
  varY <- newIVar
  _ <- forkIO $ putIVar varX =<< ioX
  _ <- forkIO $ putIVar varY =<< ioY
  (,) <$> readIVar varX <*> readIVar varY


type IVar a = MVar a

newIVar :: IO (IVar a)
newIVar = newEmptyMVar

readIVar :: IVar a -> IO a
readIVar var = readMVar var

putIVar :: IVar a -> a -> IO ()
putIVar var x = putMVar var x
















main :: IO ()
main = return ()
