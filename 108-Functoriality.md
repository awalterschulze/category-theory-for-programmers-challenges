# Category Theory for Programmers Challenges

## 8. Functoriality

### 8.1. Show that the data type:

> `data Pair a b = Pair a b`

> is a bifunctor. For additional credit implement all three methods of `Bifunctor` and use equational reasoning to show that these definitions are compatible with the default implementations whenever they can be applied.

Quoted from the text:

> If you have a mapping from a pair of categories to a third category, and you prove that it is functorial in each argument separately (i.e., keeping the other argument constant), then the mapping is automatically a bifunctor.

If we keep `a` constant then we get:

```haskell
instance Functor (Pair a) where
    fmap f (Pair a b) = Pair a (f b)
```

Now we need to check that it preserves identity `fmap id = id`:

```haskell
fmap id (Pair a b)
= -- definition of fmap
Pair a (id b)
= -- definition of id
Pair a b
= -- definition of id
id (Pair a b)
```

We also need to check that it preserves composition: `fmap (g . f) = fmap g . fmap f`:

```haskell
fmap (g . f) (Pair a b)
= -- definition of fmap
Pair a ((g . f) b)
= -- function application
Pair a (g (f b))
= -- definition of fmap
fmap g (Pair a (f b))
= -- definition of fmap
fmap g (fmap f (Pair a b))
= -- definition of composition
(fmap g . fmap f) (Pair a b)
```

We can do exactly the same type of proof by fixing `b`.

```haskell
instance Functor (`Pair` b) where
    fmap f (Pair a b) = Pair (f a) b
```

First we need to check that it preserves identity `fmap id = id`:

```haskell
fmap id (Pair a b)
= -- definition of fmap
Pair (id a) b
= -- definition of id
Pair a b
= -- definition of id
id (Pair a b)
```

We also need to check that it preserves composition: `fmap (g . f) = fmap g . fmap f`:

```haskell
fmap (g . f) (Pair a b)
= -- definition of fmap
Pair ((g . f) a) b 
= -- function application
Pair (g (f a)) b
= -- definition of fmap
fmap g (Pair (f a) b)
= -- definition of fmap
fmap g (fmap f (Pair a b))
= -- definition of composition
(fmap g . fmap f) (Pair a b)
```

Here is an implementation of all three methods of `Bifunctor` for `Pair`.

```haskell
instance Bifunctor Pair where
    bimap f g (Pair x y) = Pair (f x) (g y)
    first f (Pair x y) = Pair (f x) g
    second g (Pair x y) = Pair x (g y)
```

We can now use equational reasoning to show that these definitions are compatible with the default implementations:

```haskell
class Bifunctor f where
    bimap :: (a -> c) -> (b -> d) -> f a b -> f c d
    bimap g h = first g . second h
    first :: (a -> c) -> f a b -> f c b
    first g = bimap g id
    second :: (b -> d) -> f a b -> f a d
    second = bimap id
```

First bimap:
```haskell
bimap f g (Pair x y)
= -- apply bimap
(first f . second g) (Pair x y)
= -- apply first
((\(Pair x y) -> Pair (f x) y) . second g) (Pair x y)
= -- apply second
((\(Pair x y) -> Pair (f x) y) . (\(Pair x y) -> Pair x (g y))) (Pair x y)
= -- function application
(\(Pair x y) -> Pair (f x) y) Pair x (g y)
= -- function application
Pair (f x) (g y)
```

Next first:
```haskell
first f (Pair x y)
= -- apply first
bimap f id (Pair x y)
= -- apply bimap
Pair (f x) (id y)
= -- identity
Pair (f x) y
```

Lastly second:
```haskell
second g (Pair x y)
= -- apply second
bimap id g (Pair x y)
= -- apply bimap
Pair (id x) (g y)
= -- identity
Pair x (g y)
```


### 8.2. Show the isomorphism between the standard definition of `Maybe` and this desugaring:

> `type Maybe' a = Either (Const () a) (Identity a)`

> Hint: Define two mappings between the two implementations. For additional credit, show that they are the inverse of each other using equational reasoning.

TODO

### 8.3. Let's try another data structure. I call it a `PreList` because it’s a precursor to a `List`. It replaces recursion with a type parameter `b`.

> `data PreList a b = Nil | Cons a b`

> You could recover our earlier definition of a `List` by recursively applying `PreList` to itself (we’ll see how it’s done when we talk about fixed points).

> Show that `PreList` is an instance of `Bifunctor`.

TODO

### 8.4. Show that the following data types define bifunctors in `a` and `b`:

> `data K2 c a b = K2 c`

> `data Fst a b = Fst a`

> `data Snd a b = Snd b`

> For additional credit, check your solutions agains Conor McBride’s paper [Clowns to the Left of me, Jokers to the Right](http://strictlypositive.org/CJ.pdf).

TODO

### 8.5. Define a bifunctor in a language other than Haskell. Implement `bimap` for a generic pair in that language.

TODO

### 8.6. Should `std::map` be considered a bifunctor or a profunctor in the two template arguments `Key` and `T`? How would you redesign this data type to make it so?

TODO