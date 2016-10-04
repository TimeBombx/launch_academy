### For When an Array Just Isn't Enough

So far, we've studied the Array as a means to organize data. We've learned that Arrays are best suited for lists, and that they work best in situations were you want to preserve the order of the list. Consider the example list of even numbers below:

```ruby
evens = [2, 4, 6, 8, 10, 12, 14]
```

The list is intuitively ordered by the numeric value of each even number. So, we can assume the following English and code-based assertions:

```ruby
#first even number in the list
evens[0]
# or
evens.first

#last even number in the list
evens[-1]
# or
evens.last

#even numbers in the list
evens.size
```

Now, imagine that we use a similar set of values to reflect how many Matchbox cars a group of 3 children have collected, with each item in the Array representing an individual child's number of Matchbox cars collected. Imagine the three children are named Sally, Jesse, and Raphael.

```ruby
matchbox_cars_owned = [2, 4, 8]
```

It would be very easy to determine the total number of matchbox cars the children have collected in aggregate,
but which child owns only 2? Which child owns 8? How many cars does Jesse own? Which child has the most cars?
These questions are harder to answer, because we must remember the order by which Sally, Jesse, and Raphael's total number of cars are stored.

The need for a different way to organize data emerges. In this assignment, we will study the use of a **Hash** as a more appropriate data structure for the use case mentioned above.

# Hashes

Imagine, for a moment, a magical filing cabinet full of folders. We will call this magical filing cabinet, "Sam". We can ask Sam for any folder by name. Sam will then hand us the folder we were looking for. Sam can also file new folders for us, we just have to give the folder a unique name.

This basically describes how the [**Hash Data Structure**][ruby-hashes] works in Ruby. With a hash, we ask it to retrieve data by giving it a **key**. This key can be any Ruby Object, but, usually, we use either [symbols][ruby-symbols] or [strings][ruby-strings] for keys. The data that is returned is called the **value**.

### Creating Hashes

Let's create our own magical filing system for acronyms. The `keys` will be the acronym abbreviation, and the `values` will be what the acronym stands for.

```no-highlight
pry(main)> acronyms = {}
=> {}
pry(main)> acronyms["EST"] = "Eastern Standard Time"
=> "Eastern Standard Time"
pry(main)> acronyms["EOF"] = "End of File"
pry(main)> acronyms["SSN"] = "Social Security Number"
=> "Social Security Number"
```

Here, we have created a new hash and assigned it to the variable `acronyms`. Along with assigning a variable to an empty pair of curly braces `{}`, we can create a new hash with the `Hash.new` statement. We have also added a few acronyms to our hash. Let's add a few more.

Note the similarity between arrays and hashes. With arrays, we access elements in the list using numbers or indices. With hashes, we access elements using unique names, or **keys**.

```no-highlight
pry(main)> acronyms["UFO"] = "Unidentified Flying Object"
=> "Unidentified Flying Object"
pry(main)> acronyms["NASA"] = "National Aeronautics and Space Administration"
=> "National Aeronautics and Space Administration"
pry(main)> acronyms["MTV"] = "Music Television"
=> "Music Television"
pry(main)> acronyms["DAEMON"] = "Disk And Execution Monitor"
```

Now that we have a decent number of keys and values in our hash, what does it look like?

```no-highlight
pry(main)> acronyms
=> {"EST"=>"Eastern Standard Time",
 "EOF"=>"End of File",
 "SSN"=>"Social Security Number",
 "UFO"=>"Unidentified Flying Object",
 "NASA"=>"National Aeronautics and Space Administration",
 "MTV"=>"Music Television",
 "DAEMON"=>"Disk And Execution Monitor"}
```

Note that each **key** has what looks like an arrow symbol that points to the associated **value**. This symbol is called a **hashrocket** `=>`. Put another way, we can think of hashes like what we've expressed below:

```ruby
{
  "key_1" => "value_1",
  "key_2" => "value_2
}
```

