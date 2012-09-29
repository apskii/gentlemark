module Main where

import Text.GentleMark
import Data.List

import Test.HUnit

p = parse . intercalate "\n"

case_complex_1 =
  p [ "  Hello, %%__**~~world~~**__%%:"
    , "                  > This is quote"
    , ">And this is quote"
    , "This"
    , "   is unordered list:   "
    , "- foo   "
    , "  - bar"
    , "- bazzz"
    , " This one is ordered:"
    , "1.     Q"
    , "  2. RR   RRR   **~~**"
    , "    3.  [code|haskell]fix f = f (fix f)   [/code]"
    , "4.    $$  x + y^2    $$"
    , "   ``    lolo                    2123 lolol"
    , " asdd 21 3             wioejf"
    , "lol ``"
    , " The End. "
    ] @?= [ Paragraph [Text "Hello, ",Spoiler [Underlined [Bold [Italic [Text "world"]]]],Text ":"]
          , Quote " This is quote"
          , Quote "And this is quote"
          , Paragraph [Text "This"]
          , Paragraph [Text "is unordered list: "]
          , UList [[Text "foo "],[Text "bar"],[Text "bazzz"]]
          , Paragraph [Text "This one is ordered:"]
          , OList [ (1,[Text "Q"])
                  , (2,[Text "RR RRR ",Bold [Text "~~"]])
                  , (3,[Tag "code" ["haskell"] "fix f = f (fix f)   "])
                  , (4,[Latex "  x + y^2    "]) ]
          , Paragraph [Monospace "    lolo                    2123 lolol\n asdd 21 3             wioejf\nlol "]
          , Paragraph [Text "The End. "]
          ]

main :: IO ()
main = case_complex_1