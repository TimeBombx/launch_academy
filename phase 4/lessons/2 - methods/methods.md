### Introduction

It's time to talk methods! Methods are little collections of reusable code. They allow us to repeat actions or sets of actions, and make writing flexible and modular programs a whole lot easier.

### Learning Goals

* Understand what a method is and when one is used
* Explore the structure of a method
* Recognize and use a method that takes parameters
* Define a method that takes optional parameters

#### Methods

When we first studied Ruby, we discussed the basics of object-oriented grammar. We thought about objects as nouns, and methods as verbs.

In the next few units, we will explore how to create **our own** verbs, or methods. Making our very own methods will give our code **behaviors** which we can call at will.

Methods are used when a repetitive pattern of behavior is noted in a program.

Take, for example, a case where we are validating that a user enters a name.

```ruby
puts "Give me the name of a person, now!"
name = gets.chomp
while name == ''
  puts "You did not specify a name"
  puts "Give me the name of a person now!"
  name = gets.chomp
end

puts "Hi #{name}!"
```

Let's imagine that this code is being used in an application, and user feedback shows that you should be more polite in requesting a user's name.

So, you go back into the code and make the necessary adjustment.

```ruby
puts "Please share the person's name:"
name = gets.chomp
while name == ''
  puts "You did not specify a name"
  puts "Give me the name of a person!"
  name = gets.chomp
end

puts "Hi #{name}!"
```

Uh oh! Notice what has happened here? We've only updated one instance of the prompt for a person's name, because we forgot that we have the same line of code twice in this program. We've only fixed half of the problem.

This code suffers from repetition. We code the same prompt or `puts` statement twice,
resulting in two lines that do the exact same thing. Although this is a simple example, there could be cases in a more complex program where asking for a name is repeated many more times. Having to fix the text used to request a name in ten places is inefficient, and we're likely to accidentally miss one of the uses of it when returning to our code, as in the above example.

The solution to this kind of problem is a common programming principle, commonly referred to as keeping code **DRY**, which stands for **D**on't **R**epeat **Y**ourself.

Let's refactor the original example with the use of our own method.

```ruby
def solicit_name
  puts "Please share the person's name:"
end

solicit_name
name = gets.chomp
while name == ''
  puts "You did not specify a name"
  solicit_name
  name = gets.chomp
end

puts "Hi #{name}!"
```

In the example above, we've eliminated the duplication where we ask for the person's name through the use of our own **method**. Now we only have to change the text requesting someone's name in one place, and everywhere that method is used, the new text will appear.

Notice that we name our methods in the same way that we name our variables.
In this example, the method is named `solicit_name`, which is all lowercase with underscores separating each word.

Let's dig a little into the syntax used to create our method. By utilizing the `def` keyword, we are informing the Ruby interpreter that we wish to **def**ine a new method. Everything between the line starting with `def` and its correlating `end` constitutes the method's **body**. This is the code that will be invoked when we call the method `solicit_name`. In this example, we call the `solicit_name` method twice: once at the very beginning of our program and then again inside the loop.

It is important to note that we must **invoke** the method for the code inside the body to be run. In other words, our methods will wait patiently to run in our programs until we call them by name. Anything inside a `def method_name...end` block will not run unless we actually call `method_name` explicitly. If we didn't put `solicit_name` anywhere in our program, the method would be defined, but would never do anything, because we didn't ask it to help us out.

Open up a pry session (similar to `irb`; type `pry` in your terminal and hit return) and try the following:

```no-highlight
pry(main)> def say_hello
pry(main)*   puts "hello from a method"
pry(main)* end
=> :say_hello
```

Notice how as we type each line of the method definition,
pry is waiting for us to utilize an `end` informing the interpreter that we are done defining the method.
Also, notice that we never see the output `"Hello from a method"` in our pry session. In order for the method body to be run, we must call the method explicitly.

```no-highlight
pry(main)> def say_hello
pry(main)*   puts "hello from a method"
pry(main)* end
=> :say_hello
pry(main)> say_hello
hello from a method
=> nil
pry(main)>
```

Why does `nil` appear?

```ruby
puts "the puts method returns nil"
```

In the case of the `puts` method, `nil` is the **return value**, or result, of calling it. Every method has a return value in Ruby.

### Return Values

To explain the concept of return values, let's return to our request for a person's name.
While we have improved our implementation, you may notice there is still some duplication in our code. Notice that we assign the `name` variable to `gets.chomp` twice.

