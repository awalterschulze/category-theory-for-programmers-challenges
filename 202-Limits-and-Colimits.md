# Category Theory for Programmers Challenges

## 12. Limit and Colimits

### Background: Naturality Condition

If we have two functors `F` and `G` then:

```
f :: a -> b
F f :: F a -> F b
G f :: G a -> G b
```

The two natural transformations would be:

```
alpha_a :: F a -> G a
alpha_b :: F b -> G b
```

The naturalarity condition states that:

```
G f . alpha_a = alpha_b . F f
```

### 12.1. How would you describe a pushout in the category of C++ classes?

**TODO**

### 12.2. Show that the limit of the identity functor `Id :: C -> C` is the initial object.

The initial object in the category set is the empty set and the terminal object is the singleton set.

**TODO**

### 12.3. Subsets of a given set form a category. A morphism in that category is defined to be an arrow connecting two sets if the first is the subset of the second. What is a pullback of two sets in such a category? What’s a pushout? What are the initial and terminal objects?

**TODO**

### 12.4. Can you guess what a coequalizer is?

**TODO**

### 12.5. Show that, in a category with a terminal object, a pullback towards the terminal object is a product.

**TODO**

### 12.6. Similarly, show that a pushout from an initial object (if one exists) is the coproduct.

**TODO**