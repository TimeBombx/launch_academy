There are a several different factors that go into how much space an element will take on a page. CSS provides you with the tools you need to customize each one! In this article, we'll go over how to conceptualize and style the size of each element on your page.

## The Box Model

First of all, let's look at a broad picture of how the size of an element is determined. The **box model** is a particularly useful way of visualizing how your browser treats an element, and the space around it. The diagram looks like this:

![](https://s3.amazonaws.com/horizon-production/images/Box+Model.jpg)

Basically, the **content** of your element is surrounded by some amount of **padding**, **border**, and **margin**. Let's go into what each of those phrases mean!

## Content

![](https://s3.amazonaws.com/horizon-production/images/Box+Model+-+Content.png)

The "content" area of your element is, well, where the content goes! For example, if you're looking at a `p` element, the content area is the part of the element that can actually have letters in it:

![](https://s3.amazonaws.com/horizon-production/images/CSS-sizing-content.jpg)

In this image, we have a paragraph element surrounded by some padding, a border, and some margin. The content area is shown in blue - as you can see, it's the part at the very center!

There's no way to manually set *exactly* how wide your content area will be - that is determined automatically by your browser, which takes a number of different factors into account. We'll explain that process shortly, but first, let's take a look at padding, border, and margin!

## Padding

![](https://s3.amazonaws.com/horizon-production/images/Box+Model+-+Padding.png)

Padding constitutes the amount of space between content and the border.

![](https://s3.amazonaws.com/horizon-production/images/padding-vs-none.png)

As you can see, padding pushes the content area inwards, away from the edges of the element. This means that it directly takes away from the amount of space the content itself can take up. In the second paragraph shown above, the overall content space for the words to take up is a smaller width than the first!

You can set how much padding is on an element like so:

```css
p {
  padding: 10px;
}
```

That will set a padding of `10px` all the way around the element. You can also individually set different padding values for the top, bottom, left, and right sides of an object:

```css
p {
  padding-top: 50px;
  padding-bottom: 50px;
  padding-right: 10px;
  padding-left: 10px;
}
```

Some people prefer to write those different values all in one line, like this:

```css
p {
  padding: 50px 10px 50px 10px;
        /* top right bottom left; */
}
```

Or, as one more "shorthand" option, you could also write those values like this:

```css
p {
  padding: 50px 10px;
 /* top-AND-bottom left-AND-right; */
}
```

As you can see, there are many ways you could choose to write out these values, but they pretty much all accomplish the same thing - giving yourself some space between your content and its border!

## Border

![](https://s3.amazonaws.com/horizon-production/images/Box+Model+-+Border.png)

You can think of a border as defining the edges of an element. Padding specifics how much space there should be *inside* an element, between the content and the edges of the element. Border specifies what kind of design/color/etc. should exist at the edges of that element.

You can specify three things about a border: its color, its width, and what "style" you wanted it to be (i.e., solid, dashed, dotted, etc.). The syntax looks like this:

```css
p {
  border: 1px solid black;
    /*  width style color; */
}
```

Making a border very wide will also take away from the amount of space your content can take up:

![](https://s3.amazonaws.com/horizon-production/images/small-vs-wide-border.png)


As you can see, in the second paragraph shown here, the content has less horizontal space that's available to fill.

If you want to get specific, you can specify different kinds of border for different sides of your element. For any element, you can choose to specify some, all, or none of the following:

```css
p {
  border-top: 10px solid red;
  border-bottom: 5px dashed blue;
  border-left: 1px dotted green;
  border-right: 3px double #333333;
}
```

## Margin

![](https://s3.amazonaws.com/horizon-production/images/Box+Model+-+Margin.png)

Margin refers to the space around the *outside* of an element, separating it from other elements. For starters, let's look at two paragraph elements that have *no* margin:

![](https://s3.amazonaws.com/horizon-production/images/no-margin.png)

Since there's no margin around the outside of either element, they end up squished right against each other. On the other hand, let's see what happens when we put margin on the first element:

![](https://s3.amazonaws.com/horizon-production/images/some-margin.png)

Now, let's look at what happens if *both* paragraphs have 10px of margin around them:

![](https://s3.amazonaws.com/horizon-production/images/margin-around-both.png)

There's no more space between the paragraphs than there was in the previous photo! Why is that?

Basically, "10px of margin" is an element declaring, "No element shall enter within 10px of my noble self." If you have two elements who are both declaring that, they will sit nicely at 10px away from each other!

You'll notice that margin also affects how far away an element sits from the edge of the page. When an element has "10px of margin", it is also declaring, "I shall not allow myself to be within 10px of anything surrounding me!" This means that if the element would normally be the full width of the page, now it will be 20px narrower (since 10px of space need to be left on each side!).

Just like padding, you have some options as to how you write out your `margin` properties. This simplest version will create some amount of margin around all edges of the element:

```css
p {
  margin: 10px;
}
```

You can also declare different values for the top, bottom, left, and right edges of the element. All three of the following code examples are different ways of accomplishing the same thing:

```css
p {
  margin-top: 50px;
  margin-bottom: 50px;
  margin-right: 10px;
  margin-left: 10px;
}
```

```css
p {
  margin: 50px 10px 50px 10px;
        /* top right bottom left; */
}
```

```css
p {
  margin: 50px 10px;
 /* top-AND-bottom left-AND-right; */
}
```

### Centering elements with `margin: auto;`

There's one more important option to be aware of when setting your margins. Sometimes, you want an element to keep an *equal* amount of margin on its left and right sides - basically, to center itself! You can assign the property `margin: auto;` to an element to achieve that purpose. This will *only work* if the element *isn't* as wide as its parent element - in order to center itself in the surrounding space, an element needs some space around itself to work with. (The very next section will present how to change the width of an element to make this possible.)

`margin: auto` is only useful for centering something *horizontally* - vertical centering is a whole different topic. This means that if you want to set a `margin-top` or `margin-bottom` for the element, you can absolutely do that without interfering with the "automatic" margin on the left and right sides of the object. For example:

```css
.my-box {
  margin: 20px auto;
 /* top-and-bottom left-and-right; */
}
```

In the above code example, `.my-box` will have 20px of margin on the top and bottom, and will be horizontally centered inside its parent element. (A.k.a., it will have an "automatically calculated" amount of margin on its left and right sides!)

We could also write the same code as follows:

```css
.my-box {
  margin: auto;
  margin-top: 20px;
  margin-bottom: 20px;
}
```

In this example, we're setting the overall value of `margin: auto`, and then getting a little more specific to say that actually, we want there to be a `margin-top` of 20px and a `margin-bottom` of 20px. This will have the exact same results as the first code example - you can write it however makes most sense to you!

Remember, this will only be useful if the element is *not* the full width of its parent element - so let's move right along to that topic!

## Changing the width of an element

By default, HTML elements have a `width` of `auto`, which means that their width will be automatically calculated by the browser. The element will start stretching to fill the full width of its parent element, and then if there is `border`, `margin`, or `padding` on the element, those things will decrease the width that the element's content area can take up.

However, you can also choose to explicitly set the width of an element to a certain value! You do that like this:

```css
p {
  width: 200px;
}
```

This means that from border to border, the paragraph element will be 200px wide. The padding and border both fall inside that 200px. The margin does not get included in the width!

![](https://s3.amazonaws.com/horizon-production/images/Custom+Width+w-+margin-border-padding.png)

### Percentage-Based Widths

You can also tell an element to take up a certain **percentage** of its parent element's width.

```css
p {
  width: 50%;
}
```

This means, no matter what HTML element the `p` is nested inside, the `p` will end up being half that parent element's width.

### Partially-Specified Widths

Sometimes you might not want your elements to get super-wide or super-narrow, the way they might if you were viewing your website on a very wide screen or a very narrow one. `max-width` and `min-width` are two properties you can use to limit the width of your element. For example:

```css
p {
  max-width: 960px;
}
```

In this case, the `p` element will exhibit its normal behavior or stretching to fill the full width of its parent element - right up until the `p` element reaches `960px` wide, at which point it will stay that width no matter how much wider the page gets.

This can also combo out with other width declarations:

```css
p {
  width: 75%;
  max-width: 960px;
}
```

In this example, the `p` will be 75% the width of its parent element until the `p` reaches `960px` wide, and then it will grow no further!

Now let's look at `min-width`:

```css
p {
  width: 25%;
  min-width: 120px;
}
```

In this example, if you drag the width of the window to get narrower and narrow, the `p` tag will get narrower as well to only take up 25% of the width - up until the point the `p` element is only 120px wide, and then it will stay that width and not get any narrower.

As a quick additional note, it's completely acceptable to use both `max-width` and `min-width` on a single element!

## Setting Height

The height of an element is normally calculated based on how much content that element contains. A paragraph with a lot of text inside will simply stretch in height until it fits the entire chunk of text inside, and that will be its height! Accordingly, the narrower a paragraph gets, the more height it will take up in order to fit all its contents.

However, if you want, you can manually change that! Just like you set the width of the element, you can also set the height of an element:

```css
p {
  height: 200px;
}
```

For elements like `p` tags, this is fairly bad idea, since you're setting yourself up for trouble when the contents of your paragraph overflow the height you have arbitrarily set for them. (More on that later!) However, for some types of elements, this is really useful! For example, let's say we want to make a header that's a different color from the rest of the page, and we want that to be a specific height.

```css
nav {
  height: 80px;
  width: 100%;
}
```

Now our nav bar will be the full width of the page, but only 80px tall! And unlike a paragraph, our nav bar is unlikely to change in content size to create overflow.

## Dealing with Overflow

As mentioned above, sometimes you'll run into the situation where the **contents** for an element overflow the amount of space you've dictated that element should have. Now we need to worry about what happens with the `overflow` of that element.

The `overflow` property describes what should happen with the extra content that does not fit inside an element. This should (almost always) only become relevant when you've done a bad job with explicitly setting the height for an element - in which case, change that, or get rid of your explicit `height` declaration altogether! But overflow is still a good thing to know about.

By default, the `overflow` property is set to `visible`. This means any extra content will just flow over the edges of the element:

![](https://s3.amazonaws.com/horizon-production/images/overflow+visible.png)

This means that if we had another paragraph after this one, they would end up looking "smooshed together" even though we have margin separating them. This is because the margin separates the two **edges** of the paragraph elements from each other, but content overflow just totally ignores the edges of the elements and goes wherever it wants.

![](https://s3.amazonaws.com/horizon-production/images/overflow+visible+with+two+items.png)

However, we can change the styles on this element to make it such that overflow gets hidden from view:

```css
p {
  /* These are the pre-existing styles on the element shown in the image */
  width: 200px;
  height: 112px;
  border: 2px solid black;
  padding: 10px;
  margin: 10px;

  /* This is the new style to hide the overflow */
  overflow: hidden;
}
```

![](https://s3.amazonaws.com/horizon-production/images/overflow+hidden.png)

As a solution to our paragraph problem, this isn't ideal - this just hides the content that was giving us trouble. In this situation, we should really just remove the `height` property from the paragraph and allow it to stretch to contain all its contents. However, there may be situations in which you truly do want to hide the overflow from an element!

We do have one more option available to use for what to do with overflow - adding scrollbars - but this is such a bad option that I'm not even going to go into it here. You can read more about overflow [here](https://developer.mozilla.org/en-US/docs/Web/CSS/overflow) if you're interested!

## In Conclusion

You should now have a basic understanding of what the CSS Box Model is, and how it represents the space around and inside an element. `border`, `margin`, and `padding` all play into an element's size, and how it looks on the page both independently and in relation to other elements. You can manually set the width and height of an object, but be careful when setting the height! With these tools, you are now better equipped to start making beautiful custom layouts of your pages.
