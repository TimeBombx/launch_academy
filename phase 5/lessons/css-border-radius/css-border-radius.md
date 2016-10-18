We interrupt your regularly scheduled program to bring you this brief article on a very important(?) subject - making things round! (Or round-ish, anyways).

## The `border-radius` property

Now that you've learned all about sizing, borders, and backgrounds, you can learn about a fun little property called `border-radius`. Basically, it takes an element and makes its corners round. Let's say we have a simple `div` with a certain width, height, and background-color, and we give it a border-radius of 10px:

```css
div.my-fancy-box {
  width: 80px;
  height: 80px;
  background-color: #03A9F4;
  border-radius: 10px;
}
```

This will end up looking like so:

![](https://s3.amazonaws.com/horizon-production/images/border-radius-example-1.png)

Increasing the border-radius will make the corners more round, decreasing it will make the corners less round! Pretty simple.

If we increase the border-radius a ton, let's say to 2000px (or even just 40px), our div will end up totally round:

![](https://s3.amazonaws.com/horizon-production/images/border-radius-example-2.png)

We can also make something totally round by assigning the border-radius to a value of 50%. That will make sure that no matter how big the element gets, it will always stay in a round shape!

```css
div.my-fancy-box {
  width: 80px;
  height: 80px;
  background-color: #03A9F4;
  border-radius: 50%;
}
```

It is worth noting that if our page element is not perfectly square to begin with, it won't end up perfectly round either - instead, it'll be more of an oval. For example, if our `div` is extra wide like so:

```css
div.my-fancy-box {
  width: 160px;
  height: 80px;
  background-color: #03A9F4;
  border-radius: 50%;
}
```

...it'll end up being oval-shaped:

![](https://s3.amazonaws.com/horizon-production/images/border-radius-example-3.png)

## Round-shaped boxes vs. round-shaped content

It's important to know that even if give a `border-radius` value to a certain element, there's no promise that its child elements will respect the new, round-cornered constraints you have placed on the element. For example, here's some paragraph styling and the result as viewed on the page:

```css
p {
  background-color: #03A9F4;
  border-radius: 40px;
}
```

![](https://s3.amazonaws.com/horizon-production/images/border-radius-example-4.png)

As you can see, bits of text are poking over the edges of the round corners. In this case, we could fix this simply by applying some padding to the element so that the text isn't quite as squished up against the edges. (It would probably look better anyway that way!) But that won't always be a great fix. Let's say we're trying to style a profile picture:

```html
<div class="profile-pic">
  <img src="https://s3.amazonaws.com/horizon-production/images/border-radius-example-profile-pic.jpg">
</div>
```

```css
.profile-pic {
  width: 50px;
  height: 50px;
  border: 3px solid black;
  border-radius: 50%;
}

img {
  width: 100%;
}
```

The way we have things styled right now, our page will end up looking like this!

![](https://s3.amazonaws.com/horizon-production/images/border-radius-example-5.png)

Even though the `.profile-pic` div is round, its content (the `img` element) is not respecting its nice round boundaries. To deal with the problem, we can use the `overflow: hidden` property to hide anything that is rudely extending beyond our lovely rounded corners!

```css
.profile-pic {
  width: 50px;
  height: 50px;
  border: 3px solid black;
  border-radius: 50%;
  overflow: hidden;
}
```

![](https://s3.amazonaws.com/horizon-production/images/border-radius-example-6.png)

Much better!

## Conclusion

You should now know everything you ever wanted about making lovely round corners on your pages, and can henceforth use it with abandon!
