### Arrays

Arrays represent an ordered list of data. 
The data can be of any type: integer, strings, or even a mix of data types. 
An array can contain other arrays too. 
Say, for example, we had a list of bank transactions representing a checking account:

```no-highlight
deposit $500
withdraw $200
withdraw $250
deposit $400
withdraw $12
deposit $500
withdraw $8
withdraw $90
withdraw $15
```

How could you implement an array to represent this set of transactions? 

```ruby
transactions = [500, -200, -250, 400, -12, 500, -8, -90, -15]
```

Now we have a `transactions` array. We can do all kinds of fun things with this
data structure. 
Because we have an ordered list, we can access the `n`th transaction on this array. 
Arrays start with an index of `0`, so to get the first transaction of this list, 
we would call `transactions[0]`. We can also call `transactions.first`, 
which returns the same value. Unfortunately, there is no `transactions.second` or `transactions.third`, 
but there is a `transactions.last` which returns the last value of an array.

```ruby
transactions = [500, -200, -250, 400, -12, 500, -8, -90, -15]
=> [500, -200, -250, 400, -12, 500, -8, -90, -15]

transactions[0]
=> 500

transactions.first
=> 500

transactions.last
=> -15

```

How would you get the third transaction?

```ruby
transactions[2]
=> -250
```

What about the fifth transaction?

```ruby
transactions[4]
=> -12
```

So those aren't too bad. How would you go about getting the last value of `transactions`? 
You could use `transactions.last` but let's put that aside for a second. 
There are two other ways to go about it. The first way, is to count, 
starting from `0` to the end of the array, or in this case, `8`. 
The other way is to note that the end of an array begins with an index of `-1`, 
or `transactions[-1]`. This number decreases by `1` the further left you go, 
so the second from the last would be `transactions[-2]` and third from the last would be `transactions[-3]`, 
and so forth.

```ruby
transactions.last
=> -15

transactions[-1]
=> -15

transactions[-2]
=> -90

transactions[-3]
=> -8
```

See the [Ruby Docs on Arrays][ruby-array-docs] about other methods the Array class has available to it.

### Hashes

What's a hash? In short, it's a collection of key-value pairs. 
What's a key value pair? A key, or some object, like a name has a corresponding value, 
or some other object that the key corresponds to. 

In the example below, the key `Launch Academy` points to another value 
`33 Harrison Avenue, 5th Floor, Boston, MA`. 

```ruby
addresses = {
  'Launch Academy' => '33 Harrison Avenue, 5th Floor, Boston, MA'
}
```

Let's add more addresses to this hash:

```ruby
addresses['The White House']= '1600 Pennsylvania Avenue NW, Washington, DC'
```

Now let's look at our `addresses` hash:

```ruby
addresses
=> {"Launch Academy"=>"33 Harrison Avenue, 5th Floor, Boston, MA",
 "The White House"=>"1600 Pennsylvania Avenue NW, Washington, DC"}
```

So what can we do with the hash `addresses` now?

Let's find out all the keys in `addresses`:

```ruby
addresses.keys
=> ["Launch Academy", "The White House"]
```

What about all the values in `addresses`:

```ruby
=> ["33 Harrison Avenue, 5th Floor, Boston, MA",
 "1600 Pennsylvania Avenue NW, Washington, DC"]
```

Let's add another address:

```ruby
addresses['My House'] = 'That Place, Town, State'
=> "That Place, Town, State"
addresses
=> {"Launch Academy"=>"33 Harrison Avenue, 5th Floor, Boston, MA",
 "The White House"=>"1600 Pennsylvania Avenue NW, Washington, DC",
 "My House"=>"That Place, Town, State"}
```

What if we want to change the address of `My House`?

 ```ruby
addresses['My House'] = 'Another Address, Somewhere else, Another State'
=> "Another Address, Somewhere else, Another State"
addresses
=> {"Launch Academy"=>"33 Harrison Avenue, 5th Floor, Boston, MA",
 "The White House"=>"1600 Pennsylvania Avenue NW, Washington, DC",
 "My House"=>"Another Address, Somewhere else, Another State"}
```

Now let's take a look at all the values of the `addresses` hash:

```ruby
addresses.values
=> ["33 Harrison Avenue, 5th Floor, Boston, MA",
 "1600 Pennsylvania Avenue NW, Washington, DC",
 "Another Address, Somewhere else, Another State"]
```

Hashes are great for managing dictionary-like data. 
Take a look at the [Ruby Docs for Hashes][ruby-hash-docs] for what kinds of methods 
Ruby has to offer about this data structure.

Later on, we'll talk about compound data structures like arrays of hashes, 
hashes of hashes, or hashes of arrays.

[ruby-array-docs]: http://www.ruby-doc.org/core-2.2.0/Array.html
[ruby-hash-docs]: http://www.ruby-doc.org/core-2.1.5/Hash.html
