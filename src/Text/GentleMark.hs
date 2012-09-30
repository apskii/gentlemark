{-# LANGUAGE FlexibleContexts, DataKinds, ConstraintKinds #-}
module Text.GentleMark ( module Text.GentleMark.Term, Source, parse ) where

import Text.GentleMark.Term
import Text.GentleMark.Parsec

import Control.Applicative hiding ( many )
import Data.Functor.Identity

import Text.Parsec.Prim hiding ( parse )
import Text.Parsec.Char

type Source s = Stream s Identity Char

parse :: Source s => s -> [Term Toplevel]
parse = either (error . show) id . runParser (spaces *> many toplevelTerm) () ""