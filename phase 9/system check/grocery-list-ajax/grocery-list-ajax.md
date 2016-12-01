## Instructions

Make the grocery list app JavaScript-y!

### Getting Set Up

* Run `et get grocery-list-ajax`
* Verify that phantomjs is installed: `npm install -g phantomjs`
* Install the necessary dependencies: `bundle`
* Drop the `grocery_list_development` database with `dropdb grocery_list_development`.
* Create the database with `createdb grocery_list_development`.
* Create tables by running `psql grocery_list_development < schema.sql` at the command line.
* Start the server: `ruby app.rb`
* Modify the code in `public/app.js` to satisfy the following requirements.

## Meeting Expectations Requirements

Acceptance tests have been written for you to build this grocery list app. Run the test suite with `rspec` and let the test errors guide your development and code implementation. Your first submission should satisfy the following requirements:

* If the form for a new grocery item is blank when submitting, the user gets an alert message.
* If the form is not empty, prevent the default action from happening, and post the new grocery item via AJAX.
* Upon successful posting of data, update the unordered list with the new grocery item. The list should be updated without having to reload the page.
* All acceptance tests passing.

### Tips

* To meet expectations, all the requirements specified above must be met. It is possible to make all the tests pass, but not satisfy the requirements above, so please double-check the requirements once you are done.
* The only file you will need to modify is `public/app.js` to fulfill these requirements.
* Use the provided HTML elements, `id` and `class` attributes to select DOM elements.
* Use the Chrome JavaScript console (`Command + Option + i`) to try out code, as well as to look for JavaScript error messages.
* **DO NOT** start the requirements necessary to Exceed Expectations until you have completed the requirements necessary to Meet Expectations.

## Exceeding Expectations Requirements

```no-highlight
As a Grocery List Creator,
I want to delete an item from my list
So that I don't purchase unnecessary food items.
```

Without having to reload the page, your app must satisfy the following requirements:
* There should be a delete button next to the name of each grocery item.
* When a user clicks on a delete button, it should trigger an event listener.
* Clicking on a delete button must send an AJAX `DELETE` request to `/groceries`.
* Clicking on an item's delete button must delete the respective item from the database. You may add code the the `app.rb` file, but do not modify the code we have provided you.
* Upon a successful AJAX request, the item and its button should be removed from the page, **without the page reloading**.
* Creating a new item via the form and clicking on the newly created item's delete button should delete the item from the database.
* Write an acceptance test for this functionality. You do not have to use the `expect_no_page_reload` block in your test. However, you do need to let Capybara known that the test requires JavaScript by adding `js: true` to your `feature` block.

```ruby
feature "name of your feature", js: true do
end
```