```ruby
def solicit_name
  puts "Please share the person's name:"
end

solicit_name
name = gets.chomp
while name == ''
  puts "You did not specify a name"
  solicit_name
  name = gets.chomp
end

puts "Hi #{name}!"
```

Think back to the methods that are supplied by the Ruby standard library. You've used many of them to write your programs so far.

```ruby
9.to_s
=> "9"
```

Here, the `to_s` method **returns** the string representation of the number `9`.

We can also see the same concept with the downcase method of the `String` class.

```ruby
"I AM EXCITE".downcase
=> "i am excite"
```

The method `downcase` says in English: "take this string, and provide me a new string that represents all of the same characters in lower case".

If we're saying the same thing in terms of Computer Science: "the `downcase` method returns the lower cased representation of the same string".

Let's look at another example. Believe it or not, the `+` operation is in fact, a method.
In the case of the `Fixnum`, the method **returns** the sum of the two specified numbers.

```ruby
3 + 4
=> 7
```

Let's put this idea of return values to work as we continue to DRY up our code.
Remember that our objective is to eliminate duplication.

```
def solicit_name
  puts "Please share the person's name:"
  return gets.chomp
end

name = solicit_name
while name == ''
  puts "You did not specify a name"
  name = solicit_name
end

puts "Hi #{name}!"
```

In our refactoring above, we've improved our implementation by moving our repetitive `gets.chomp` invocations into the body of our `solicit_name` method. We used the `return` keyword to say that we want to return the input received from the user.

To test this out, let's just take the method and copy it into a pry session.

```no-highlight
pry(main)> def solicit_name
pry(main)*   puts "Please share the person's name:"
pry(main)*   return gets.chomp
pry(main)* end
pry(main)> solicit_name
Please share the person's name:
John
=> "John"
```

The result of `gets.chomp` is sent as the return value of our method.

### The `return` Keyword is Optional

One way that Ruby is different from most other object oriented programming languages is how return values are set. You don't explicitly need the `return` keyword! By default, the interpreter will return the result of the last line executed within the method body. We could have defined `solicit_name` as:

```ruby
def solicit_name
  puts "Please share the person's name:"
  gets.chomp
end
```

It is very important to note, however, that relying on Ruby to _implicitly_ return the value of the last statement executed _only_ works if there are no `return` statements. For instance:

```ruby
def will_not_return_right_name
  puts "Please enter a name to return:"
  return "Harry Potter"
  gets.chomp
end
```

If we called `will_not_return_right_name`, our output would be:

```no-highlight
Please enter a name to return:
=> "Harry Potter"
```

We won't even be prompted to enter a name! Because we explicitly say `return`, even though it's not the last line of the method, Ruby sees that `return` statement, returns the string, and immediately exits out of the function. `gets.chomp` will **never** be executed.

### Returning `nil`

As we saw above, our `def say_hello` example returns `nil` even though we see terminal output created by the method.

```no-highlight
pry(main)> def say_hello
pry(main)*   puts "hello from a method"
pry(main)* end

pry(main)> say_hello
hello from a method
=> nil
```

Because we are not explicitly telling `say_hello` to `return` anything, Ruby takes the return value of the last - and only - statement executed in the method: `puts "hello from a method"`. The return value of `puts` is always `nil`, no matter what we pass into it! Being the last statement, `nil` then becomes the return value of `say_hello`.

If we wanted our `say_hello` method to output the greeting to the console **as well as** return it, we would have to have a statement _after_ `puts` to return the string.

```no-highlight
pry(main)> def say_hello
pry(main)*   puts "hello from a method"
pry(main)*   "hello from a method"
pry(main)* end

pry(main)> say_hello
hello from a method
=> "hello from a method"
```

Or, to use a variable so that we can't accidentally have a typo in one of the strings:

```no-highlight
pry(main)> def say_hello
pry(main)*   greeting = "hello from a method"
pry(main)*   puts greeting
pry(main)*   greeting
pry(main)* end

pry(main)> say_hello
hello from a method
=> "hello from a method"
```

For another example, let's combine `puts`, user input, and string interpolation to return a string describing your favorite ice cream flavor!

```no-highlight
[1] pry(main)> def favorite_ice_cream
[1] pry(main)*   puts "What is your favorite ice cream flavor?"
[1] pry(main)*   favorite_flavor = gets.chomp
[1] pry(main)*   "Wow, #{favorite_flavor} IS delicious!"
[1] pry(main)* end

[2] pry(main)> favorite_ice_cream
What is your favorite ice cream flavor?
Peanut Butter Oreo
=> "Wow, Peanut Butter Oreo IS delicious!"
```

