# Exploring HTML Elements And Attributes

HTML elements were built to extend certain conveniences to early web developers. Some critical elements - like the hyperlink between two web pages - needed more than just content. They needed a way to 'point' to another resource. 

To this end, html uses `attributes` to define this extra information. Attributes go in the opening tag of an HTML element, and they contain values that alter the behavior of the resulting web page. 


### Anchors and `href` 

Here's a hyperlink to Amazon.com, rendered in an *anchor* element.

```html
<a href="http://www.amazon.com/">Visit Amazon!</a>
```

The `<a>` tag has one attribute - `href` - that holds the value `"http://www.amazon.com/"`.

The content of the `a` element ("Visit Amazon") will be rendered to the browser as a hyperlink that, when clicked, will visit `"http://www.amazon.com/"`.

`href` is a very powerful (and plentiful) attribute, but it can not be used on every element. Putting it on a `<p>` tag would do absolutely nothing! There are many attributes - like `href` - that solve specific use-cases in specific `html` elements, while others are Global.

### Images`src`, and `alt`. 

The `img` element renders an image to the web. The `src` attribute, like `href`, points the browser to the location of the resource relevant to the element - in this case, an image file! 

Another attribute, `alt`, provides browsers with a plaintext description of the image. This is useful for the visually impaired, and those reading the web through an accesibility device. 

```html
<img src="/images/wildcat.png" alt="A Picture of a proud, earth-based wild cat." />
```

Both of these attributes are, like `href`, only useful on certain elements. Let's look at some global attributes next!

### `class` and `id`

HTML gives us two powerful attributes that we can use to catalog and organize our HTML: `class`, and `id`. 

`class` can be added to any element, and is composed of strings seperated by a space. Here's an `img` element with the class `profile-photo` and `rounded`: 

```html
<img src="/images/users/1232/profile.png" alt="" class="profile-photo rounded" />
```

HTML classes are particularly useful when styling elements on a page with CSS, as there can be any number of items on a page with that class!

The `id` attribute is more specific. They highlight important aspects of the page, and provide an additional functionality through the browser. Specifically, the browser can automatically scroll to any HTML element that contains an `id` by appending that `id` to the end of the url. 


If we add an id to the image tag above, it would look like this: 

```html
<img src="/images/users/1232/profile.png" alt="" class="profile-photo rounded" id="main-photo" />
```

It's possible (but a little unconventional) for a single element to have multiple ID's. It is not a good practice to have multiple elements share the same ID, however. ID's are meant to be singular, and for that reason are often used in targeting specific elements with Javascript.

These two are the most common attributes you'll write as you explore HTML and they help your HTML become more *Semantically Understood*. By labeling the `class` of an element, you can not only style it a particular way, but describe its purpose in the HTML page. 


## Nesting Elements: `div` and `span` 

Some HTML elements serve a more abstract, organizational purpose. The `div` element is one such case. 

`div` elements have no visual component in their rendering. Instead, `div`s help us organize other elements under one grouping. This becomes critical when trying to position elements on a screen using CSS, and is very useful for creating clean, organized HTML. 

We can use the `div` element by wrapping it around other, 'child' elements. 

```html
<div id="header">
  <p id="headline"> Bees Attack Local Mausoleum! </p>
  <p id="subhead"> "We don't really have a code for this", local police say </p>
  <p id="byline"> 
    <span class="subtext">
      by
    </span>
    Alec Jarble 
  </p>
</div> 
```

Here, the `div` class wraps three child `p` elements to signify that these elements constitute the "header". `div` is a class made for nesting, but it is not the only class that can nest elements inside of itself! 

The last `p` element in the `header` is the `byline`. That `p` element has a child element itself - the `span` element. `span` serves a similar function to `div`, but it is made especially for working with text. We can apply a slightly different style (the `subtext`) to the 'by', and let the Author's name take on a more important style. 

Many of the elements with opening and closing tags have the ability to nest other elements inside of them. 

For instance, what if we wanted to make an image a hyperlink? 

```html
<a href="/users/1232">
  <img src="/images/users/1232/profile.png" alt="" class="profile-photo rounded" id="main-photo" />
</a>
```

## ...And Many More! 

There are [lots](https://developer.mozilla.org/en-US/docs/Web/HTML/Element) of HTML elements that a browser can understand, and plenty of attributes to match. While committing all of them to memory could be impressive, learning HTML is a process of using what you know to find the next tool you need. When you find it hard to accomplish what you are doing, look into new and different HTML structures that may be useful to you! 



