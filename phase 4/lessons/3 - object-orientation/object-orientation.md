# Object Orientation

What code is - and what code looks like - has varied wildly through the years. The problem is, ultimately, one of organization and abstraction.

### Learning Goals

- Understand the differences between Functional and Object-Oriented Programming
- Understand the reasons behind using objects to encapsulate data and behavior

## The (Briefest) History of Programming

### Low Level Languages

The earliest and most direct way of communicating with a computer is through "machine code". Machine code allows us to directly instruct the CPU to perform specific tasks, but this requires intimate knowledge of the inner workings of a CPU. Machine code is considered to be a "low-level" language: one that interacts with the computer at the lowest possible level. With low-level languages, there is very little translation necessary between the language's commands and the instructions that the CPU understands. Unfortunately, as processors are fundamentally different things than people, low-level languages are not human-friendly.

### High Level Languages

In 1941, a German engineer conceptualized (but never created) "Plankalkül", which is credited as being the first "high-level" computer programming language. A "high-level" language is one that does not concern itself with the inner workings of a computer but instead uses more abstract logic, commands, and data forms. It generally communicates with the computer through another program, called a _compiler_, that translates the high-level language into a low-level one.

Plankalkül - and many of the other early high-level languages - still did not resemble what we might think of today as 'code'. They were highly mathematical (borrowing much of their notation and terminology from calculus) and not easily readable by non-mathematical eyes.

This began to change in 1955 with the development of FLOW-MATIC, which was the first language to use English-like statements.

### Imperative Programming

Early code - like the code in FLOW-MATIC - was _imperative_, meaning that the code simply listed commands to be immediately executed in order. When you learn programming, this is generally out of necessity the first pattern you use.

Here's an example of the [Fibonacci sequence][1] written in an imperative style to calculate the 5th number using Ruby.

```ruby
start = 1
puts start

second_num = 0 + start
puts second_num

third_num = start + second_num
puts third_num

fourth_num = second_num + third_num
puts fourth_num

fifth_num = third_num + fourth_num
puts fifth_num

# Output:
# 1
# 1
# 2
# 3
# 5
```

Each line reads very clearly and descriptively, and the code makes sense reading from top to bottom. The problem, however, is repetition: imagine having to write this out to the tenth number, or the fiftieth, or the two-thousandth.

Not only would this get tedious, but the code itself is repetitive. The fundamental logic of the Fibonacci sequence - creating the next number in the sequence by summing the previous two - is repeated every single time for each new number. Even though each new variable stores a new number, we have to write the same logic and behavior over and over and over again - if we were to make a mistake on one of the lines, we might not even know until we run the program and carefully study the output.

### Functional Programming

A foundational leap forward for software design was the introduction of _functional programming_ as a popular pattern. Functional programming was named so after it's key idea: functions!

#### Codifying Logic

Functions are a way of codifying behavior - we can take repeatable logic and tasks and assign them a name. We can then _call_ that name to perform the behavior, as often as we like without having to rewrite the logic. And much like how we could have made the imperative Fibonacci above more _dynamic_ (the behavior changes based on context) by accepting user input, functions can become dynamic by accepting external information via _arguments_.

If we wanted to write a function in Ruby to codify the logic of the Fibonacci sequence, it might look like this:

```ruby
def fibonacci(n)
  second_to_last_num = 0
  last_num = 1
  current_num = 0

  numbers = []
  numbers << current_num

  n.times do
    second_to_last_num = last_num
    last_num = current_num
    current_num = second_to_last_num + last_num
    numbers << current_num
  end
  numbers
end

puts fibonacci(3)

# Output:
# 0
# 1
# 1
# 2

puts fibonacci(7)

# Output:
# 0
# 1
# 1
# 2
# 3
# 5
# 8
# 13
```

This function encapsulates the logic of Fibonacci, and we can use it to get any Fibonacci number we'd like without rewriting any of the code!

#### Stateless Functions

Notice, though, that the data that we want to use (the `3` and the `7`) are separate from the function - they have to be passed in. This is, in fact, one of the strongest benefits of functional programming. Our functions can be **stateless** - they do not rely on internal data, they instead only represent logic. Any data we pass in can be used and acted upon but still remain unchanged.

