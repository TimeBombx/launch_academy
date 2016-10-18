# Using the Chrome Inspector

The Chrome Inspector is one of most useful tools for front-end development. Similar to how a `binding.pry` in Ruby allows you to examine what's happening under the hood as a program runs, Chrome Inspector allows you to examine your HTML and CSS on a web page in an interactive way. Now that you have quite a number of your core building blocks for HTML and CSS, you'll start moving on to creating more complex projects. As you do, it will be crucial to use the Chrome Inspector as a regular part of your workflow!

## Entering the Chrome Inspector

Right click on an element on the page. Click "Inspect Element" from the dropdown.

![](https://s3.amazonaws.com/horizon-production/images/Rp7esdg.png)

## Viewing elements

You can look at the HTML code that generated this page in the main window of the inspector. Click the small arrows next to each element to collapse/expand your view of the elements that are nested inside that one. When you hover over each line of code, you can see that element highlighed on the page itself.

![](https://s3.amazonaws.com/horizon-production/images/TRh733a.png)

## Selector Tool

The selector tool provides another way to see which parts of the page correspond to what HTML code. You can turn on the magnifying glass tool by clicking the button in the top left of the Inspector screen:

![](https://s3.amazonaws.com/horizon-production/images/TJqJeVR.png)

(NOTE: In newer versions of Chrome Inspector, the icon for this tool looks like a mouse hovering over a box. It is still in the same location on the top left of the inspector screen!)

Once Magnifying Glass mode has been turned on, you can mouse over different parts of the page and see them highlighted. When you click on one, it'll highlight the relevant piece of code for that item.

![](https://s3.amazonaws.com/horizon-production/images/al6r59R.png)

## Box Model

As you learned, every HTML element can have 0 or more padding, margin, and border.

- Margin specifies the space between the outside edges of an element and its neighbors.
- Border specifies the width of the border outlining the edges of the element.
- Padding specifies the amount of space between an elements border, and the stuff that lies inside that element.

This is usefully demonstrated with the "Box Model" - a simple image that shows how much margin, border, and padding is on an element. The Chrome Inspector's representation of the box mode looks like this:

![](https://s3.amazonaws.com/horizon-production/images/Ai9jiUR.png)

This image shows the amount of margin, border, and padding on each side of the element. Numbers represent number of pixels; dashes represent 0. The blue box at the center represents the size of the element itself.

One awesome feature of the Chome Inspector is that it provides you with a "box model view" of any element on the page. Once you've highlighted a line of code on the main window of the Inspector, you can scroll all the way to the bottom of the rightmost Inspector pane to see the box model for that element:

![](https://s3.amazonaws.com/horizon-production/images/CbmyLzw.png)

You can also use the colors specified in the box model to see how margin/border/padding/element size are arranged on the page itself. When you get an element higlighted, you may notice several colors of highlighting. Just like in the box model, orange represents the margin around the object, yellow is the object's border, green is the padding around the object, and blue is the main body of the element itself. This can be very useful in determining what stylings are being applied to an element.

## Viewing the styling that's applied to an element

When you click on an element's HTML tag in inspector, you can see a section to the right half of an inspector screen that looks like a list of CSS styles:

![](https://s3.amazonaws.com/horizon-production/images/QgV3bLK.png)

In this section, you can see quite a number of things:

#### 1. The styles that a certain stylesheet provides for this particular element

![](https://s3.amazonaws.com/horizon-production/images/RWe2pjg.png)

If you have multiple stylesheets, or reference the same element multiple times in your stylesheet, you will see multiple sections of the page that look like the box explained above. They are listed from top to bottom in order of importance. (I.e., the top ones will override the lower ones if there are conflicting styles between the different sections.)

#### 2. Default styles that your browser applies to an element

Your browser has default styles it'll apply to elements:

![](https://s3.amazonaws.com/horizon-production/images/RcHviGT.png)

#### 3. Styles that have been overridden by other styles

If a style exists, but is not being applied because a *different*, conflicting style has been applied to the element (and takes greater importance). This mean it is not actually affecting the look of things on the page.

![](https://s3.amazonaws.com/horizon-production/images/spSrgaa.png)

#### 4. Styles that get inherited from parent elements

There are certain style rules that get inherited from an element's parents. Good examples are font/text styles: `color`, `font-size`, etc.

![](https://s3.amazonaws.com/horizon-production/images/T1ey3FC.png)

## Changing the styles on an element

Besides seeing what styling has been applied to an element, you can mess around with the stylings that are being rendered on the page. (Note: this does NOT change the actual source code, this just changes what your browser is rendering for you!)

#### Change existing styles

![](https://s3.amazonaws.com/horizon-production/images/x30abZA.png)

#### Add styles to one particular element

If you want to see how a style looks when applied to one particular element, do the following:

![](https://s3.amazonaws.com/horizon-production/images/gSgGMtP.png)
![](https://s3.amazonaws.com/horizon-production/images/XPgv15d.png)
![](https://s3.amazonaws.com/horizon-production/images/cny9Nor.png)

This will direct the browser to display this style as applied directly to *this one element*. Not all elements that are *like* this one, not all elements with the same name, just *this one* particular thing. Useful sometimes, limiting at other times!

#### Adding styles to the existing styles for a particular selector

This lets you change the styles for all of the elements affected by a particular selector.

![](https://s3.amazonaws.com/horizon-production/images/OJeBlcg.png)

#### Disabling certain styles

You can tell your browser to ignore certain styles by unchecking them:

![](https://s3.amazonaws.com/horizon-production/images/NDOCbKw.png)
![](https://s3.amazonaws.com/horizon-production/images/RyZESld.png)

## In Conclusion

You should start trying to use the Chrome Inspector with every CSS-related project you work on! The more you start using it early on, the more intuitive it will become, and the more it will help you understand the intricacies of what's going on when your stylesheets get applied to a page.
