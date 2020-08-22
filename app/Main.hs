{-# LANGUAGE OverloadedStrings #-}

module Main where

import GHC.IO.Handle (isEOF)
import qualified Data.ByteString.Char8 as B8
import Control.Monad (when)
import Data.Char (toUpper, toLower)
import Data.Maybe (isJust,fromMaybe)


-- | Find words like "coffee" (#C0FFEE) which can be written as hexadecimal number.
main :: IO ()
main = loop
  where
    loop = do
      eof <- isEOF
      when (not eof) $ processLine >> loop

    processLine = do
      bs <- B8.getLine
      when (eval bs) $ do
        B8.putStr bs
        B8.putStr " ("
        B8.putStr $ format1 $ conv bs
--        B8.putStr $ format2 $ conv bs
        B8.putStr ")\n"

alphaDigits :: [(Char,Char)]
alphaDigits = [
   ('I', '1')
  ,('O', '0')
  ,('S', '5')
  ,('Z', '2')
  ,('l', '1')
  ,('o', '0')
  ,('q', '9')
  ,('s', '5')
  ,('z', '2')
  ]

eval :: B8.ByteString -> Bool
eval = B8.all f
  where
    f :: Char -> Bool
    f c =
      let
        num = '0' <= c && c <= '9'
        ua  = 'A' <= c && c <= 'F'
        la  = 'a' <= c && c <= 'f'
        ad  = isJust $ lookup c alphaDigits
      in num || ua || la || ad

conv :: B8.ByteString -> B8.ByteString
conv = B8.map f
  where
    f c = fromMaybe c (lookup c alphaDigits)

format1 :: B8.ByteString -> B8.ByteString
format1 bs = "#" <> B8.map toUpper bs

format2 :: B8.ByteString -> B8.ByteString
format2 bs = "0x" <> B8.map toLower bs
