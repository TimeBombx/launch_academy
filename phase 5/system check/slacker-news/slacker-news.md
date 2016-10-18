## Introduction

HTML and CSS are two core technologies used for presenting web pages to users. In this challenge you'll create a web page with a semantic HTML structure and corresponding CSS styles to re-create an existing website.

## Instructions

You have been tasked with recreating the front page of [Hacker News][hacker-news] using HTML and CSS. You'll use HTML to structure your data and CSS to style your pages.

The page does not need to be functional -- actual working links, etc., are not necessary! -- but it should appear as shown in the screenshot below:

![Hacker News Home Page][home-page]

### Getting Set Up

Run the following commands from your terminal:

```no-highlight
$ et get slacker-news
$ cd slacker-news
```

We have provided a basic template for getting started, and we've also set up a web server to help you view your work. To start the web server, run the following commands:

```no-highlight
$ gem install sinatra
$ ruby server.rb

== Sinatra/1.4.5 has taken the stage on 4567 for development with backup from Thin
>> Thin web server (v1.5.1 codename Straight Razor)
>> Maximum connections set to 1024
>> Listening on localhost:4567, CTRL+C to stop
```

This will serve a web page at [http://localhost:4567/index.html](http://localhost:4567/index.html) containing a single header with some lovely styling. Modify the `index.html` and `styles.css` files in the `public` directory so that they resemble the home page of Hacker News.

## Meeting Expectations Requirements

* The list of articles must closely resemble the format of [Hacker News][hacker-news].
* Each article lists the title.
* Each article lists the domain of the link.
* Each article displays the points it has accumulated.
* Each article displays the user who submitted it.
* Each article displays the number of comments it has received.

### Tips

* Right-clicking on a web page and selecting _Inspect Element_ in either Firefox or Chrome will allow you to see the relevant HTML and CSS affecting that section of the page.
* Although you're copying the design of Hacker News, don't copy the HTML and CSS you see in the web browser! The Hacker News markup uses a table-based layout, and we want you to use more semantic markup.

[hacker-news]: https://news.ycombinator.com/
[sample-articles]: https://gist.github.com/atsheehan/8cfb57eabe68a5701664
[home-page]: https://s3.amazonaws.com/hal-assets.launchacademy.com/slacker-news/hacker-news-homepage.png
