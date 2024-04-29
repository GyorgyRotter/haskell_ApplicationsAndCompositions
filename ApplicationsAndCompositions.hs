module ApplicationsAndCompositions(
   applications,
   compositions, compositions2,
   transformations
) where

import Control.Arrow( (>>>) )
import Data.Function(  (&)  )


g x = 2 + x
f x = 3 * x

applications = [ f 2
               , (f) 2
               , f (2)         -- t1
               , (f) $ 2       --
               , f $ 2
               , ($) f 2       -- emph. partial appl.
               , (($) f) 2     --
               ]

compositions = [ g (f (2))
               , g (f 2)       -- using t1
               , (g) $ f 2
               , g $ f 2
               , g $ f $ 2     -- t2
               , (g . f) $ 2   --
               , (g . f) 2
               , g  .  f $ 2
               , f >>> g $ 2
               ]

compositions2 = [ g (3 * 2)
                , g ((*) 3 2)         -- using t1
                , (g) $ (*) 3 2
                , g $ (*) 3 2         -- emph. partial appl.
                , g $ ((*) 3) 2
                , g $ ((*) 3) $ 2     -- using t2
                , (g . ((*) 3)) $ 2
                , (g . ((*) 3)) 2
                , (g . (*) 3) 2
                , g      . (*) 3 $ 2
                , (*) 3 >>> g    $ 2
                ]

transformations = [ 'a':"b"
                  , "ab"
                  , concat ["ab"]
                  , concat ["a" ++ "b"]
                  , concat [(++) "a" "b"]
                  , concat $ map ((++) "a") ["b"]  -- important usage of $
                  , concat $ map ($ "a") [(++ "b")]
                  , concat $ map (flip ($) "a") [(++ "b")]
                  , concat . map (flip ($) "a") $ [(++ "b")]
                  , concat . map ((&)      "a") $ [(++ "b")]
                  ]
