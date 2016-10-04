# The `rubies` gem

Our Experience Engineers have created the `rubies` gem to provide more practice parsing through compound data structures. 

You can run `rubies` from your terminal by installing the [rubies](https://github.com/vikram7/rubies) gem:

```no-highlight
gem install rubies
rubies
```

After typing `rubies` into your terminal, you will see the Splash screen:

![Splash Screen](https://s3.amazonaws.com/horizon-production/images/PGvyVEC.png)

After starting, you will see randomly generated data structures for you to work through:

![Sample Data Structure](https://s3.amazonaws.com/horizon-production/images/zCHl7Sq.png)

Here, you are being asked to find `865` in the array called `current`,
which is located in the 3rd position (or index of `2`). The answer would be the following:

```no-highlight
[1] rubies(main)> current[2]
=> 865
```

![Another Sample Data Structure](https://s3.amazonaws.com/horizon-production/images/MYH1ynW.png)

Here, you are given a hash called `current` and are being asked to find the right command for
`engineer collaborative schemas`.
The key associated with that value is `Bergnaum-Pouros`, so the answer would be the following:

```no-highlight
[1] rubies(main)> current["Bergnaum-Pouros"]
=> enable collaborative schemas
```

![Array with Hashes Data Structure](https://s3.amazonaws.com/horizon-production/images/DIjspdO.png)

Here, you are given an array with a hash in it, or a compound data structure,
and are being asked to find `(106) 777-4274`. This is how you could go about it:

```no-highlight
[1] rubies(main)> current[0]["Mikel Herman"]["phone"]
=> (106) 777-4274
```

Type `new` to get another data structure or `exit` to quit and see your final score.

Remember, when dealing with data structures, try to break them down to their smallest components. It will help you tremendously by doing so!