Returning to our matchbox car example, how could we better represent the childrens' matchbox cars collected through the utilization of a Hash?

{% show_solution %}

```ruby
cars_collected = {
  "Sally" =>   2,
  "Jesse" =>   4,
  "Raphael" => 8
}
```
{% endshow_solution %}

### Accessing Values by Key

Recall our [To Do List][arrays-article] stored as an array. We accessed individual items in our To Do List by passing the array a zero-based index in square brackets. We can retrieve values from hashes in a similar way. Instead of using a numerical index, we pass an object in square brackets (in this case, a string) as a `key`, and we get back the associated `value`.

Given this hash:

```ruby
pry(main)> acronyms
=> {"EST"=>"Eastern Standard Time",
 "EOF"=>"End of File",
 "SSN"=>"Social Security Number",
 "UFO"=>"Unidentified Flying Object",
 "NASA"=>"National Aeronautics and Space Administration",
 "MTV"=>"Music Television",
 "DAEMON"=>"Disk And Execution Monitor"}
```

`acronyms["UFO"]` will return `"Unidentified Flying Object"`.

```no-highlight
pry(main)> acronyms["UFO"]
=> "Unidentified Flying Object"
```

If we provide a key that our hash does not know about, we are returned a `nil` value.

```no-highlight
pry(main)> acronyms["IDK"]
=> nil
```

The `fetch` method works much like accessing values via square brackets, but the difference is that `fetch` will raise an error if there is no associated value.

```no-highlight
pry(main)> acronyms.fetch("MTV")
=> "Music Television"
pry(main)> acronyms.fetch("NYOB")
KeyError: key not found: "NYOB"
```

We may use `fetch` when we want our programs to assume that a certain key exists in our hash. For example, let's imagine we had a configuration related structure for storing a list of favorite vendors for a purchasing system. We may have some contrived code like the example below.

```ruby
vendors = {
  "grocer" => "Shaw's",
  "office supplies" => "Staples"
}

# I need to buy paper
PurchasingSystem.purchase("paper", vendors.fetch("office supplies"))
```

In the above example, we're relying on a value for the key `"office supplies"` to exist. If one does not exist, we want the system to report an error.

**Note:** Calling `fetch` on a hash will cause your program to stop execution if the `key` you are looking for does not exist. When we are in pry, it is not an issue since pry will rescue and handle any errors generated by our code. Read more about ruby errors and exceptions in the [ruby documentation][ruby-exceptions]

### Overwriting Values

We can overwrite a value quite simply by reassigning it.

```no-highlight
pry(main)> acronyms["EOF"]
=> "End of File"
pry(main)> acronyms["EOF"] = "End of Flight"
=> "End of Flight"
```

### Methods

Just like arrays, and other ruby objects, we have methods that are defined on the Hash class that we can use. Let's explore a few:

#### `size` and `length`

Returns the number of key/value pairs. `length` does the same.

```
pry(main)> acronyms.size
=> 7
```

#### `empty?`

Returns true if there are no key/value pairs in the hash, and false otherwise.

```no-highlight
pry(main)> acronyms.empty?
=> false
pry(main)> {}.empty?
=> true
```

#### `keys`

Returns an array of all the keys in the hash.

```no-highlight
pry(main)> acronyms.keys
=> ["EST", "EOF", "SSN", "UFO", "NASA", "MTV", "DAEMON"]
```

#### `values`

Returns an array of all the values in the hash.

```no-highlight
pry(main)> acronyms.values
=> ["Eastern Standard Time",
 "End of Flight",
 "Social Security Number",
 "Unidentified Flying Object",
 "National Aeronautics and Space Administration",
 "Music Television",
 "Disk And Execution Monitor"]
```

#### `invert`

Returns a hash where the keys and values are swapped.

