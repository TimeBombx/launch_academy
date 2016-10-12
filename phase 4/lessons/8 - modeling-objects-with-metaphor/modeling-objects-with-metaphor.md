### Introduction

In this video we will dive into modeling objects with metaphor and talk about
how we go about designing the classes and objects we want to use.


### Learning Objectives

* Thinking through how to design objects
* Learning about getters and setters
* The `attr_reader` and `attr_accessor` shortcuts
* Identify when certain characteristics are immutable, or, cannot be changed


### Video

{% vimeo_video '151717435' %}


### Timestamps

* 00:00 - Introduction
* 01:25 - Modeling objects using **metaphor**
* 02:30 - Building a `Book` class
* 03:33 - Adding **readers** (or **getters**) to the `Book` class
* 05:55 - Adding a **writer** (or **setter**) for the `owner` of a book
* 10:45 - What actions can the Book object perform? It is up to us to give these actions expressive and meaningful names.
  - `book.award_to("John Smith")`
  - `book.purchased_by!("John Smith")`
* 12:37 - **The `Cup` class**
* 12:50 - Introducing the idea of "immutable" properties of an object
* 16:20 - Implementing the `pour` method
* 18:30 - Improve the functionality of the `pour` method
* 22:15 - Implementing the `drink` method
* 24:00 - **The `Car` class**. Instance variables and readers for:
  - color
  - year
  - make
* 29:50 - Working with an array of `Car` objects.
* 31:28 - Implementing a `repaint!` method
* 33:30 - **The `Home` class**. Instance variables for:
  - address
  - city
  - state
  - postal_code
  - square_footage
  - occupant
* 36:55 - Implementing a `add_addition!` method
* 38:50 - Using the `sell_to!` method
* 39:50 - Refactoring our code with the `attr_reader` and `attr_accessor` shortcuts