There are a lot of reasons that a programmer might desire a stateless solution to a problem, and many languages in use today are written using a functional style. In some situations, however, our _data_ becomes more greatly intertwined with _behavior_ (the functions). In cases like this, much like how we package related bits of logic into functions, it increasingly makes sense to package interrelated data and behavior **together**.

### Object Oriented Programming

Object Oriented Programming (or OOP) is one of the most popular patterns that modern programmers use to package data and behavior together into logical pieces. _Objects_ can thus contain both **state** (data) and **behavior** (functions).

We defined a function above to calculate the Fibonacci number at any point in the sequence. It made sense to define this as a freestanding function - it can be used with any (positive) number, it doesn't rely on any other logic, and it isn't inherently related to any external piece of data. We _want_ to be able to pass anything into it freely.

What if we were writing code for something a little more complicated, like a spaceship?

#### Functions and Data in Space

Let's store specific data, like the ship's name and captain. Additionally, we want the ship to (presumably) be able to announce who its captain is as well as launch into orbit.

We could accomplish this functionally like so:

```ruby
def captains_announcement(ship, captain)
  "#{ship} will be captained by #{captain} for the flight."
end

def launch_ship(ship)
  "#{ship} has launched into orbit!"
end

ship_name = "Serenity"
ship_captain = "Malcolm Reynolds"

puts captains_announcement(ship_name, ship_captain)
puts launch_ship(ship_name)
```

... which would give the following output:

```no-highlight
Serenity will be captained by Malcolm Reynolds for the flight.
Serenity has launched into orbit!
```

This totally works, and functionally (for the computer) it's also totally fine. The variable naming alone, however, indicates that the data all belongs to a single thing - the same spaceship. We can rewrite this to be more explicit that all the data belong together:

```ruby
def captains_announcement(ship, captain)
  "#{ship} will be captained by #{captain} for the flight."
end

def launch_ship(ship)
  "#{ship} has launched into orbit!"
end

ship = {
  name: "Serenity",
  captain: "Malcolm Reynolds"
}

puts captains_announcement(ship[:name], ship[:captain])
puts launch_ship(ship[:name])
```

This gives us the same output as the previous code, but the data is grouped together into a single hash that represents **the state of** the ship. A little more logical - and manageable, right?

### Getting Closer

But look at those functions that require a bunch of stuff to be passed into them! They are intimately dependent on the state of a ship - one requires knowing the name, while the other wants both the name and the captain.

And what if we wanted to add the amount of fuel to the spaceship, as well as make `launch_ship` dependent on that?

```ruby
def captains_announcement(ship, captain)
  "#{ship} will be captained by #{captain} for the flight."
end

def launch_ship(ship, fuel)
  if fuel > 50
    "#{ship} has launched into orbit!"
  elsif fuel > 25
    "It was a little touch and go at first, but #{ship} managed to make it into orbit!"
  else
    "#{ship} struggled to take flight and promptly crashed back down to the surface."
  end
end

ship = {
  name: "Serenity",
  captain: "Malcolm Reynolds",
  fuel: 15
}

puts captains_announcement(ship[:name], ship[:captain])
puts launch_ship(ship[:name], ship[:fuel])
```

... would give the following output:

```no-highlight
Serenity will be captained by Malcolm Reynolds for the flight.
Serenity struggled to take flight and promptly crashed back down to the surface.
```

Both of our functions now depend on several pieces of information about the ship.
See how tightly state and behavior can get tied together?
These functions are starting to make sense _only in relation to_ the state of an increasingly complicated hash of information.

How might we better handle the increasing complexity of passing data to and between different functions? Enter **classes**!

## Class

A `class` represents an object that can have state and behavior, and while the terminology and setup might look a little odd, they can provide us with much cleaner ways of interacting with state and behavior than we were able to above.

### Objects in Space

What would a class-based version of our above code look like? Let's don some spacesuits, jump out into [the Verse][2], and take a look at our "brand new" Firefly, this time as a `Spaceship` object!

