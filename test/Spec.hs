import Test.Hspec

import Ms

empty = [] :: [Int]

main :: IO ()
main = hspec $ do
    describe "fromList" $ do
        it "constructs a valdid multiset with items" $ do
            fromList [1,2,5,5,4] `shouldBe` Multiset [1,2,4,5,5]
        it "constructs a valid empty set" $ do
            fromList empty `shouldBe` Multiset empty
    describe "Show" $ do
        it "shows an empty multiset" $ do
            show (Multiset empty) `shouldBe` "ms{\216}"
        it "shows a non-empty set" $ do
            show (Multiset [1,2,3]) `shouldBe` "ms{1,2,3}"