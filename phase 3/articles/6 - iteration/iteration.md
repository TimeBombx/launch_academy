## Iteration

With a basic data structure like an array, we might want to sum up all the values of an array.
Maybe we want to modify all the values of a hash.
Perhaps we want to extract each nested value of a compound data structures.
Ruby provides some excellent methods that allow us to parse through
these kinds of data structures to extract exactly what we need.

We call doing a repeated action like this on each element within a data structure *iteration*.
We can *iterate* over an array to print out all the array's values.
We can *iterate* over an array to sum up all the values in that array.
We can *iterate* over an array to sum up all the squares of the values of an array.

Similarly, we can *iterate* over a hash to print out all the values of the keys. 
We can *iterate* over a hash to print out each of the key-value pairs in a specific type of format.
We can *iterate* over a hash to change the each of the values of the hash.

Sounds pretty convenient, right? It is.

So what do these iteration methods look like?

You might have come across [looping](http://www.ruby-doc.org/docs/Tutorial/part_02/loops.html)
methods like [**for**](http://www.dotnetperls.com/while-ruby),
[**while**](http://www.ruby-doc.org/docs/Tutorial/part_02/while.html),
or [**until**](http://www.dotnetperls.com/while-ruby) in your reading.
These are built in methods that allow us to do repeated tasks over a set period of time or
number of iterations or until some criteria is hit.
Every language has their own way to iterate through a given data structure.
Ruby, in particular, has a large suite of iterators, which allows for incredibly short and elegant code.
Take a look at the [Enumerable](http://ruby-doc.org/core-2.2.0/Enumerable.html) docs for a
list of these methods available to you as a Rubyist. We will cover a handful of them here.

### `.each`

`.each` is a method that traverses a data structure (like an array or a hash) and does something (based on a block of code) to each object. Let's take a look at a simple implementation of `.each` with an array.

### Arrays

```ruby
["This", "sentence", "is", "words", "in", "order"].each do |word|
  puts word
end
```

Here, we have an array of words that we're traversing to print out each word. The `block` of code that is getting run is `puts word`.
The key thing to understand here is the relationship between `.each` and what goes between the two `|`,
or in this case, `word`. In English, what this Ruby code reads as would be something like the following:

`For each word in the array ["This", "sentence", "is", "words", "in", "order"], print out each word.`

Let's see what the output looks like.

```no-highlight
This
sentence
is
words
in
order
```

Let's try `.each` with some math.

```
array = [1, 2, 3, 4]
array.each do |number|
  puts number * number
end
```

What this code reads in English is the following:

`For each number in array, print out the square of that number`.

Here's the output:

```ruby
1
4
9
16
```

What if we wanted to sum up all the values in `array`?

```ruby
sum = 0
array.each do |number|
  sum = sum + number
end
```

This translates to the following in English:

`Let's initialize a variable called sum with a value of 0. Then, for each number in array, increment that sum by the number.`

It's worth noting here that we can write as many lines of code as we want in the `do` block.
We're not limited to single line statements, which is great, because we can do more complicated tasks.

So we've looked at arrays with `.each`, but how does that method work with hashes?

### Hashes

Let's look at the following hash, as an example:

```ruby
ages = {"Tom" => 20, "Jane" => 24, "Toby" => 12, "Mary" => 18, "Melissa" => 32, "Ernst" => 45}
```

There is a slight difference when iterating with `.each` on a hash versus an array.
Instead of considering one argument in what goes between the two `|`,
we consider two: the key and the value of the hash.

```ruby
ages.each do |key, value|
  puts "#{key} is #{value} years old."
end
```

How does this read in English?

`For each key-value pair in ages, print out the key and the value. Print it out in the form of 'key' is 'value' years old.`

Here's the output.

```no-highlight
Tom is 20 years old.
Jane is 24 years old.
Toby is 12 years old.
Mary is 18 years old.
Melissa is 32 years old.
Ernst is 45 years old.
```

`.each` is an optimized method to iterate over an array or hash in Ruby. You will see it very often. Take a look at the [Enumerable](http://ruby-doc.org/core-2.2.0/Enumerable.html) mixin to see what other methods are available that work in a similar manner.