```ruby
class Spaceship
  def initialize(name, captain, fuel)
    @name = name
    @captain = captain
    @fuel = fuel
  end

  def captains_announcement
    "#{@name} will be captained by #{@captain} for the flight."
  end

  def launch
    if @fuel > 50
      "#{@name} has launched into orbit!"
    elsif @fuel > 25
      "It was a little touch and go at first, but #{@name} managed to make it into orbit!"
    else
      "#{@name} struggled to take flight and promptly crashed back down to the surface."
    end
  end
end

ship = Spaceship.new("Serenity", "Malcolm Reynolds", 45)

puts ship.captains_announcement
puts ship.launch
```

There is a *lot* going on there, so let's take it piece by piece.

### Our "New" Ship

```ruby
class Spaceship
  def initialize(...)
    ...
  end

  ...
end

ship = Spaceship.new(...)

...
```

We start by defining a `class`, which in many ways is like creating a _template_ (or blueprint) for any new objects of that class that we create.
Classes all have a default **constructor** function, which Ruby calls `.new`.
Calling `Spaceship.new` creates an _instance_ of the `Spaceship` class as well as _initializes_ it.

### Initialization

**"Initialization"** in this context is just setting up the **state** of the new instance - we pass data into the `.new` constructor, will then call `initialize`.
The `initialize` method allows us take the data and assign it to **instance variables** (anything with an `@` at the beginning of the variable name).

```ruby
class Spaceship
  def initialize(name, captain, fuel)
    @name = name
    @captain = captain
    @fuel = fuel
  end

  ...
```

Instance variables are different from the normal variables that we're used to.
When we define regular variables within a function, like...

```ruby
def fibonacci(n)
  second_to_last_num = 0
  last_num = 1
  current_num = 0

  ...
end
```

... those variables are only accessible _within_ the function.
(Their scope is _local_ to the function.)

When we use instance variables, those variables become local to the _instance of the class itself_, meaning that we can use them anywhere inside the object - including inside other functions, without having to pass them around!

### Method(s) to the Madness

We've been using the word _function_ this whole time, but many languages (including Ruby) generally use the term **method** to refer to a function that's defined on an object.

> Many Rubyists will even say that every function in Ruby is technically a method, but we won't get into the details here. Just keep in mind that when we're talking about functions for objects, we'll refer to them as _methods_ from now on - `initialize` is a _method_, not just a function.

Our class has several methods beyond `initialize`, too, including `.captains_announcement` and `.launch`.
We defined these on `Spaceship` because we decided they all represent behavior that _belongs to_ our ship.

#### Calling All Methods

Perhaps one of the greatest benefits to classes is _encapsulation_. Once we initialize an instance with a given state, we can provide an _interface_ for that state (through methods), and anyone who uses our class doesn't have to care about what's happening under the hood. For instance, the difference between...

```ruby
ship = {
  name: "Serenity",
  captain: "Malcolm Reynolds",
  fuel: 15
}

captains_announcement(ship[:name], ship[:captain])
launch_ship(ship[:name], ship[:fuel])
```

... and...

```ruby
ship = Spaceship.new("Serenity", "Malcolm Reynolds", 45)

ship.captains_announcement
ship.launch
```

... is rather striking, isn't it?

We decide internally what information `launch` and `captains_announcement` depend on, and anyone using our `Spaceship` class need only care about the state to start with and the name of the methods to use.

## Summary

**Object Oriented Programming** is an incredibly popular and powerful programming pattern that allows us to write large, complex programs.
Objects **encapsulate** data and logic that are fundamentally intertwined, which helps us write much better organized, and much more understandable, code.

We have had quite a journey through a (brief) history of different programming patterns...

- Imperative - declarative statements executed line by line
- Functional - storing related bits of logic into repeatable units
- Class-based - storing related data and behavior together into objects

... and we've explored different ways of storing data...

- Variables _outside_ of classes
- The state _inside_ a class, via instance variables

... as well as storing logic.

- Functions outside of classes
- Methods defined on classes

In further readings, we will explore:

- Breaking complex systems down into classes
- Interactions between classes
- Exposing a class's state to the outside world
- Passing arguments into methods

[1]: https://en.wikipedia.org/wiki/Fibonacci_number
[2]: http://firefly.wikia.com/wiki/The_Verse
