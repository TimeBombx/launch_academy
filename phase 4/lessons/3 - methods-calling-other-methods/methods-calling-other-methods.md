### Introduction

This video covers how we can use methods to call other methods.


### Video

{% vimeo_video '150846569' %}


### Timestamps

* 00:10 - Introduction, methods calling other methods
* 01:10 - Problem statements
  - Build a method that asks a user for their address
  - Build a method that prints out statistics for a rectangle
* 01:50 - Imperative Programming implementation of "Address Asker"
* 03:05 - Identifying code duplication, using the DRY principle
* 03:40 - Defining an `ask` method
* 04:55 - Refactoring code to use the `ask` method
* 06:40 - Testing out our "Address Asker"
* 06:50 - Identifying a use case that would cause code duplication (asking a user for their shipping and billing address)
* 08:30 - Naming a method called `get_address` which we will use to eliminate code duplication
* 09:20 - Defining the `get_address` method
* 10:10 - Calling the `ask` method within the `get_address` method
* 11:35 - Dan meant to say "Blank Hash" instead of "Blank Array"
* 12:52 - Method return values
* 13:25 - Running our `get_address` method
* 13:50 - Variable scope
* 15:00 - Eliminating duplication and re-using code with our `get_address` method
* 16:30 - Introducing the "Rectangle Statistics" problem
* 17:35 - Questions to ask yourself when building a method
* 18:30 - Building the `rectangle` method
* 19:50 - Extracting methods
* 21:45 - Defining the `perimeter` method
* 23:30 - Thoughts on methods and producing readable code
* 24:15 - The importance of naming
* 25:00 - Questions
