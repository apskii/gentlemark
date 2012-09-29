{-# LANGUAGE DataKinds, FlexibleContexts #-}
module Text.GentleMark ( Term(..), Type(..), parse ) where

import Text.GentleMark.Term
import Text.GentleMark.Parsec

import Control.Applicative hiding ( many )
import Data.Functor.Identity

import Text.Parsec.Prim hiding ( parse )
import Text.Parsec.Char

parse :: Stream s Identity Char => s -> [Term Toplevel]
parse = either (error . show) id . runParser (spaces *> many toplevelTerm) () ""