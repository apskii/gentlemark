## Gentlemark

This is a gentle markup language, designed to fit forum-like systems.

## Markup

-   Styles:
    
        \*\*Bold\*\*
        ~~Italic~~
        __Underlined__  
        !!Striked!!
        %%Spoiler%%
        \`\`Monospace\`\`
        $$Latex$$

-   Accents:

        /(Quote)/     > I think I can safely say that nobody understands quantum mechanics.
        /(Reference)/ >>19991
        /(Hyperlink)/ http:.., https:.., ftp:.., mailto:.., news:.., irc:..

-   Unordered lists:

        \- Monad axioms:
        \- Kleisli composition forms
        \- a Category

-   Ordered lists:

        1. cabal update
        2. cabal install gentlemark

-   Custom tags:

        [code|haskell] fibs = 0 : 1 : zipWith (+) fibs (tail fibs) [/code]
        [some-tag|some-option-1|...|some-option-n] something [/some-tag]
        [foo] bar [/foo]