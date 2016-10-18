# Reading HTML Web Pages
## What Makes A Web page?

The main difference between a web page and a text document is the intended audience. Text documents are written to be read by humans, while web pages are text documents written to be read by a computer (or more specifically, a *web browser*).

![An HTML Document](https://s3.amazonaws.com/horizon-production/images/vpzaHSh.png)

Web Pages are written in *HyperText Markup Language*, more commonly referred to as *HTML*. HTML describes to a web browser exactly how to lay out the different pieces of the HTML page, and how to link those different pages together.

Before its adoption on the web, HTML began as a way of linking traditional text documents to one another. Before the internet as we know of today, computer scientists conceived of the need for a way to link different kinds of texts to one another using their computers.  They imagined dictionaries that would link synonyms to one another, and choose-your-own-adventure-stories that did the page-turning for you. They called this *Hypertext*, and, as a concept, it predates the internet by several decades!

By 1995 the usefulness of *Hypertext* was recognized by those looking to build on the Internet, and so the HTML language was finalized and codified into the [HTML 2.0 spec](https://tools.ietf.org/html/rfc1866). The spec refers to HTML as "platform independent". This means that any browser or device can be made to read HTML and display it to users as a web page without any third-party interference or proprietary licensure. This was *very* important in the adoption of HTML, as it meant that users could choose whatever browser they preferred to view it. The browsers were also happy to have a standard that they could build against, which allowed them to adopt new features as new standards were released.

When you view a web page on a browser, you are just reading an HTML document - written for a browser, which translates the document into a human readable web page.

![Google, Rendered vs. HTML](https://s3.amazonaws.com/horizon-production/images/ONv5zud.png)

## Elements
 
Instead of plain text, HTML uses the `tags` to create `elements` of HTML.`tags` are the building block of HTML, and when an *opening* and *closing* tag are used together, they create an *element*. These elements are rendered by the browser into the text, images, and shapes that you see in your browser.

For instance, `p` is a tag that HTML understands as *paragraph*. It is used to define a chunk of text that is meant to be displayed as plain text by the browser.

We create an *opening* tag using the less-than and greater-than signs, like this:

```html
<p>
```

We can create a closing tag the same way, but this time we also include a slash right before the `p`.

```html
</p>
```

When we combine them, we put the text we want displayed to the user in between. 

```html
<p>Hello, World!</p>
```

This is now a complete HTML element, complete with an opening tag, a closing tag, and content (Here, "Hello, World!").

## Structure of Web Pages

Web pages are html files composed of several elements, some nested inside of each other, as according to the HTML spec.

Here's an example of a simple HTML page with some commonly found elements.

```html
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>You can see me in the title bar!</title>
    <link rel="stylesheet" href="../css/style.css">
    <script type="text/javascript" src="../script.js"></script>
  </head>
  <body>
    <p>Hello, World!</p>
    <script type="text/javascript" src="../big_script.js"></script>
  </body>
</html>
```
And this is the HTML written above when rendered into a web page by a web browser. 

![](https://s3.amazonaws.com/horizon-production/images/tTClqty.png)

It's not much, considering how complicated the HTML looks - however, we're writing HTML for the computer, and there's more going on under the hood than the rendered page suggests.

## How Computers Read Websites

The browser reads html documents top-to-bottom, left-to-right. When it gets to the end of a line, it sends that line to be processed by the browser. That code may render some visual element to the browser, but there are many other things that an element can do. It might convey some critical information behind the scenes, or trigger the browser to fetch an additional resource. 

When we look at the example HTML, let's go through it like a browser would: top-to-bottom, left-to-right. 


### The Doctype

Our HTML document starts with this element:

```html
<!DOCTYPE html>
```

This line describes to the browser what kind of document this is - in this case, `html`. This is a way of declaring to the browser that you are not only using HTML, but the latest adopted standard of HTML. Older browsers will see this, not understand it, and switch into a mode that will ignore whatever small parts of the HTML it doesnt understand. 

You'll note that this element only contains a single tag, the `!DOCTYPE` tag, and no closing tag. This is an exception of the opening/closing bracket convention of HTML elements, a standard inhereted from older versions of HTML.

### the HTML Element

The opening `html` tag is the very next line on the document, and the closing tag is the last line of the document. The 'content' of this element is the rest of the HTML document itself! The `html` element is the *parent* element, and all of the nested elements are its `child` elements.

```html
<html>
  <head>
    <meta charset="UTF-8" />
    <title>You can see me in the title bar!</title>
    <link rel="stylesheet" href="../css/style.css">
    <script type="text/javascript" src="../script.js"></script>
  </head>
  <body>
    <p>Hello, World!</p>
    <script type="text/javascript" src="../big_script.js"></script>
  </body>
</html>
```
That's the very function of the `html` element. It tells the browser: "Everything nested inside of me is considered part of the HTML Web Page." It may also contain other important accessibility information, like the page's language.

### The Head Element

The next element is the first nested inside of `html`: the `head`. 

```html
<head>
  <meta charset="UTF-8" />
  <title>You can see me in the title bar!</title>
  <link rel="stylesheet" href="../css/style.css">
  <script type="text/javascript" src="../script.js"></script>
</head>
```
The `head` element is another *parent* element, like `html`.  It also conveys a very particular message: "Everything nested inside of me is setup for the HTML Web Page." 

Nothing inside of the `head` is directly rendered by the browser but it contains important details for the page. We load it first so that the browser gets all that it needs to prepare to render the page itself.

### The Meta Element

The first child element of `head` is a simple `meta` element.

```html
<meta charset="UTF-8" />
```

The `meta` tag describes extra information to the browser that describes the HTML document as a whole. Here, this classifies the character set (the collection of symbols the browser will need to know how to render) as `UTF-8`, a common standard.

This tag also has no matching closing tag. Instead, it ends with a `/` preceding the final `>`. This is an example of a 'self-closing tag', a way to write some elements with a single tag.

### The Title Element
The next child element of `head` is the `title`. 

```html
<title>You can see me in the title bar!</title>
```

The Title has a very important purpose to the end-user: it sets the 'title' property of the page, telling your browser what to display in the window/tab displaying the code. This is one of the few things in the `head` with a direct correlation to the end user. 

### The Link Element

```html
<link rel="stylesheet" href="../css/style.css">
```

These next two elements - `link` and `script` - each perform similar, but distinct tasks. They each supply the HTML page with important external resources. 

`link` is an element whose entire purpose is to tell the browser to 'fetch' more information from another resource. In the above example, we use the `rel` attribute to signify this is a *Stylesheet*, and the `href` attribute tells us where we can find the other resource. Here, we find the stylesheet in a `css` file local to the HTML file we've created! 


### The Script Element

```html
<script type="text/javascript" src="../script.js"></script>
```

`script` is similar to `link`, and in this case is being used in a manner similar to `link` - telling the browser to fetch external resources. However, this resource is a little different: It is linking to a *Javascript* file. 

*Javascript* is a browser-native language. That means that the web browser can execute Javascript code without any additional help, making it a very useful tool for Web App creators. When we signify the `type` as `"text/javascript"`, we are telling it what kind of script this tag will be using. We also include the path to the javascript file in the `src` attribute. 

You'll note that `script` has no inner content between the opening and closing tags, yet does not use self-closing tags. This is because you can omit the `src` attribute entirely and put the javascript code in between the opening and closing `script` tags, right there in the `head`. Typically, Javascript is important enough to warrant its own file.


### The Body 

We've hit the closing tag of the `head` element, and now the browser knows exactly what it will need to render the page. The next element, the `body`, explains what should get rendered to the page. 

```html
<body>
  <p>Hello, World!</p>
  <script type="text/javascript" src="../big_script.js"></script>
</body>
```

`body` is another parent element that contains several nested elements. Though `body` contains no styling of its own, the child elements of `body` probably do - but not necessarily. 

Inside of `body`, we find two familiar tags: `p` (meaning 'paragraph'), which contains text meant to be displayed. This makes sense to go in the body; it pertains to what the page should look like. 

The second is another `script` tag, which has no graphical representation in the resulting web page. We put it at the end of the `body` because (as the name of the file suggests), this Javascript is a *big file*. While normally JS files would go in the `head`, the browser will linger on understanding a line until its resources are completely downloaded. Putting this line inside of the `head` might delay the browser in rendering the page, which is a bad experience for the end-user.

## HTML Structure conclusion

The above HTML document is just one example of a common HTML layout. While all HTML web pages will contain `html` tags, a `doctype`, a `body`, and likely a `head`, they may or may not contain any of the additional tags inside of it. It's up to the developer to make the decisions towards everything else that goes inside. 
