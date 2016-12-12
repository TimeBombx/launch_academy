var newCommentCreator = function(commentAttributes, divId) {
  return {
    comment: commentAttributes,
    div: $(divId),
    create: function() {
      var commentCreatorObject = this;
      var request = $.ajax({
        method: "POST",
        url: "/api/v1/comments",
        data: { comment: commentCreatorObject.comment }
      });

      request.done(function() {
        commentCreatorObject.setFlash("notice", "Thank you for your input!");
        commentCreatorObject.append();
      });

      request.error(function() {
        commentCreatorObject.setFlash("error", "There was a problem with your comment.");
      });
    },
    setFlash: function(type, message) {
      $("div.flash").remove();
      var flash = $("<div>", { "class": "flash flash-" + type }).text(message);
      $("body").prepend(flash);
    },
    append: function() {
      var commentSection = $('#comments');
      console.log(commentAttributes);
      commentSection.append('<h3>' + commentAttributes.title + '<h3>');
      commentSection.append('<p>' + commentAttributes.content + '<p>');
    }
  }
};