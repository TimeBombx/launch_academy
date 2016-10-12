### Changing State In Instance Methods

While including the context of an instance's state when writing our behaviors is
useful, we can make our objects even more powerful by modifying state in our
behaviors. Imagine we were building a system that was used to automate homes.
This system would allow a user to control their lights as well as their
thermostats remotely.

Let's work with a new class that represents an instance of a `Lamp`.

```ruby
  class Lamp
    def initialize
      @powered_on = false
    end

    def on?
      @powered_on
    end
  end
```

While we can check to see if a given lamp is powered on, there is no way for us
to turn it off or on! Let's implement an instance method that changes the state
of our `Lamp` instance.

```ruby
  class Lamp
    def initialize
      @powered_on = false
    end

    def flip_switch!
      @powered_on = !@powered_on
    end

    def on?
      @powered_on
    end
  end
```

Let's open up a pry session and walk through the results of invoking the
`flip_switch!` method.

```no-highlight
pry(main)> living_room_lamp = Lamp.new
=> #<Lamp:0x007fce4a2e8c48 @powered_on=false>
pry(main)> living_room_lamp.on?
=> false
pry(main)> living_room_lamp.flip_switch!
=> true
pry(main)> living_room_lamp.on?
=> true
pry(main)> living_room_lamp.flip_switch!
=> false
pry(main)> living_room_lamp.on?
=> false
```

When we invoke the `flip_switch!` behavior, we change the state of our `Lamp`
instance. In our implementation of the instance method,
we reassign the `@powered_on` value to its opposite. Until we call
`flip_switch!` again on the instance, the `living_room_lamp` instance will
remain on. Each time we call `flip_switch!`, we toggle the lamp between being in
the on state vs. off state.


#### Reading State From the Outside

Notice how we had to first create an `on?` instance method for outside callers
to determine whether a `Lamp` instance was powered on or off.

Given our latest implementation, try the following:

```pry
pry(main)> living_room_lamp = Lamp.new
=> #<Lamp:0x007fce4ab09238 @powered_on=false>
pry(main)> living_room_lamp.powered_on
```

You may be surprised that we encounter an error!

```no-highlight
NoMethodError: undefined method `powered_on' for #<Lamp:0x007fce4ab09238 @powered_on=false>
```

While we have stored the state of whether a given `Lamp` is `powered_on` via the
instance variable, the instance variable itself cannot be accessed from outside
of the instance! In order for an outside caller to know whether a given `Lamp` is on
or off, we had to define an `on?` method that returns true or false based on
the instance variable.

As the developers that define the class, we must decide what information we want
to expose to outside callers vs. what information we want to keep internally.

For example, consider the idea of a `GuessingGame`, where users can attempt to
guess a number between 1 and 10.

```ruby
class GuessingGame
  def initialize
    @correct_number = rand(1..10)
  end

  def guess(num)
    if num == @correct_number
      "You guessed the correct number!"
    else
      "Nope! Try again."
    end
  end
end

game = GuessingGame.new
puts game.guess(5)
```

The `@correct_number` is not something we want to expose to outside callers,
because guessing is core to the metaphor of the game. If we expose this
information to outside callers, users and developers may find a way to cheat.
Instead, we keep that information internal to the class,
and we only expose the behavior that allows a user to guess the random number.

Likewise, as we've designed it, the `@correct_number` value will not change for the life of the
object. That way, users and developers cannot reset the number to one that they
already know. If they wish to play again, we can simply just create a new
`GuessingGame` instance. In Computer Science, we use the fancy term
**immutable** to describe something that cannot change. Here, we've designed our
GuessingGame's `@correct_number` to be immutable. The value cannot change for
the life of each instance.

These are critical considerations when designing your classes.
As the developer, you must decide what information you want to expose
for both reading and writing.

To add another example, consider the following metaphor for a `BankAccount`.

```ruby
class BankAccount
  def initialize
    @balance = 0
  end

  def balance
    @balance
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end
end
```

It makes sense that we would want to allow an outside caller to check the
`BankAccount` balance. By defining a `balance` instance method, we expose
that value to outside callers. This `balance` method is called a **getter**,
because it directly returns the value of the instance variable. Creating this
instance method makes the `@balance` state available to the outside world.

We would not, however, want to allow an outside caller to
arbitrarily reassign the `BankAccount`'s balance! To maintain our metaphor and
to disallow hackers from setting their bank balances to [one million
dollars][one-million-dollars], we only allow the `@balance` state to be
modified through the `deposit` and `withdraw` instance methods.

### Setting State From the Outside

Sometimes, it important to allow outside callers to directly set state inside
your instances. If we return to our `Person` metaphor, it makes sense that a
`Person` instance would change addresses from time to time. Moving is an
unfortunate aspect to life, and so it must be in our programs! Fortunately,
defining a **setter** instance method isn't as painful as packing all of your stuff!

```ruby
class Person
  def initialize(name)
    @name = name
  end

  def greet
    "Hi there, #{@name}!"
  end

  def part_ways
    "Bye now, #{@name}!"
  end

  def address=(address)
    @address = address
  end
end

person = Person.new("John")
puts person.greet #=> "Hi there, John!"
puts person.part_ways #=> "Bye now, John!"
```

Let's assign a value to `@address` using our newly defined **setter** method.
This will permanently change the state of our `Person` instance.

```no-highlight
pry(main)> john = Person.new('John')
=> #<Person:0x007fff1c2cc4f0 @name="John">
pry(main)> john.address = '33 Harrison Ave, Boston, MA 02111'
=> "33 Harrison Ave, Boston, MA 02111"
pry(main)> john
=> #<Person:0x007fff1c2cc4f0 @address="33 Harrison Ave, Boston, MA 02111", @name="John">
```

Notice how assigning a value to `@address` via the `address=` changes how the
`Person` instance is displayed in pry. We have successfully changed the state
of the `john` instance.

What do you think will happen if we attempt to **read** this information from
outside the instance? Try it in pry.

```no-highlight
[5] pry(main)> john.address
NoMethodError: undefined method `address' for #<Person:0x007fff1c2cc4f0>
```

If you guessed that we must also define a **getter** for us to read that
information from outside the instance, you guessed correctly!

Below you will find the more complete class definition.

```ruby
class Person
  def initialize(name)
    @name = name
  end

  def greet
    "Hi there, #{@name}!"
  end

  def part_ways
    "Bye now, #{@name}!"
  end

  def address=(address)
    @address = address
  end

  def address
    @address
  end
end
```

Be sure to note that the syntax for setter methods in ruby is the method name
followed by the '=' sign and then the variable name you expect the method to
receive.
