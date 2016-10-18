### Contents

In this guided tutorial, we're going to be working on creating a basic web page layout that closely resembles a site that you've probably been to before. We'll give you some examples and then ask you to come up with your own solution to issues based on those examples as you proceed. 

Here's a mockup of what we'll be building:

![Shmoogle Mockup](https://s3.amazonaws.com/horizon-production/images/shmoogle.png)

### Learning Goals

* Create a basic HTML page
* View your changes in the browser
* Use basic CSS styling

### Resources

* [Introduction to HTML](https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/Introduction)
* [HTML element reference](https://developer.mozilla.org/en-US/docs/Web/HTML/Element)
* [HTML attribute reference](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes)
* [MDN on Forms](https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/Forms)
* [The CSS Box
  Model](https://developer.mozilla.org/en-US/docs/Web/CSS/box_model)

### First, HTML!

#### Getting Started

```no-highlight
# Create a new directory for the project
mkdir shmoogle

# Go into that directory
cd shmoogle

# Create the index page
touch index.html

# Open the whole thing in your text editor (Atom in this example)
atom .
```

#### Create the basic HTML page

Open `index.html` in your text editor (if you followed the above instructions, you should already be there). Here's a basic boilerplate HTML page that you can copy and paste into the file.

```html
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Shmoogle</title>
</head>
<body>

  <!-- This is where the page content goes -->

</body>
</html>
```

#### Understanding the Layout

The layout for our application will have four sections: **navigation**, **search**, **search filters**, and **page specific content**.

![Shmoogle Layout Breakdown](https://s3.amazonaws.com/horizon-production/images/shmoogle-layout-breakdown.png)

#### Navigation Elements

Just from looking at the mockup at the top of this lesson, we can see that our application's navigation, like most navigations, is a list of links. We're going to want to create our navigation inside the body of the page (within the `<body>` tags) and above the page specific content (right now represented as a comment: `<!-- This is where the page content goes -->`).

Now we will create an unordered list of links where the text of the links matches the links you see in the mockup (it may be helpful to download the mockup image and have it open in another window while you work). Do something like the following, maybe adding your own links to keep things interesting.

```html
<ul>
  <li>
    <a href="#">Search</a>
  </li>
  ...more links here...
  <li>
    <a href="#">Calendar</a>
  </li>
</ul>
```

`<ul>` is the element tag for an unordered list. This is any list where order of items is not crucial and where bullets might typically be used. An list (whether `<ul>` or `<ol>`) is made up of list elements inside, represented by `<li>`s. We've then nested link tags `<a>` within each list item to create a nice orderly section of links.

Note that like in your Ruby files, we're indenting nested items. If an element is a child of another, like the `<li>`s above, it should be indented by two spaces to indicate that as you write your HTML. Follow the pattern in the above example.

**Finally, view the changes that we've made by visiting the page in your browser.** You can do this by running `open index.html` from your command line or by typing the full file path into your browser. It will look something like this:

```
file:///Users/launcher/launchy-stuff/schmoogle/index.html
```

#### Search Elements

The next set of elements that we want to appear on all of our pages is the search form. Forms are used when we want to allow a user to input data that we can use on the server side to show them dynamic content.

For now, our form will be static (i.e. not functional!), which means we will just set up the form elements in HTML and style them with CSS. We will not concern ourselves in this lesson with the back end code that would make the search actually functional for finding blue Nikes or Museum of Science Hours or articles about Beyoncé or whatever.

Add something like the following code right below the elements that make up our navigation in your `index.html` file:

```html
# index.html

<form>
  <label>Shmoogle</label>
  <input type="search" name="search">
  <input type="submit" value="Search">
</form>
```

**View the changes that we've made by visiting the page in your browser.** If you still have it open from the last step, just save `index.html` in your editor and re-load the page. Magic!

#### Search Filters

The search filters, like the navigation, will also be an unordered list of links.

Follow the example that was given for the navigation and create an unordered list of links for the search filters just below the search form.

**As usual, view the changes that we've made by visiting the page in your browser.**

## Time to Style!

Now, this page is pretty sad looking and not quite up looking like our mockup. Let's add some CSS styles so that our page isn't so boring to look at.

#### Linking a CSS File

Start by creating a new file named `app.css`. You can run `touch app.css` in your `schmoogle` directory in the terminal just like you did to create your `index.html` page. Next, you'll want to link that stylesheet into our `index.html` page. Remember that style sheet links always go in the `<head>` element, like so:

```html
<head>
  <title>Shmoogle</title>

  <!-- Include our CSS styles from external file -->
  <link href="app.css" media="screen" rel="stylesheet"/>
</head>
```

Add a CSS style to `app.css` to make sure that the link is set up correctly.

```css
body {
  background-color: red;
}
```

Notice how this example is formatted; the element or class tag goes on it's own line, with an opening bracket to enclose the selectors therein. Each selector is indented by two spaces. Some developers like to sort the selectors alphabetically for ease of use, but that's up to you.

You can test that the link is working by opening the page in your browser with
`open index.html`. Once you're sure that it's working, remove that ugly style
and move on to the next section.

#### Let's Create Some Containers

One way to approach coding a new layout is to start by identifying and creating containers that can be used to separate the major areas of content. We've already identified what could be considered the major areas of content back when we were discussing the application layout but let's take another look:

![Shmoogle Layout Breakdown](https://s3.amazonaws.com/horizon-production/images/shmoogle-layout-breakdown.png)

Based on this mockup, the major layout container elements might look like this:

```html
<div class="navigation-container">
  ..navigation here..
</div>

<div class="search-container">
  ..search here..
</div>

<div class="filters-container">
  ..search filters here..
</div>

<div class="main-container">
  ..main page-specific content here..
</div>
```

**Take a few minutes to create these containers and move the appropriate
elements inside of them. Remember to nest all the elements sensibly. (The main container should be blank).**

#### Names Matter In CSS, too.

Just like we want to use descriptive variable names and functions in our Ruby, we want to use great class names that describe the element we are trying to style. When using classes for style, try to generalize the markup that you're working with. In this case we're creating container elements that will hold the content of each of the different major areas of content, which will be styled as dictated by the mockup.

### Styling the Navigation

At this point it makes sense to remove some of the default styling that is being applied to the unordered list `<ul>` we're using for navigation that do not meet the requirements for our navigation.

Every browser has an existing style sheet so that even when you create a completely unstyled page, there are *some* styles being applied. We overcome this as developers with advanced techniques like a "reset" style sheet (like [normalize.css](https://github.com/necolas/normalize.css/)) that removes all browser-specific styles. In this case, we're not going to go so far as to apply an entire reset group of styles, but merely override the ones that are annoying us and showing up in our layout.

**Remove the `list-style` that is causing the bullets to appear along with the list's padding and margin by adding a class to the navigation `<ul>` and a CSS rule.** Adding the class to the `<ul>` allows us to target it in our stylesheet without affecting other `<ul>`s.

```html
<div class="navigation-container">
  <ul class="nav">
    <!-- omitted -->
  </ul>
</div>
```

```css
.nav {
  padding: 0;
  margin: 0;
}

.nav li {
  list-style: none;
}
```

Refresh the page, and then use the developer tools of your chosen browser to inspect the element. Confirm that your style has been applied. Play with the rules inside the `.nav` rule set and refresh the page again. This is the typical workflow for integrating designs into your program. Make small changes, reload, and see how they impact the look and feel of your page. Rinse and repeat until you get something that's beautiful (or at least more like what you envisioned).

#### Styling the Navigation, Cont.

As you can tell, the navigation links aren't flowing horizontally like the mockup indicates they should. In order to get them flow horizontally we need to modify the [display property](https://developer.mozilla.org/en-US/docs/Web/CSS/display) of the `<li>` elements that make up the navigation.

By default, `<li>` elements have their display property set to `list-item`, which basically tells them to behave like `block` elements and form a vertical list.

**Change the display of the list items to `inline-block` in order to allow them to partially behave like a `block` element but to flow `inline` with the elements around them.** Here's how that rule would be set up:

```css
.nav li {
  display: inline-block;
  list-style: none;
}
```

Now that we have our elements flowing on the page how they should, let's apply some of the visual styling required to get our navigation to match the mockup.

**Apply a `background-color` and `border` to the container element of our navigation, matching the style shown in the mockup.**

```css
.navigation-container {
  border-bottom: 1px solid #000000;
  background: #2d2d2d;
}
```

View the page in your browser and you'll realize that there is some extra space between the edges of the page body and the edge of our navigation container.

**Modify the `body` element to remove any unwanted [margin](https://developer.mozilla.org/en-US/docs/Web/CSS/margin).**

```css
body {
  margin: 0;
  font-family: 'arial', 'san-serif';
  font-size: 14px;
}
```

**Remove the underline from the navigation links, set their color to gray, and set their hover state color to white.**

```css
.nav > li > a {
  display: block;
  color: #bbbbbb;
  text-decoration: none;
}

.nav > li > a:hover {
  color: #ffffff;
}
```

**Add an `.active` class to the "Search" link in the navigation. This class can
be used to signify which page the user is currently on and should share the same
styles as when one of the navigation links is being hovered over. You can share
the styles by separating the selectors with a comma as shown below.**

```css
.nav > li > .active,
.nav > li > a:hover {
  color: #ffffff;
  text-decoration: none;
}
```

Usually our server-side application would help us decide which page the user is currently on and add the `.active` class to it. Since we're not building a full app, add the style yourself to the HTML:

```html
<a class="active" href="#">Search</a>
```

#### Give Those Links Some Space

Our navigation is almost there, but the links can't breathe. They need some space! The best way to give the links some space is to adjust the padding and margin of their [boxes](https://developer.mozilla.org/en-US/docs/Web/CSS/box_model). Be sure to follow that link and familiarize yourself with the box model and the difference between padding and margin, which is a common "gotcha!" for someone new to CSS.

**Add some padding to our navigation links and they will be much happier.**

```css
.nav > li > a {
  display: block;
  padding: 10px;
  color: #bbbbbb;
  text-decoration: none;
}
```

### Styling the Search Form

Now that the navigation section meets the requirements of the mockup, let's move on to the search section. The content for our search container will be made up of a form. This form should have a `<label>`, `<input type="search">`, and a `<input type="submit">` to submit the form.

```html
<div class="search-container">
  <form>
    <label>Shmoogle</label>
    <input type="search" name="search">
    <input type="submit" value="Search">
  </form>
</div>
```

Since the default display value for a label element is `inline` and the default display value for an input element is `inline-block`, our elements are already flowing next to each other like we want them. We're not going to worry too much about the specific visual styling of the `<form>` elements because that would be outside the scope of this exercise.

#### Styling the Search Container

**Start by setting a `background-color` and `border` for the search container.**

```css
.search-container {
  border-bottom: 1px solid #e5e5e5;
  background: #f4f4f4;
}
```

**Now add some `padding-left` to line up the search container content with the first link in our navigation.**

```css
.search-container {
  padding-left: 10px;
  border-bottom: 1px solid #e5e5e5;
  background: #f4f4f4;
}
```

**Finally, add some `padding` to the top and bottom of the search container so that the search form has some room to breathe.**

```css
.search-container {
  padding: 20px 10px;
  /*  The above is shorthand for:
    padding-top: 20px;
    padding-right: 10px;
    padding-bottom: 20px;
    padding-left: 10px;
  */
  border-bottom: 1px solid #e5e5e5;
  background: #f4f4f4;
}
```

### Creating and Styling the Results

Our search results are going to be content added to our `.main-container`.

**Set up an ordered list, `<ol>`, because search results are in a specific order, where each `<li>` contains a search result.**

That should look something like the this:

```
<div class="main-container">
  <ol class="search-result-list">
    <li>
      <div class="search-result">
        <h3>
          <a href="#">Awesome Fake Result Title</a>
        </h3>
        <cite>www.awesomesauce.com</cite>
        <span>Something that is more awesome than awesome. It is a modifier of your basic awesome into a more awesome version.</span>
      </div>
    </li>
  </ol>
</div>
```

We could just use each of the list items as the container for a search result but, in this case, separating the styles for the search result list and the search results themselves will give us more flexibility. The search result list will be in control of handling the layout of the search results on the page while the search results themselves will only have to be concerned with the styles specific to an individual search result.

Since the styles are separated, we could place these individual search results anywhere on the page, even outside of the search result list. Their styling would not be affected and they would expand to fit whatever container they are placed in. Separating styles in this way becomes very important in larger applications by increasing the reusability of our code while also decreasing the cost of maintenance.

You might have also noticed that we haven't set explicit `width` or `height` values on any of our elements. This is a conscious decision that also helps us keep our code reusable. When we set specific dimensions on an element we are saying that it is only ever going to be this height or this width. It is much better to instead keep our styles separated like we have here with our search results. In most cases, it is best to create small reusable components that can expand or contract to fit into their parent container elements. This allows us to reuse these small components inside different containers while having to add as few lines of new code as possible.

#### Styling the Results Container

Now that we've got the correct elements on the page, let's make them match the mockup.

**Give the `.main-container` a `width` and some `margin` so that it matches the mockup**

```css
.main-container {
  width: 512px;
  margin-left: 135px;
}
```

We set the `width` on the `.main-container` rather than the `.search-result-list` for the reasons discussed at the end of the last section. Since this `width` is only set on the `.main-container` element, we could place the `.search-result-list` in another container somewhere else with a different width without needing to change any of the `.search-result-list` styles.

#### Styling the Results List

Now let's work on styling the `.search-result-list`. We set up an `<ol>` but we don't want to show the list item index numbers, which is the default list style for ordered lists.

**Remove that list style and the padding on the left of the search result list.**

```css
.search-result-list {
  padding-left: 0;
  list-style: none;
}
```

*Hint:* Refer back to the navigation section if you need help.

#### Styling Individual Results

On to the individual search results! They're not too far off but our title is pushing our citation too far away and our citation isn't on it's own line.

**Give the search result title its own class and modify its box and anything else necessary for it to match the mockup.**

```html
<h3 class="search-result-title">
  <a href="#">Awesome Fake Result Title</a>
</h3>
```

```css
.search-result-title {
  margin: 0;
}
```

By default, the `<cite>` element has a display of `inline`. Modify the `<cite>` element's styles so that it is on its own line and matches the style in the mockup.


```css
.search-result {
  display: block;
  font-style: normal;
  color: #009933;
}
```

#### All the Results

Let's see what our results look like when we've got more than one.

**Add another 9 results to your page (for 10 total) and preview what the page looks like in your browser.**

Oh no, they can't breathe! Use your knowledge of the box model to modify the search result list so that each of the list items has some space.

```css
.search-result-list li {
  margin-bottom: 30px;
}
```

### The Final Steps!

[Here's what you should have at this point](http://jsbin.com/suluqaroxu/1/edit?output).

**Bonus Challenge:** Use what you've learned to finish the page by styling the search filters to match the mockup.