As expected, since we didn't explicitly `return` anything, the return value of `favorite_ice_cream` is a string offering us validation (as if we needed any) for our favorite flavor!

**Side Note:** It is always a good idea to place your `puts` outside of the method _if you can_.
This is not always possible, but it is preferred.
For illustrative purposes, this article does not follow this preference.

In the example below, the return value of the method is what is printed to the console.
This is more preferred:

```ruby
def add_five(number)  
  number + 5
end

# This allows us to do this:
puts add_five(1)
# and this:
result = add_five(1) #=> 6
```

In this example, 6 is printed to the console but `nil` is the return value of the method.
If we wanted to share the result of invoking this method with other parts of our program. This is less preferred:

```ruby
def add_five(number)
  puts number + 5
end

add_five(1)
#=> nil
```

The strategy in the first example makes our method more flexible.
We can _choose_ if the result of adding 5 should be printed to the console, or we can elect not to, all without changing the code in our method.
We can also choose to do this:

```ruby
def add_five(number)
  sum = number + 5
  puts sum
  sum
end
```

This is good solution if we always wanted to print to the console _and_ get a meaningful return value from the method, but we still lack the flexibility illustrated in the first example.

### Arguments and Parameters

Sometimes, methods require the context of other values or variables. We can pass these values in as **arguments** to the methods that we write. In the case of the `include?` method calls above, we're asking the question, in English,
"does the list include the value 4?" and "does the list include the value 3?"

In order to ask this question intelligently, we need an additional piece of information.
In this case, it's the number we are looking for in the list. We would say in a Computer Science context that the `include?` method requires one argument.

We can invoke some other methods with arguments. Let's look at another example:

```ruby
['a', 'b', 'c'].index("b")
=> 1
```

Here, the verb `index` takes the argument `"b"` and checks to see where it is located in the specified array. `"b"` is the single argument we pass to the `index` method.

While Ruby core provides methods that require arguments, we can define our own methods that allow arguments as well.

```ruby
def prompt(user_message)
  puts user_message
  return gets.chomp
end

prompt("Please share the person's name:")
prompt("Please share their age:")
```

Here, we have defined our own method `prompt` that allows us to specify a single argument.
In this case, the argument represents the message that we want to output to the user when we ask them for input. With each invocation, we pass a different string as an argument to the method, changing the values that are evaluated inside the body of the method.

Note that whatever we call the argument in our method definition (in this case, `user_message`) is how we refer to that variable value inside of the method. In other words, it doesn't matter if we called it something else where it originated. For example:

```ruby
name = "Please share the person's name"
age = "Please share their age:"

prompt(name)
prompt(age)
```

Here, we've assigned the strings that are passed into the prompt method to two different variables, `name` and `age`. However, even though they are called `name` or `age` here, once they get inside the `prompt` method, they will be called `user_message`, because that's how the method names the first argument passed to it.

That leads us to another fact about arguments: we can specify multiple arguments to a method.

```ruby
def rectangular_area(height, width)
  return height * width
end
```

Oh no! While we apologize for taking you back to sixth grade algebra, we can use multiple arguments to perform intelligent calculations like we've done above. Thanks to Mrs. Fisher from Junior High, we know that the area of a rectangle is the rectangle's heigh multiplied by its width.

With this method defined, we can calculate the area of multiple rectangles.

```ruby
rectangular_area(3, 4)
=> 12
rectangular_area(5, 5)
=> 25
```

What happens if we specify too many or too few arguments? Let's open up a pry session and find out.

Be sure to define your `rectangular_area` method like we have done above.

```no-highlight
pry(main)> rectangular_area(5)
ArgumentError: wrong number of arguments (1 for 2)
from (pry):8:in `rectangular_area'
```

Here, the Ruby interpreter has enforced a relationship between the method we've defined and how it should be called. If we do not provide the required number of arguments, the interpreter will tell me so.

Likewise, the interpreter will tell me if I specify too many arguments to a previously defined method.

```no-highlight
pry(main)> rectangular_area(5, 6, 7)
ArgumentError: wrong number of arguments (3 for 2)
from (pry):8:in `rectangular_area'
```

When we make use of defined methods, it is important to obey the **contract** that those methods define. If a defined method requires 2 arguments, I must specify 2 arguments; no more, and no less.

### Default Parameters

Life wouldn't be any fun if there weren't exceptions to the rules!

As the writers of our own methods, we can specify how many arguments we wish to require.

Consider the change in our example below:

