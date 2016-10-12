### Introduction

In this video we will go over an example for how we write ruby code to model a
playing card as a ruby `class` or Object.


### Learning Goals

* Build an object to represent a playing card


### Video

{% vimeo_video '80204100' %}


### Timestamps

* 00:00 - Introduction
* 01:15 - Class names are written in [CamelCase](https://en.wikipedia.org/wiki/CamelCase). Filenames are written in [snake_case](https://en.wikipedia.org/wiki/Snake_case)
* 02:13 - Create the `PlayingCard` class
* 02:55 - Every class gets a `new` and `initialize` method, by default
  - Calling `PlayingCard.new` will execute the code within the `initialize` method
* 04:30 - Implementing the `PlayingCard` **constructor**. Creating the following instance variables
  - rank
  - suit
* 06:30 - Implementing the `face_card?` instance method
* 08:30 - Objects use **return values** as a means of communication
* 09:15 - Modeling a hand of cards and utilizing **shared behavior**
* 12:20 - Wrap up