```no-highlight
pry(main)> acronyms.invert
=> {"Eastern Standard Time"=>"EST",
 "End of Flight"=>"EOF",
 "Social Security Number"=>"SSN",
 "Unidentified Flying Object"=>"UFO",
 "National Aeronautics and Space Administration"=>"NASA",
 "Music Television"=>"MTV",
 "Disk And Execution Monitor"=>"DAEMON"}
```

#### `has_key?`, `key?`, `include?`, and `member?`

All four of these methods do the same thing: return true if the key exists in the hash, and false otherwise.

```no-highlight
pry(main)> acronyms.has_key?("EST")
=> true
pry(main)> acronyms.has_key?("DOB")
=> false
```

#### `has_value?` and `value?`

Returns true if the value exists in the hash and false otherwise.

```no-highlight
pry(main)> acronyms.has_value?("Music Television")
=> true
pry(main)> acronyms.has_value?("To Be Continued")
=> false
```

### Iterating over Hashes

#### Printing out a Hash

Let's move our code over to a file so that we can continue experimenting with hashes.

```ruby
# file: acronyms.rb
require "pry"

acronyms = {
  "EST" => "Eastern Standard Time",
  "EOF" => "End of File",
  "SSN" => "Social Security Number",
  "UFO" => "Unidentified Flying Object",
  "NASA" => "National Aeronautics and Space Administration",
  "MTV" => "Music Television",
  "DAEMON" => "Disk And Execution Monitor"
}

acronyms.each do |key, value|
  puts "#{key}: #{value}"
end
```

Save this file as `acronyms.rb` and run it by typing `ruby acronyms.rb` in the terminal. It will output:

```no-highlight
EST: Eastern Standard Time
EOF: End of File
SSN: Social Security Number
UFO: Unidentified Flying Object
NASA: National Aeronautics and Space Administration
MTV: Music Television
DAEMON: Disk And Execution Monitor
```

The `each` method allows us to iterate over key/value pairs in the hash.

#### Passing `|multiple, values|` to `each`

When iterating over an array, each iteration is assumed to have 1 thing to iterate over at a time. Hashes implement `each` differently: it passes both the `key` and the `value` to each.

Ultimately, these names we use inside of the pipes `||` are not important.

This is what we used above:

```ruby
acronyms.each do |key, value|
  puts "#{key}: #{value}"
end
```

But it would work just as well if it was written like this:

```ruby
acronyms.each do |k, v|
  puts "#{k}: #{v}"
end
```

or, even this:

```ruby
acronyms.each do |monsters, aliens|
  puts "#{monsters}: #{aliens}"
end
```

We can iterate over just the `keys`, or just the `values` by utilizing the `.each_key` or `.each_value` methods defined on hashes.

**Quick Challenge:** Using `each_key`, print out all of the acronym abbreviations on one line, with each abbreviation separated by a comma.

{% show_solution %}
```ruby
keys = []
acronyms.each_key do |key|
  keys << key
end

puts keys.join(',')
```
{% endshow_solution %}

Once completed, is there a more succinct way to achieve the same effect? You may use an alternative to `each_key`

{% show_solution %}
```ruby
puts acronyms.keys.join(',')
```
{% endshow_solution %}

#### Finding a key/value Pair

What if we are unsure if we have a particular key/value pair? We can use the `has_key?` method to check.

Add this code to the end of your `acronyms.rb` file and run `ruby acronyms.rb`

```ruby
if acronyms.has_key?("BLT")
  puts acronyms["BLT"]
else
  puts "I don't know that one!"
end
```

We could also try to access the value via the key. If the value returned is `nil`, then we know for sure that the key/value pair isn't in the hash.

```ruby
if acronyms["BLAT"]
  puts acronyms["BLAT"]
else
  puts "I don't know that one!"
end
```

Because `nil` is a "falsy" value, the two code snippets above are functionally equivalent.

Perhaps we want to check if an acronym is in our hash, and change it if it isn't what we expect it to be.

