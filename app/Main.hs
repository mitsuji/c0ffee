{-# LANGUAGE OverloadedStrings #-}

module Main where

import GHC.IO.Handle (isEOF)
import qualified Data.ByteString.Char8 as B8
import Control.Monad (when)
import Data.Char (toUpper, toLower)


-- | Find words like "coffee" (#C0FFEE) which can be written as hexadecimal number.
main :: IO ()
main = loop
  where
    loop = do eof <- isEOF
              if eof then return()
                else do bs <- B8.getLine
                        when (eval bs) $ do
                          B8.putStr bs 
                          B8.putStr " ("
                          B8.putStr $ format1 $ conv bs
--                          B8.putStr $ format2 $ conv bs
                          B8.putStr ")\n"
                        loop


eval :: B8.ByteString -> Bool
eval = B8.all f
  where
    f :: Char -> Bool
    f c =
      let
        num = fromEnum '0' <= fromEnum c && fromEnum c <= fromEnum '9'
        ua  = fromEnum 'A' <= fromEnum c && fromEnum c <= fromEnum 'F'
        la  = fromEnum 'a' <= fromEnum c && fromEnum c <= fromEnum 'f'
      in num || ua || la || g c

    g :: Char -> Bool
    g 'I' = True
    g 'O' = True
    g 'S' = True
    g 'Z' = True
    g 'l' = True
    g 'o' = True
    g 'q' = True
    g 's' = True
    g 'z' = True
    g _ = False


conv :: B8.ByteString -> B8.ByteString
conv = B8.map f
  where
    f :: Char -> Char
    f 'I' = '1'
    f 'O' = '0'
    f 'S' = '5'
    f 'Z' = '2'
    f 'l' = '1'
    f 'o' = '0'
    f 'q' = '9'
    f 's' = '5'
    f 'z' = '2'
    f c = c
      

format1 :: B8.ByteString -> B8.ByteString
format1 bs = B8.append "#" $ B8.map toUpper bs

format2 :: B8.ByteString -> B8.ByteString
format2 bs = B8.append "0x" $ B8.map toLower bs
