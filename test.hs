import ApplicationsAndCompositions

-- Check whether all elements of xs are equal
-- concept:
--  [a, b, c, d]       xs
--   |  |  |  |        (==) (commutative)
--  [b, c, d]          drop 1 xs
--
-- (a == b) && (b == c) && (c == d)
allTheSame xs = and $ zipWith (==) xs (drop 1 xs)

main :: IO ()
main = do
       putStrLn $ show $ allTheSame applications
       putStrLn $ show $ allTheSame compositions
       putStrLn $ show $ allTheSame compositions2
       putStrLn $ show $ allTheSame transformations