```ruby
new_key = "UFO"
new_value = "Unidentified Foreign Object"

if acronyms[new_key] && acronyms[new_key] == new_value
  puts "No need to update, I already know that one."
else
  puts "Updating acronyms..."
  acronyms[new_key] = new_value
end
```

First we check to see if they key exists *and* that it has the appropriate value at that key. If one or both conditions is not met, the `else` portion of our statement will update or add the key and value pair.

### Symbolized Keys Are Different

So far, we've been using Strings as the keys to our hashes. Many times, we also see the use of a `Symbol` instance to represent a key in a hash.

Let's return to our vendor hash to illustrate.

```ruby
vendors = {
  :grocer => "Shaw's",
  :office_supplies => "Staples"
}
```

If we use this variable in a Pry session, note the following:

```no-highlight
pry(main)> vendors = {
pry(main)*   :grocer => "Shaw's",
pry(main)*   :office_supplies => "Staples"
pry(main)* }
=> {:grocer=>"Shaw's", :office_supplies=>"Staples"}
pry(main)> vendors["grocer"]
=> nil
pry(main)> vendors[:grocer]
=> "Shaw's"
pry(main)>
```

If you're not sure about symbols, and you don't follow the use of them above, be sure to review our article on [symbols][symbols-article].
Now, note above that when symbols are used in a hash, they are very different from strings.
Because we utilized symbols as our keys instead of strings, the interpreter does not recognize the string `"grocer"` as an existing key
in the hash.

Generally, you will find hashes to either be **symbol based** or **string based**, so you should identify what type of hash you're dealing with as you study and work with it.

```ruby
#symbol based keys
{
  :grocer => "Shaw's",
  :office_supplies => "Staples"
}
```

```ruby
#string based keys
{
  "grocer"          => "Shaw's",
  "office supplies" => "Staples"
}
```

### Mixing Symbols and Strings

It is generally considered bad practice to mix symbols and string as keys in your hash. Consider the following example:

```ruby
vendors = {
  "grocer"          => "Shaw's",
  "office supplies" => "Staples"
}

#errantly re-assign our preferred grocer
vendors[:grocer] = "Wegmans"
```

Uh oh! In our excitement to update our new, favorite grocer, we used a symbol based key instead of our string based one.
Now, we've made quite a mess of things. This is what our vendor hash looks like now:

```ruby
{
  "grocer"=>"Shaw's",
  "office supplies"=>"Staples",
  :grocer=>"Wegmans"
}
```

It's now ambiguous if we prefer Shaw's or Wegmans, and if we should be using strings or keys to work with the `vendor` hash.
As a rule, it's a good idea to keep your keys consistently as strings or symbols in a given hash.

### A New Flavor of Hash Syntax

As we wrap up our exploration of symbol based keys, we should explore an alternative way of representing a hash with Ruby.
Starting in Ruby 1.9, there is a slightly more compact (and preferred) way for creating a symbol based hash.
We can utilize this new syntax by eliminating the hashrocket and using a colon to separate keys from their correlating values.

```ruby
#with hashrockets
vendors = {
  :grocer          => "Shaw's",
  :office_supplies => "Staples"
}

#new, preferred syntax
new_style_vendors = {
  grocer: "Shaw's",
  office_supplies: "Staples"
}
```

These two hashes are equal. They are just using a different flavor of syntax.

## Wrap Up

Wow! We just learned a __ton__ about hashes! Pat yourself on the back. You have added new tool to add to your Ruby toolbelt. It will come in handy for the upcoming exercises as well as future programming challenges.

[arrays-article]: /lessons/arrays
[symbols-article]: /lessons/symbols
[ruby-hashes]: http://ruby-doc.org/core-2.2.0/Hash.html
[ruby-symbols]: http://ruby-doc.org/core-2.2.0/Symbol.html
[ruby-strings]: http://ruby-doc.org/core-2.2.0/String.html
[ruby-exceptions]: http://ruby-doc.org/core-2.2.0/Exception.html
