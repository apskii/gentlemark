{-# LANGUAGE DataKinds, GADTs, KindSignatures, StandaloneDeriving #-}
module Text.GentleMark.Term ( Type(..), Term(..), tagName, tagOptions, tagBody ) where

data Type = Toplevel | Textual

data Term :: Type -> * where
  
  Text       :: String -> Term Textual

  Bold       :: [Term Textual] -> Term Textual
  Italic     :: [Term Textual] -> Term Textual
  Underlined :: [Term Textual] -> Term Textual
  Striked    :: [Term Textual] -> Term Textual
  Spoiler    :: [Term Textual] -> Term Textual
  
  Latex      :: String -> Term Textual
  Monospace  :: String -> Term Textual                          
  Reference  :: String -> Term Textual
  Hyperlink  :: String -> Term Textual
            
  Tag        :: String -> [String] -> String -> Term Textual

  Quote      :: String                      -> Term Toplevel
  UList      :: [[Term Textual]]            -> Term Toplevel
  OList      :: [(Integer, [Term Textual])] -> Term Toplevel
  Paragraph  :: [Term Textual]              -> Term Toplevel

deriving instance Eq   (Term t)
deriving instance Ord  (Term t)
deriving instance Show (Term t)

tagName :: Term Textual -> String
tagName (Tag name _ _) = name
tagName _              = error "Not a Tag-Term!"

tagOptions :: Term Textual -> [String]
tagOptions (Tag _ options _) = options
tagOptions _                 = error "Not a Tag-Term!"

tagBody :: Term Textual -> String
tagBody (Tag _ _ body) = body
tagBody _              = error "Not a Tag-Term!"
