## Data Structures Are the Beginning of Rich Programs

So far, many of the programs we've written have been a bit contrived.
Now that we have the power of arrays and hashes, we can combine
their strengths to make more powerful, functional software.

In this article, we'll explore more complex data structures that are
a little more practical in application.

### Two-Dimensional Arrays

Let's think about some of the games we came to know and love as children. Most of them involve gameboards of some kind, like Checkers, Chess, or even the simple grid of [Tic-Tac-Toe][tic-tac-toe-article]. If we wanted to represent the rows and columns on these gameboards with Ruby data types, we'd probably want to do that with a two-dimensional array, or as an array of arrays.

Let's imagine the following state of a tic-tac-toe board.

```no-highlight
|x|-|o|
|-|x|o|
|-|-|x|
```

Using what we know of arrays, we could represent the top row with the
following data structure:

```ruby
top_row = ['x', nil, 'o']
```

Similarly, we could represent the following rows in such a way:

```ruby
middle_row = [nil, 'x', 'o']
bottom_row = [nil, nil, 'x']
```

Now we can place all of these rows in another array, resulting in
the creation of a **nested array** or **two-dimensional array**.

```ruby
board = [top_row, middle_row, bottom_row]
```

In the above example, we have created an array of arrays.
We can use this structure to access elements on the grid.

```ruby
board[0][0] # the top, left corner of the grid
=> 'x'
board[2][0] # the bottom, left corner of the grid
=> nil
board[2][2] # the bottom, right corner of the grid
=> 'x'
board[1][1] # the middle of the grid
=> 'x'
```

While gameboards are fun, the staff at Launch Academy are classic
video game fanatics. Most early games were two-dimensional, meaning that a
player could move to the left and right, as well as up and
down on the screen.

One of our favorites was **[The Legend of Zelda][zelda-wikipedia]**.
In Zelda, you star as the game's protaganist, Link, who is determined
to save the Princess Zelda from the evil thief, Ganon. To do so, the
player had to navigate through a series of dungeons.
As Link, we would collect keys that would unlock doors that would lead to a
final enemy to defeat, taking us one step closer to reaching the
princess.

Using two dimensional arrays,
we can model the dungeon screens like the one below:

![Zelda Grid: Courtesy of Techrything][zelda-grid]

If you count the squares depicted, we have a 7x12 grid.
Seven squares high, and twelve squares wide.
If we imagine an empty room of the same size,
we could represent it visually in the way below:

```no-highlight
|-|-|-|-|-|-|-|-|-|-|-|-|
|-|-|-|-|-|-|-|-|-|-|-|-|
|-|-|-|-|-|-|-|-|-|-|-|-|
|-|-|-|-|-|-|-|-|-|-|-|-|
|-|-|-|-|-|-|-|-|-|-|-|-|
|-|-|-|-|-|-|-|-|-|-|-|-|
|-|-|-|-|-|-|-|-|-|-|-|-|
```

Put in terms of data structures, we could say that the room is made up of an array of rows,
with each row consisting of an array of columns. It would look like this:

```ruby
dungeon_screen = [
  [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
  [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
  [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
  [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
  [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
  [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
  [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
]
```

Based on the screenshot and noting the open door,
Link could enter at the 6th or 7th column of the bottom row.
In our first movement, we could place Link in either of those places.
Let's assume the 6th column for now.

```ruby
dungeon_screen = [
  [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
  [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
  [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
  [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
  [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
  [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
  [nil, nil, nil, nil, nil, 'L', nil, nil, nil, nil, nil, nil],
]
```

Notice the presence of the 'L' at the bottommost row to represent Link. Alternatively,
we could assign Link to appear there after initializing the grid.

```ruby
dungeon_screen = [
  [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
  [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
  [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
  [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
  [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
  [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
  [nil, nil, nil, nil, nil, 'L', nil, nil, nil, nil, nil, nil],
]

dungeon_screen[6][5] = 'L'
```

Using loops, we could initialize the grid differently.

```ruby
dungeon_screen = []
7.times do |row_index|
  dungeon_screen[row_index] = []
  12.times do |col_index|
    dungeon_screen[row_index][col_index] = nil
  end
end

dungeon_screen[6][5] = 'L'
```

In the example above, we're initializing 7 rows each with 12 cells of data.
We start by creating a blank array, and appending a row of 12 entries in what's referred to as a **nested loop**.

If we wanted to place the lava properly, represented by the character `=`, we could introduce some flow control.

```ruby
dungeon_screen = []
7.times do |row_index|
  dungeon_screen[row_index] = []
  12.times do |col_index|
    if row_index == 2
      dungeon_screen[row_index][col_index] = '='
    else
      dungeon_screen[row_index][col_index] = nil
    end
  end
end

dungeon_screen[6][5] = 'L'
```

This would result in the following graphical representation, which is more true to the screenshot of Link moving through the dungeon.

