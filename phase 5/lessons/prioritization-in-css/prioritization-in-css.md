In your work with CSS, you've been styling elements using style declarations like this:

![](https://s3.amazonaws.com/horizon-production/images/css-anatomy.png)

The elements that you style will end up getting quite a number of style declarations applied to them, from a variety of different sources. As you've seen in some of your previous work, sometimes you'll end up writing conflicting declarations for the same property. In cases like these, your browser will need to decide which conflicting declaration it should apply. For example:

```html
<h1 class="site-title">Some Awesome Title</h1>
```

```css
.site-title {
  color: blue;
}

h1 {
  color: green;
  font-weight: normal;
  text-decoration: underline;
}
```

In the above example, the `h1` is getting styling instructions from both blocks of CSS. `font-weight: normal;` and `text-decoration: underline;` will both get applied to the element with no trouble, since there are no conflicting style declarations anywhere else in the file. However, we can see that there are two conflicting declarations for the `color` property.

To decide which conflicting declaration to use, the browser will follow the *rules of prioritization* (explained below) to determine which one to apply. Depending on where a styling declaration came from, and how it was defined, it can be more or less important than other, conflicting declarations.

It's important to note that these rules of prioritization are calculated for *each individual* style declaration, not for an entire block of CSS. In the example above, the `color: blue;` rule will override the `color: green;` rule, but the `font-weight` and `text-decoration` rules will go along their merry way undisturbed.

Without further ado, let's get into the steps that your browser takes to prioritize conflicting style declarations!

## Sorting by Source
The first step your browser takes is to order any conflicting declarations in priority based on where they came from. The stylesheets you write are not actually the only source of CSS on a webpage - although they are the most important! Here are all the different sources explained, in order of *lowest* to *highest* priority.

### The browser's default style
Your browser comes with a set of default styles that it applies to each HTML element, so that it knows how to display things in case you don't provide those declarations yourself. These styles are really boring and icky-looking, like so:

![](https://s3.amazonaws.com/horizon-production/images/browser-defaults.png)

You'll learn about how to use the Chrome inspector to view Chrome's default stylings in a future article. For now, though, don't worry about what the specific browser defaults are - just know that they're there, and your browser will use them as a fallback for anything you haven't defined a style for! Browser defaults are the *least* important set of styles in the cascade, so they will be overridden by anything you write.

### User-specified styles

It's possible for the user of your web page to write their own styles that get applied on top of it. For example, a browser plug-in might take a user's stylesheet and apply it to all pages they visit, with the intention of hiding comments and ads. These styles take priority of the browser defaults, but not above the styles you write yourself. This is a rare case you don't need to worry about much - it's just good to know it's there!

### Your own stylesheets

These rules will be considered the most important!

## Sorting by Selector

Once the browser has prioritized things in order by source, it still has some work to do. Within your own stylesheet, there are likely to still be some conflicting declarations that the browser needs to prioritize (like in the example at the top of the page!). It does this by calculating the *specificity* of the selector that went along with this particular declaration - the higher the specificity, the more important this particular declaration is.

In terms of nitty-gritty details, your browser does some pretty complicated calculating to figure out the exact "specificity value" for each property, by doing stuff like adding up lots of "specificity points". However, we only really need to worry about the *general* order in which your browser prioritizes things. That general order is:

### Inline styles

Inline styles look like so:

```html
<h1 style="color: red">Hello World</h1>
```

Your browser will assign top priority to style declarations that are written like this example. However, **you should never do this!!!** To keep your code clean and manageable, all your style declarations should live in your stylesheets, not your HTML file. There are better ways of getting specific, I promise! Such as...


### ID selectors

```css
#nav-bar {
  background-color: blue;
}
```

ID selectors are pretty darn specific - they should always be targeting one element, and one element only! Accordingly, your browser places pretty high value on them. If you use an ID selector for a style declaration, like above, that declaration will get priority over most other rules.

### Class selectors

```css
.product-description {
  font-size: 11px;
  font-style: italic;
}
```

Class selectors, like the one shown here, are next in the priority list. If there aren't any style declarations that were written using an ID selector, these guys will get the next highest pick when your browser is deciding which conflicting declaration to apply.

It is worth noting that sometimes you can have many classes in a single declaration:

```css
.product-list .product-description {
  /* this selector is looking for .product-description elements
     that are nested inside a .product-list element */
}

.product-description.favorite {
  /* this selector is looking for .product-description elements
     that *also* have the class .favorite */
}
```

Both of the selectors shown here would take priority over the selector that just reads `.product-description { ... }`. When multiple classes appear in a single selector, your browser simply adds up how many are listed. The more class selectors you have for a single declaration, the higher the priority. (No matter what, though, it'll pretty much never be enough to overtake the importance of an ID selector! ID selectors still come out on top.)

### HTML selectors

Lowest on the priority list are the good old HTML selectors:

```css
h1 {
  color: red;
}
```

If these conflict with any other style you've written, they'll get the lowest priority. This makes them great for setting some "default" styles for your site - you can then use more specific selectors later to overwrite your "default values" in certain specific scenarios.

Just like with class selectors, the more HTML elements you use in a single selector, the more "specific" that selector will be. For example, this selector:

```css
nav h1 {
  color: red;
}
```

...will take priority over this selector:

```css
h1 {
  color: blue;
}
```

## Sorting by Location

Once your browser has prioritized all conflicting style declarations using the above rules, it's possible there might still be some ties for top place. For example, maybe one element has two different class names, each of which has a conflicting declaration associated with it:

```html
<div class="product featured"> ... </div>
```

```css
.product {
  background-color: grey;
}

.featured {
  background-color: green;
}
```

Or maybe you even accidentally wrote conflicting rules for the exact same selector!

```css
.product {
  background-color: grey;
}

/* ... later on in your stylesheets ... */

.product {
  background-color: blue;
}
```

In cases like these, when there's a "tie" between the specificity of two different declarations, your browser will always choose the one that was defined *later* in your stylesheets. The later it gets processed by your browser, the more important it will be in case of ties!

## The `!important` exception

The `!important` keyword is something you can add to a style declaration to make it automatically take precedence over everything else, no matter what, period. If a browser sees a declaration with the `!important` keyword, it will *always* bump it up to the very top in terms of priority. The syntax looks like this:

```css
h1 {
  color: red !important;
}
```

However (and this is !important) - you should **NEVER EVER** use this! Using the `!important` keyword is a dangerous crutch to lean on, and will lead you to write bad code. Sometimes, it'll seem like an easy fix for some problem you're having, but will only run you into greater debugging problems down the road. Especially in large applications, it can be a nightmare to deal with when it's scattered around too much, so it's best to get in the habit of avoiding it early. There are always different solutions for whatever problem you're having!

Now that we've hopefully deterred you, let's talk a little more about how this keyword works in terms of priority. Sometimes (if you've been a bad bad person) you might have code with conflicting `!important` declarations. If this happens, your stylesheet will fall back on the rules of priority listed above to decide which of those two declarations take effect. But let's hope it never comes to that.

## In Conclusion

You should now hopefully have a better understanding of which of your CSS rules will take priority, and when. It's important to have a broad-level understanding of this, but don't worry too much about memorizing the details - in coming articles, you'll learn how to use the Chrome inspector to visually see which styles have been overridden, and which are being applied.

To wrap up, let's discuss some general "best principles" with CSS, as they relate to specificity and prioritization. As you can see, you have the ability to get really, really specific with your CSS. Even if you avoid inline styles and the `!important` keyword, you could still end up with something like:

```css
body div.#page-body .header #nav-bar #site-title a {
  ...
}
```

...which is pretty darn specific. However, this is actually really badly-written CSS. As a good rule of thumb, you should generally try to be as **non-specific as possible** when writing your styles, and only add specificity when you really need to.

For example, if I want all the `h2`s on my homepage to be blue, I could go through and add a class to each one:

```css
.blue-header {
  color: blue;
}
```

...or I could specify that I'm looking for all the `h2`s inside my `body` tag:

```css
body h2 {
  color: blue;
}
```

...but neither of these is adding a *useful* level of specificity, at least given this particular context. Instead, I should really just reference these elements by their HTML tag!

```css
h2 {
  color: blue;
}
```

That way, when it comes time to override that general style declaration in some specific situation (say, if I want to make one specific `h1` green), it's nice and easy to make a more specific style declaration that targets only the `h2` that I want to change. This way, I can avoid crazy "specificity wars" in which I'm needing to do all sorts of weird stuff just to get a certain style to take effect!

As one more example, let's say I'm styling the links inside this header:

```html
<nav class="topbar">
  <ul>
    <li><a href="#" class="nav-link">Home</a></li>
    <li><a href="#" class="nav-link">About</a></li>
    <li><a href="#" class="nav-link">Contact</a></li>
  </ul>
</nav>
```

It might be tempting to write a CSS selector that looks like this:

```css
.topbar ul li a.nav-link {
  color: red;
}
```

But the level of specificity I get by listing out *all* the class names and HTML tags is really not helping me at all. Instead, I could just do something like this:

```css
.topbar a {
  color: red;
}
```

...or better yet, just call these elements by their class name directly!

```css
.nav-link {
  color: red;
}
```

Now this CSS is extra readable, and easier to maintain in the future.
