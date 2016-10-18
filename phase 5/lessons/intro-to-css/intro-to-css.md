# Changing HTML with Style
### Looks vs. Layout

In the beginning, web pages looked more or less the same. It was basically text, rendered plainly on a web page. White backgrounds and black text were the norm, with the text reading from top-to-bottom in one large column. Links were blue before you clicked them, and purple afterwards. HTML had created a hard *dependency* between the layout of the website and the *look* of the website. What a given element was meant to represent (`p` means "some text") was forever tied to how the element rendered on a web page (`p` would always be in a generic font, a specific size, etc.)

As HTML and the web grew in popularity, there were a few attempts to remedy this. Initially, some new elements were created to manipulate text on the web pages in a way familiar to users of word processor, and some contained some level of customizability. `em` was introduced to mimic "Bold", `i` was introduced to render text in Italics, and `u` was introduced to give text an underline.

```html
<i>Italic text</i>
<em>Bold text!</em>
<u>Underlined Text!</u>
```

When the above is put into a `body` element and rendered by a web browser, it looks like this:

![](https://s3.amazonaws.com/horizon-production/images/R1EUeRj.png)
While that pattern worked, the differences between the layout and the design continued to be a strain on HTML. For instance, consider the header elements, labeled `h1`, `h2` (and so on until `h6`). Semantically, they referred to different levels of headers and subheaders. Practically, they told the browser to render the various elements as different sizes of text.

```html
<h1> A little bit softer now...</h1>
<h2> A little bit softer now...</h2>
<h3> A little bit softer now...</h3>
<h4> A little bit softer now...</h4>
<h5> A little bit softer now...</h5>
<h6> A little bit softer now...</h6>
```

Rendered by a web browser, the above produces the following:

![](https://s3.amazonaws.com/horizon-production/images/jvmAFue.png)

The problem came when a website wanted to vary from the patterns that the limited series of elements provided it. We may want to define something as a Header, but we may want it to be a different color, or a slightly different size. Separating HTML content from HTML presentation was an important concept for accessibility.

Software called "readers" could understand HTML and read its contents to the visually impaired end user. This works so long as the *semantics* of the html were correct. This means that Headers were appropriately labeled as `h1`,  However, if you only worried about what the website *looked* like, you may be inclined to just use whatever element *looks* right to you on the page. Moreover, what if I want my website to have a background, or for links to be red before they're clicked on? What if I don't want my website to be a single column of text, but instead a multi-column layout?

### Enter: CSS

Styling was introduced to HTML as a way to separate the concepts of presentation and structure of an HTML document. Now, HTML elements were more ambiguous: they helped you define *what* the element was meant to represent semantically, and the styles could let you design it however you want. We call the language and syntax used to write these styles "CSS", short for *Cascading StyleSheets*. More on that below!

With CSS, the simplest way to modify the aesthetics of an element is to add a new attribute, `style`, to that element.

```html
<p style="font-style: italic;">Italic Text!</p>
```

CSS is comprised of *properties* and *values*. *Properties* describe things about the HTML elements that we can change, and *values* describe all the different modifications that we can make.

In the above example, `font-style` is the property, and `italic` is the value. Note the other syntax: we use a colon to separate the property and value. Additionally, we end each line of CSS with a semicolon. If we wanted to add additional styles (like, for instance, if we also wanted our text to be green) we could just add an additional property/value pair:

```html
<p style="font-style: italic; color: green;">Italic Text!</p>
```

This is called 'inline styling', where you place the styles 'inline' with the HTML. While useful for spot jobs, the web quickly needed a way to get more expressive, more quickly. 

## An Element of Style

Today, CSS can live a number of different places in a website. When we have styles that we wish to apply to multiple HTML elements, we can use the `style` element. If our styles get large, we can move them into a separate file - a Stylesheet. We'll tackle the `style` element first.

The `style` element lives in the `head` element of your HTML document. Because we're outside of the element, we need a way to refer to the element we are attempting to style.  We use something called a *selectors* to accomplish this.

### Selectors

In its simplest form, the *selector* can be an HTML element. For instance, if we wanted all of our `p` elements to be 16px (pixel) font, italic, and blue, we could write this:

```html
<style>
p {
  font-size: 16px;
  font-style: italic;
  color: #0000FF;
}
</style>
```

Everything in between the curly braces (`{}`) will be assigned to any HTML element matching the selector - in this case, any `p` element!

The above value of `#0000FF` for `color` is called a "Hex Code". It's a way for the browser to look up *exactly* what color you want to use! You can find many hex code translators on the internet nowawadays. While the browser does come with some shortcuts (like `blue`), using the right hex code allows you to get exactly what style you want. 

Given the following HTML:

```html
<html>
  <head>
    <style>
    p {
      font-size: 16px;
      font-style: italic;
      color: #0000FF;
    }
    </style>
  </head>
  <body>
    <h1> This is a header! </h1>
    <p> and this is blue!</p>
  </body>
</html>
```

our browser will render the following web page:

![](https://s3.amazonaws.com/horizon-production/images/DvVv1Lw.png)

### Stylesheets

Earlier, we mentioned *Stylesheets* as a third option for styling our page. *Stylesheets* are external files that we include in the `head` element. They're arranged the same as a `style` element, just in another file.

In our `head`, we would use a `link` element (notably different than the `anchor` element that we use above to create hyperlinks). For a stylesheet found at the url `http://www.stylez.biz/stylesheet.css` that looks like this: 

```html
p {
  font-size: 45px;
  font-weight: bold;
  }
```

you would have a corresponding `link` element that looks someting like this:

```html
<link type="text/css" rel="stylesheet" href="http://www.stylez.biz/stylesheet.css" >
```

This will apply the styles found inside of that stylesheet to the page.


Stylesheets have additional benefits beyond allowing us to write our CSS in separate files. When we request a web page, we also request any external files (like *stylesheets*) linked to it. Our browsers have powerful features like *caching*, which will allow a web site to keep a version of its stylesheet with the browser after a user visits the page. The next time the user visits the page, the browser can use the local version of the stylesheet. This prevents an unnecessary HTTP call and improves user performance.

In the modern Web landscape, websites are styled by Stylesheets. They allow developers to extract the style concerns from the html concerns, putting them in two different files and linking them by convention. 

### Discovering more about CSS

Like HTML elements, there are [many different CSS properties](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference) considered valid by modern browsers. It is often helpful to think about what you want your elements to look like, and then try to find a CSS property that accomplishes that goal. CSS is nearly 20 years old, and browsers have changed quite a bit in that time. 

No developer is expected to carry all 20 years of syntax, updates, and compatibility with them at all times. These web references are not only useful, but *essential tools* in a developers toolkit. The best way to find help is through Google, trending towards well-sourced resources (like the [Mozilla Developer Network](https://developer.mozilla.org/en-US/)). We'll be going into many of the most important concepts in the upcoming lessons!


