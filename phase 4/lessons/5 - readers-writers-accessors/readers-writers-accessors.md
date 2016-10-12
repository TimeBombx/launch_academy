# Readers, Writers & Accessors

### Learning Objectives
- `attr_reader`, `attr_writer`, `attr_accessor` methods, how they work, and what they are used for.
- How they correlate to __getters__ and __setters__.
- Why they are preferred over manually defining __getter__ and __setter__ methods.

Let's say we're writing an application that requires a `Person` class. We might write that class like this:

```ruby
class Person
  def initialize(name)
    @name = name
  end

  def greet
    puts "Hi there, #{@name}!"
  end

  def part_ways
    puts "Bye now, #{@name}!"
  end

  def address=(address)
    @address = address
  end

  def address
    @address
  end
end
```

In the `Person` example above, there is a __setter__ method and a __getter__ method for the attribute `address`.

Now we can set and get `address`:

```ruby
person = Person.new("Luigi")
person.address = "123 Mushroom Kingdom Drive"
person.address #=> "123 Mushroom Kingdom Drive"
```

Now let's say we added a few more attributes to our `Person` class. We want a __getter__ on the `name` attribute, and we want both __setters__ and __getters__ on the `address`, `favorite_food`, `phone_number`, `age`, and `current_hunger_level` attributes.

Writing everything out, our `Person` class would look like this:

```ruby
class Person
  def initialize(name)
    @name = name
  end

  def greet
    puts "Hi there, #{@name}!"
  end

  def part_ways
    puts "Bye now, #{@name}!"
  end

  def name
    @name
  end

  def address=(address)
    @address = address
  end

  def address
    @address
  end

  def favorite_food=(favorite_food)
    @favorite_food = favorite_food
  end

  def favorite_food
    @favorite_food
  end

  def phone_number=(phone_number)
    @phone_number = phone_number
  end

  def phone_number
    @phone_number
  end

  def age=(age)
    @age = age
  end

  def age
    @age
  end

  def current_hunger_level=(current_hunger_level)
    @current_hunger_level = current_hunger_level
  end

  def current_hunger_level
    @current_hunger_level
  end
end
```

But in practice, you don't often see classes cluttered with lists of setters and getters. Why is that?

Well, the Ruby language has anticipated that having setters and getters for instance variables might be quite common, and it could get *repetitive* and cumbersome to write it all out.

So instead, Ruby has provided shortcuts for creating setters and getters. The class above could be written out more concisely below:

```ruby
class Person
  attr_reader :name
  attr_accessor :address, :favorite_food, :phone_number, :age, :current_hunger_level

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hi there, #{@name}!"
  end

  def part_ways
    puts "Bye now, #{@name}!"
  end
end

person = Person.new("Mario")
person.favorite_food = "1UP Mushrooms"
person.favorite_food #=> "1UP Mushrooms"
```

The most common shortcuts you will encounter are `attr_reader`, `attr_writer`, and `attr_accessor`. Using `@address` as an example:

`attr_reader` provides a __getter__ for a given attribute, and is equivalent to having the following code in your class:

```ruby
def address
  @address
end
```

`attr_writer` provides a __setter__ for a given attribute, and is equivalent to having the following code in your class:

```ruby
def address=(address)
  @address = address
end
```

`attr_accessor` gives you __both a getter and a setter__ for that attribute, and is equivalent to having the following code in your class:

```ruby
def address
  @address
end

def address=(address)
  @address = address
end
```

In the above `Person` example, notice that only a getter method is defined for the `name` attribute.

```ruby
person.name #=> "Mario"
person.name = "Peach" #=> NoMethodError: undefined method `name=' for #<Person:0x007fd6a444cb90>
```

When we try and set the `name` however, we get an error. This is the expected behavior, since a __setter__ method was never defined for the `name` attribute.
We would have to add `:name` to the `attr_accessor` list in order to get the above code to work.

### Conclusion

The `attr_reader`, `attr_writer`, and `attr_accessor` methods allow us to define
__setter__ and __getter__ methods in a more consise way than writing them out manually.
More importantly, using these methods provides a [DRY](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself),
developer-friendly interface for working with the instance variables within a class.
