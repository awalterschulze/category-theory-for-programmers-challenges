# Category Theory for Programmers Challenges

## 8. Functoriality

### 8.1. Show that the data type:

> `data Pair a b = Pair a b`

> is a bifunctor. For additional credit implement all three methods of `Bifunctor` and use equational reasoning to show that these definitions are compatible with the default implementations whenever they can be applied.

### 8.2. Show the isomorphism between the standard definition of `Maybe` and this desugaring:

> `type Maybe' a = Either (Const () a) (Identity a)`

> Hint: Define two mappings between the two implementations. For additional credit, show that they are the inverse of each other using equational reasoning.

### 8.3. Let's try another data structure. I call it a `PreList` because it’s a precursor to a `List`. It replaces recursion with a type parameter `b`.

> `data PreList a b = Nil | Cons a b`

> You could recover our earlier definition of a `List` by recursively applying `PreList` to itself (we’ll see how it’s done when we talk about fixed points).

> Show that `PreList` is an instance of `Bifunctor`.

### 8.4. Show that the following data types define bifunctors in `a` and `b`:

> `data K2 c a b = K2 c`

> `data Fst a b = Fst a`

> `data Snd a b = Snd b`

> For additional credit, check your solutions agains Conor McBride’s paper [Clowns to the Left of me, Jokers to the Right](http://strictlypositive.org/CJ.pdf).

### 8.5. Define a bifunctor in a language other than Haskell. Implement `bimap` for a generic pair in that language.

### 8.6. Should `std::map` be considered a bifunctor or a profunctor in the two template arguments `Key` and `T`? How would you redesign this data type to make it so?