After all that complicated work with sizing our page elements, let's take a brief foray into the world of beautiful CSS backgrounds!

## Background Color

Let's start with the simplest option - and the most common! You can assign the property of `background-color` to pretty much any element. The color that you assign will appear everywhere that the element's *content* and *padding* area appears on the page. We can represent that with our "box model" like so:

![](https://s3.amazonaws.com/horizon-production/images/Box+Model+-+Background.png)

To assign a background-color to an element, use the following syntax:

```css
body {
  background-color: #FFD8DF;
}
```

As a helpful troubleshooting tip, when you're working with positioning elements and you're having trouble seeing where an element lies, it can be useful to temporarily assign a bright, garish background color to that element so you can see how much space on the page it takes up!

## Background Images

You can also assign an image as the background of an element!

Let's say we have a simple web page, and we want to set the background-image of the `body` element to a picture of this cute ghost in space:

![](https://s3.amazonaws.com/horizon-production/images/napstablook.jpg)

We can do that using the `background-image` property:

```css
body {
  background-image: url('https://s3.amazonaws.com/horizon-production/images/napstablook.jpg');
}
```

To reference where the image is located, you need to provide a string of some sort that tells the browser where to look for the image. If your image is a file within your project directory, you can use a local path like `'/images/napstablook.jpg'`. (Make sure to always include a slash at the beginning of your path name!) Alternatively, you can use a link to an externally-hosted image (aka an image that you find on the internet). (Word of caution: in general, do try to avoid externally-hosted images - their URLs may change meaning that your styles will break with no warning!)

Let's check out what our simple page looks like now that it has a `background-image`. (For this example, I also changed the color of the text and added some [text-shadow](https://developer.mozilla.org/en-US/docs/Web/CSS/text-shadow) for extra sp0ok value.)

![](https://s3.amazonaws.com/horizon-production/images/background-image-example-1.png)

We do indeed now have a background image, but it repeats all the way across the page, both vertically and horizontally!

By default, a background image will repeat along both the x and y axis to fill as much space as it needs. If you want this *not* to happen, you can change the `background-repeat` property. This will give you control over the horizontal vs. vertical repetition individually:

```css
body {
  background-image: url('https://s3.amazonaws.com/horizon-production/images/napstablook.jpg');
  background-repeat-x: no-repeat;
  background-repeat-y: no-repeat;
}
```

We can also choose to write this using a shorter syntax like so:

```css
body {
  background-image: url('https://s3.amazonaws.com/horizon-production/images/napstablook.jpg');
  background-repeat: no-repeat;
}
```

Let's take another look at our site, with this style added!

![](https://s3.amazonaws.com/horizon-production/images/background-image-example-2.png)

This is looking better(?) - at least now, the background image isn't repeated across the page. But now we have a bunch of white space where there isn't a background at all. What if we want the image to take up the full size of the page? Enter the `background-size` property!

```css
body {
  background-image: url('https://s3.amazonaws.com/horizon-production/images/napstablook.jpg');
  background-size: cover;
}
```

The `cover` value for `background-size` will tell the image to stretch to be as large as it needs to in order to make sure there is no white space left uncovered. The image will keep its width/height proportions, so it won't get distorted, but this does mean that depending on the exact dimensions of the element, sometimes parts of the item will be "trimmed off" or not visible on the page. In general, this is a very useful style nonetheless! You'll find yourself using it frequently when you work with background images. Let's take another look at our page.

![](https://s3.amazonaws.com/horizon-production/images/background-image-example-3.png)

Adorable - a true work of art. I think we can call this website finished.

There are indeed other possible values you can assign to `background-size`, but `cover` is by far the most useful. If interested, you can read more about `background-size` [here](https://developer.mozilla.org/en-US/docs/Web/CSS/background-size)!

## The generalized `background` property

You'll often see the property `background` used instead of `background-image` or `background-color`. For example:

```css
body {
  background: #FFD8DF;
}
```

Or:

```css
body {
  background: url('https://s3.amazonaws.com/horizon-production/images/napstablook.jpg')
}
```

Basically, the `background` property is just a shortcut for both `background-color` and `background-size`, and can be used largely interchangeably. Technically speaking, the generalized `background` property allows you to set *lots* of information about your background all at once, if you're so inclined, but of all things to know that's not a very useful detail. If you're interested in reading more about crazier stuff you can do with `background` and other background-related properties, you can check out [this link](https://css-tricks.com/almanac/properties/b/background/) - it's not required information though!

## [Optional] Getting Fancy with Gradients!

Are you ready to get a little bit crazier with your backgrounds? You can check out [this article](https://css-tricks.com/css3-gradients/) to learn how to create some cool gradients!

## Conclusion

You now should be ready to go out into the world and make your pages beautiful with backgrounds! Remember that you can apply a background to your entire page by using the `body` selector as demonstrated above, and you can also get more specific and assign backgrounds to particular page elements by using selectors to target them.
