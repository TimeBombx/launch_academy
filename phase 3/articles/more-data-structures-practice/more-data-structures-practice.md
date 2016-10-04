In this assignment, we'll get some more practice modeling data in nested Ruby data structures.

### Learning Goals

* Develop an organized approach to modeling data
* Evaluate the pros and cons of modeling data in different ways

### Implementation Details

#### Overview

Let's take the following data structure containing information about people, and report some statistics about those people.

```ruby
people = [
  { name: "George Michael Bluth", age: 18, eye_color: "brown", hometown: "Newport Beach" },
  { name: "Lindsay Bluth Funke",  age: 36, eye_color: "blue",  hometown: "Newport Beach" },
  { name: "Lucille Bluth",        age: 65, eye_color: "brown", hometown: "Newport Beach" },
  { name: "Maeby Funke",          age: 17, eye_color: "green", hometown: "Boston" },
  { name: "GOB Bluth",            age: 38, eye_color: "brown", hometown: "Newport Beach" },
  { name: "Tobias Funke",         age: 43, eye_color: "brown", hometown: "Boston" }
]
```

Specifically, we want to report information about the number of people 20 or younger vs. over 20, the number of people with each eye color, and the number of people with each hometown. Our output should look like this:

```no-highlight
PEOPLE STATISTICS

AGE
twenty_or_younger: 2
over_twenty: 4

EYE_COLOR
blue: 1
green: 1
brown: 4

HOMETOWN
Newport Beach: 4
Boston: 2

```

To generate this output, we'll want to create a separate data structure that contains our statistics.

#### Why do we need a separate data structure?

We *could* generate our output directly from our `people` array. We could create variables for each output we want (`twenty_or_younger`, `over_twenty`, `blue`, etc.) and, as we loop through our people array, we could update all of these variables, and then print them out. That might look something like this for the ages statistics:

```ruby
twenty_or_younger = 0
over_twenty = 0

people.each do |person|
  if person[:age] <= 20
    twenty_or_younger += 1
  else
    over_twenty += 1
  end
end

puts "twenty_or_younger: #{twenty_or_younger}"
puts "over_twenty: #{over_twenty}"
```

But what happens when we add eye colors? In addition to creating new variables for each eye color, we'd have to add a conditional to check each person's eye color inside of our `each` block:

```ruby
twenty_or_younger = 0
over_twenty = 0

blue = 0
green = 0
brown = 0

people.each do |person|
  if person[:age] <= 20
    twenty_or_younger += 1
  else
    over_twenty += 1
  end

  if person[:eye_color] == "brown"
    brown += 1
  elsif person[:eye_color] == "green"
    green += 1
  else
    blue += 1
  end
end

puts "twenty_or_younger: #{twenty_or_younger}"
puts "over_twenty: #{over_twenty}"
puts "blue: #{blue}"
# etc.
```

This would get pretty messy pretty quickly, even if we refactored some of the code above into methods. Plus, this wouldn't scale very well if we wanted to add information about people with grey eyes, for example.

Instead, we should create a separate data structure to contain our statistics that we can use to generate our report. Let's call this data structure `people_statistics`.

#### Choosing the right data structure

Take a few minutes to whiteboard out the different kind of data structures you might use for `people_statistics`. Draw at least two data structures that you could use to generate the sample output above.  **Don't cheat by reading the rest of the assignment!**

Look at the data structures you drew. What are the pros and cons of each? You should ask yourself:

* How would I access each piece of information that I want to print? Which is more human readable?
* What happens if I add or remove statistics? Would I need to change my code elsewhere if, for example, I want to keep track of the number of men and women in my `people` array?
* Which is more efficient at retrieving data?  (This is a secondary consideration, but one that you should think about once you master the basics of data structures.) If I retrieve a piece of information from an array, the interpreter has to inspect each item in the array until it gets to the item I want. By contrast, if I retrieve a value from a hash using its key, the interpreter can immediately locate that value without checking each item in the data structure.

Now let's look at two options - an array of hashes and a hash of hashes - and figure out which one is better:

```ruby
# array of hashes
people_statistics = [
  { statistic: "ages", twenty_or_younger: 2, over_twenty: 4 },
  { statistic: "eye_color", blue: 1, green: 1, brown: 4 },
  { statistic: "hometown", "Newport Beach" => 4, "Boston" => 2 }
]

# hash of hashes
people_statistics = {
  ages: { twenty_or_younger: 2, over_twenty: 4 },
  eye_color: { blue: 1, green: 1, brown: 4 },
  hometown: { "Newport Beach" => 4, "Boston" => 2 }
}
```

To access the number of people with brown eyes, we'd do the following:

```ruby
# array of hashes
people_statistics[1][:brown]

# hash of hashes
people_statistics[:eye_color][:brown]
```
Which of these more clearly conveys what's going on to an outsider reading our code?

If we add another statistic to our data structure, would we need to change how we access that piece of information? Say, for example, we decide to track gender:

```ruby
# array of hashes
people_statistics = [
  { statistic: "gender", male: 3, female: 3 },
  { statistic: "ages", twenty_or_younger: 2, over_twenty: 4 },
  { statistic: "eye_color", blue: 1, green: 1, brown: 4 },
  { statistic: "hometown", "Newport Beach" => 4, "Boston" => 2 }
]

# hash of hashes
people_statistics = {
  gender: { male: 3, female: 3 },
  ages: { twenty_or_younger: 2, over_twenty: 4 },
  eye_color: { blue: 1, green: 1, brown: 4 },
  hometown: { "Newport Beach" => 4, "Boston" => 2 }
}
```
If we use a hash, we can still access `people_statistics[:eye_color][:brown]`. But if we use an array, what happens if we call `people_statistics[1][:brown]`? After adding gender, we'd need to change every place in our code where we refer to a particular index in our `people_statistics` array.

At this point, you may have determined that the hash of hashes is the better option.  It is more human readable and we will not need to update our code if we change the position of a particular statistic inside the hash. Moreover, it is more efficient because we can go directly to the value we want using the key, instead of cycling through the array until we get to the index we want.

#### Building our data structure

Now that we've decided on a data structure, let's build it. Take a few minutes to pseudocode your approach. Then test it out in `irb`.

If you're stuck, break it down into the following steps:

First, try creating the structure using empty hashes as the values, so it looks like this:

```ruby
people_statistics = {
  ages: {},
  eye_color: {},
  hometown: {}
}
```

Then modify your code so that it creates the appropriate nested hashes, but does not actually calculate the values:

```ruby
people_statistics = {
  ages: { twenty_or_younger: 0, over_twenty: 0 },
  eye_color: { blue: 0, green: 0, brown: 0 },
  hometown: { "Newport Beach" => 0, "Boston" => 0 }
}
```

Finally, update the hash to contain the right values for each statistic.

#### Generating our output

Our last step is to generate our output from our `people_statistics` hash. Try this out on your own.

### Rules to Follow

#### Take time to plan out your data structures

Before you dive into coding, think about what you want your final data structure to look like. What is the best data structure to fit your needs? Whiteboarding and `irb` are your friends.

#### If you're stuck, build your data structures incrementally

If you're having trouble creating the data structure you've decided on, break it down into pieces. Draw out an intermediate structure and build that first. Then modify your code incrementally to get to your final product.

### Why This is Important

Understanding how to manipulate data structures is a key skill that you will draw on as a developer. You should strive to master the art of identifying and building the right data structure for a problem.