```no-highlight
|-|-|-|-|-|-|-|-|-|-|-|-|
|-|-|-|-|-|-|-|-|-|-|-|-|
|=|=|=|=|=|=|=|=|=|=|=|=|
|-|-|-|-|-|-|-|-|-|-|-|-|
|-|-|-|-|-|-|-|-|-|-|-|-|
|-|-|-|-|-|-|-|-|-|-|-|-|
|-|-|-|-|-|L|-|-|-|-|-|-|
```

Because we know the lava to exist horizontally in row 3, we can use the `row_index` of 2 to fill the grid with lava.

Working with the screenshot of Zelda provided,
if we were to place the key with character 'K' and each of the two mummy enemies with character 'M',
how could we modify the `dungeon_screen` variable to represent the presence of these graphical elements?

{% show_solution %}
```ruby
dungeon_screen[4][8] = 'K'
dungeon_screen[1][4] = 'M'
dungeon_screen[0][10] = 'M'
```

The resultant array `dungeon_screen` would appear as:

```ruby
[
  [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, "M", nil],
  [nil, nil, nil, nil, "M", nil, nil, nil, nil, nil, nil, nil],
  ["=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "="],
  [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
  [nil, nil, nil, nil, nil, nil, nil, nil, "K", nil, nil, nil],
  [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
  [nil, nil, nil, nil, nil, "L", nil, nil, nil, nil, nil, nil]
]
```

Graphically, this would look like:

```no-highlight
|-|-|-|-|-|-|-|-|-|-|M|-|
|-|-|-|-|M|-|-|-|-|-|-|-|
|=|=|=|=|=|=|=|=|=|=|=|=|
|-|-|-|-|-|-|-|-|-|-|-|-|
|-|-|-|-|-|-|-|-|K|-|-|-|
|-|-|-|-|-|-|-|-|-|-|-|-|
|-|-|-|-|-|L|-|-|-|-|-|-|
```

{% endshow_solution %}

### Arrays of Hashes

While arrays of arrays provide us with an excellent way of representing two dimensional spaces, arrays of hashes provide us
with the power to collect and manipulate rows of data that are similar. Consider the following list of voter addresses:

```no-highlight
Larry Launcher
33 Harrison Ave
Boston, MA 02111

Tom Menino
1 City Hall Square
Boston, MA 02201

Jim Irish
200 New Boston Dr
Canton, MA 02021

Freddie Fishman
1 Central Wharf
Boston, MA 02110

Cole Trickle
2 Claire Way
Boston, IN 47324
```

Using what we know of arrays and hashes, we could represent this list as an array of hashes:

```ruby
addresses = [
  {
    name: 'Larry Launcher',
    address: '33 Harrison Ave',
    city: 'Boston',
    state: 'MA',
    postal_code: '02111'
  },
  {
    name: 'Tom Menino',
    address: '1 City Hall Square',
    city: 'Boston',
    state: 'MA',
    postal_code: '02201'
  },
  {
    name: 'Jim Irish',
    address: '200 New Boston Dr',
    city: 'Canton',
    state: 'MA',
    postal_code: '02021'
  },
  {
    name: 'Freddie Fishman',
    address: '1 Central Wharf',
    city: 'Boston',
    state: 'MA',
    postal_code: '02110'
  },
  {
    name: 'Cole Trickle',
    address: '2 Claire Way',
    city: 'Boston',
    state: 'IN',
    postal_code: '47324'
  }
]
```

To determine the name of the first voter in the list, we could use the following syntax:

```ruby
addresses[0][:name]
```

Let's parse this out a bit. We could break this statement down into two essential components.

```ruby
first_address = addresses[0] # returns the first hash in the array
first_address[:name] # returns the value of the :name key in the first hash
```

`addresses[0][:name]` is just a shorthand way of accessing the same value.

Similarly, to determine the city of the last voter in the list, we could use similar syntax:

```ruby
addresses[-1][:city]
```

Now that we have a well structured list, we can start to do some really interesting things.
Imagine a mayoral candidate has requested that we write letters to voters in this list from Boston, MA.
Using what we know of iteration and data structures, we could write the following to
automate how to introduce the letter:

```ruby
addresses.each do |address|
  if address[:city] == 'Boston' && address[:state] == 'MA'
    puts "Dear #{address[:name]},"
  end
end
```

In the above example, we're looping through all of the supplied addresses,
looking for entries that have the city of "Boston" and the state of "MA", and outputting a salutation for each recipient.

Your output should look like:

```no-highlight
Dear Larry Launcher,
Dear Tom Menino,
Dear Freddie Fishman,
```

Note that these are the only entries that are from Boston, MA.

[zelda-wikipedia]: http://en.wikipedia.org/wiki/The_Legend_of_Zelda_(video_game)
[zelda-grid]: https://s3.amazonaws.com/horizon-production/images/key1.png
[tic-tac-toe-article]: http://en.wikipedia.org/wiki/Tic-tac-toe

