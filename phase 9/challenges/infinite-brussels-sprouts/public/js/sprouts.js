// YOUR CODE GOES HERE
function loadNewTweets(tweets) {
  var tweetsContainer = $('.tweets');
  
  for (var i = 0; i < tweets.length; i++) {
    var tweet = tweets[i];
    tweetsContainer.append(
      '<li class=\"tweet\"><div class=\"body\">' + tweet["text"] +
      '</div><div class=\"user\">' + tweet["username"] +
      '</div></li>'
    );
  }
}

var page = 1

$(window).scroll(function() {
    if($(window).scrollTop() + $(window).height() == $(document).height()) {
      page++;
      var request = $.ajax({
        method: "GET",
        data: {
          'page': page,
        },
        url: "/tweets.json"
      });

      request.done(loadNewTweets);
    }
});