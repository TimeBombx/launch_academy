In your Ruby travels, you might have seen syntax like this:

```ruby
:name
```

These are known as **symbols**. Though they share commmonalities with the `String`,
symbols are a different type of object entirely.

We use symbols as a means to identify unique sequences of characters.
Consider the following Array that represents the typical clubs in a golf bag.

```ruby
golf_bag = [
  :three_iron,
  :four_iron,
  :five_iron,
  :six_iron,
  :seven_iron,
  :eight_iron,
  :nine_iron,
  :pitching_wedge,
  :driver,
  :three_wood,
  :five_wood
]
```

Even if you're not an avid golfer, the code above articulates the contents of a an average golf bag.

We could represent adding additional clubs to the golf bag using the "shovel" (`<<`) operator:

```ruby
golf_bag << :putter
```

So, symbols are just another grammatical tool we can use when designing our programs.
Let's experiment with symbols and explore their nuances in further detail.

Open a Pry session (`pry`, or `irb`) and try the following:

```ruby
:name.class
```

You'll see that `Symbol` instances have their own class, and therefore have different [behaviors](http://ruby-doc.org/core-2.3.0/Symbol.html)

```ruby
:name == 'name'
```

Given this returns `false`, you can see that string values are not equal to their symbolic counterparts.

```ruby
:name + :another_symbol
```

This should raise a `NoMethodError`. Because symbols cannot be changed, we cannot manipulate them in this way.

## Like Strings, But Different

Put in its simplest terms, symbols are similar to strings, but they are not strings.
In this section, we'll explore how they are different.

### Symbols Can't Be Changed

Once symbols are declared, they cannot be modified. Recall how we can change, or mutate, an existing string.

```ruby
some_variable = "boo"
#changes the value of some_variable
some_variable.upcase!
```

The example above changes the value of `some_variable`. The `upcase!` method will modify a string so that each letter is capitalized.

Notice that the same method is *not* available for `Symbol` instances.

```ruby
some_variable = :boo
#raises NoMethodError
some_variable.upcase!
```

The code above results in a `NoMethodError`, because Ruby does not allow us to modify symbols.

In fancy Computer Science terms, we say that symbols are **immutable**.
All this means is that they cannot be changed.

### Symbols Generally Are Underscored

When a symbol represents a multiword string, we typically separate the words with an underscore. (Note that Ruby variable naming follows this convention as well!)
Consider the following, incorrect example.

```ruby
#causes a syntax error
:nine iron
```

In the code above, the Ruby interpreter thinks we're representing the symbol `:nine` and then a variable `iron`.
In order to represent a multiword symbol, we can use the underscore.

```ruby
:nine_iron
```

### Symbols Are Constant and Exist Only Once In Memory

In our [variables article](https://learn.launchacademy.com/lessons/variables), we briefly explored how variables are stored in the memory of a computer system.

Open up a pry session and invoke the following, identical lines:

```ruby
'a string'.object_id
'a string'.object_id
```

Though these strings are equal, they have different object ids.
This is Ruby's way of telling us that they exist in two different memory places, or addresses. Therefore, they are two distinct things to our computer.

Now, try the same thing with an identical symbol:

```ruby
:a_symbol.object_id
:a_symbol.object_id
```

Equivalent symbols always exist in the same memory space, because they are *always* the same object!
For this reason, symbols provide many speed and memory related performance benefits.

To drive home this point, imagine a street of vacant houses.
Every time we create a new string, we have to place each string in one of the homes on that street.
Eventually, if we're not careful, all of the houses will become occupied and
there will be no more room for the strings we create.
Even if the strings are identical, we still need to find a new home for each instance.
If we're using symbols, each unique symbol will only occupy one home,
making for more efficient use of the real estate.

## Switching From Strings to Symbols

Sometimes, we do want to perform type coercion on symbols. To continue with our golf example:

```ruby
golf_bag = [
  :three_iron,
  :four_iron,
  :five_iron,
  :six_iron,
  :seven_iron,
  :eight_iron,
  :nine_iron,
  :pitching_wedge,
  :driver,
  :three_wood,
  :five_wood
]

amateur_golf_selection = golf_bag.sample
puts "I will hit the ball with my #{amateur_golf_selection}"
```

We can use standard **string interpolation** to change a symbol to a string.
Alternatively, we can call `to_s` on the symbol.

```ruby
:nine_iron.to_s
```

## These Are Confusing. Why do They Exist?

### Symbols are Faster

Internally, the interpreter interprets the symbol as a number, whereas strings are interpreted as strings.
Computers are generally better at keeping track of numbers as opposed to strings, so symbols take advantage of this fact.

### Symbols are Memory Efficient

We can use symbols to conserve memory usage.
Because there will only be one instance of any symbol at runtime,
we avoid having to duplicate the same values in different memory address.

When we have a need to compare strings that will never change for the life of our programs, symbols provide the best, most performant option.