```ruby
def rectangular_area(width, height = nil)
  if height.nil?
    #assume it is a square
    width * width
  else
    #multiply width * height
    width * height
  end
end
```

I know! We're bringing back all of these traumatic memories of junior high math!
Maybe after you read this article, you can ask [Patti Mayonnaise][patty-imdb] to the [Beets concert][killer-tofu] on Friday.

Seriously, though, remember that in geometry, a square is a rectangle that has an equal width and height. So, in the case of a square, I may not necessarily have to specify both arguments.

Now that we've defined the method, let's try a few examples:

```ruby
rectangular_area(2, 3)
=> 6
rectangular_area(5, 5)
=> 25
rectangular_area(5)
=> 25
```

Notice how our last two examples return the same value!
Based on the body of our method, and the way in which we have written it,
we are saying that in the case of a square, you only have to specify a single argument.

The rectangular_area method takes in two arguments, but the second argument is set to nil by default unless otherwise specified. This allows our function to have a check as to whether or not that second argument, `height`, is set to its default, `nil`, or specified as another value.

### Bringing it Home

Consider the non-DRY example below:

```ruby
puts "Give me the name of a person!"
name = gets.chomp

puts "What is the age of that person?"
age = gets.chomp.to_i

puts "#{name} will be #{age + 1} years old next year."
```

Notice how we're basically doing the same thing over and over?

```no-highlight
1. Get the name of a person
2. Get the age of that person
3. Calculate that person's age in a year and print it out to the screen.
```

What can we do about the repetitive code? We can *extract* it out into a method!

This is what a ruby method looks like. It has naming convention similar to variables (lower case letters, underscores allowed):

```ruby
def method_name(raw_material)
  #input is used to do some kind of calculation here to determine output
  return finished_product
end
```

What this says is the following: when I call the method `method_name` and pass an `raw_material` to it as an **argument**,
I get **returned** a `finished_product` of that method.

```no-highlight
1. The method takes an argument, or raw material.
2. The raw material is used in the body of the method to derive a finished product.
3. The method returns the finished product.
```

Hmm, methods kind of sound like little factories!

#### Methods are Also Like Factories

![alt](https://s3.amazonaws.com/horizon-production/images/nightshift-at-the-factory-factory.jpg)

So far we've mostly thought about methods as verbs. Another metaphor for understanding the work methods do is to think of them as factories.

A factory takes some kind of raw material or set of raw materials in,
manipulates them and produces some other kind of finished product on the other end.
Consider, for a moment, the birthplace of mass production! When the [Ford Model T][model-t]
arrived on the scene, Henry Ford revolutionized manufacturing by creating a [repeatable and
efficient process][mass-production] for producing automobiles.

Think of your methods like a Model T factory. Your arguments are the rubber, glass, paint, and engine parts,
the body of your method is the routine that puts it all together, and the return value is a spanking new, beautiful car!

We can change the paint color and customize the result based on the raw materials we pass in, but the end result is similar every time.
In the same way, while a manager or even a customer may not know the processes involved to produce the car,
they know at a high level what must be supplied to manufacture it.
So, the internals of the factory can change, but we still expect the same result: a well built and manufactured vehicle!
It is through the definition of our own factories or methods that we can begin to express ourselves a little more clearly through code.
It also provides us with the flexibility to rewrite some internals without massively impacting how our code looks or even behaves.

[patty-imdb]: http://doug.wikia.com/wiki/Patti_Mayonnaise
[killer-tofu]: https://www.youtube.com/watch?v=p7c3bQQmwVE
[model-t]: http://en.wikipedia.org/wiki/Ford_Model_T
[mass-production]: http://en.wikipedia.org/wiki/Mass_production

#### Remember the Rule of DRY (or Don't Repeat Yourself)

![Less Code Matters](https://s3.amazonaws.com/horizon-production/images/dry.png)

Not repeating code is an important part of being a programmer.
After all, who wants to see the same code over and over again? As programmers, we're creating a new world of robots that do everything:

![Let a Robot Do the Work](https://s3.amazonaws.com/horizon-production/images/forex-robots.png)

Methods allow us to actualize the idea of keeping things *DRY*.
What this means is that any code that gets repeated over and over should get *abstracted* and turned into a method.
In our example above where we asked for a name over and over again,
we *abstracted* that bit of code into smaller methods that let us do the whole thing only once.

As writers *edit*, programmers *refactor*. As you are writing code, think about what can be moved into methods and
what can't to allow for good refactoring. Whenever you see repetition, there is usually an opportunity to make your code DRY through the use of methods!
