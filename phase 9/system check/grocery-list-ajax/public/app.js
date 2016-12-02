$( "#submit" ).submit(function( event ) {
  event.preventDefault();

  var listItem = $('#grocery_name').val().trim();

  if (listItem.length <= 0)  return;

  var request = $.ajax({
    method: "POST",
    data: {
      'name': listItem
    },
    url: ""
  });

  request.done(function(){
    // update list
    $('#grocery-list').append('<li class=\"item\">' + listItem + ' <input type=\"button\" value=\"delete\" class=\"delete\" /></li>');
    // clear field
    $('#grocery_name').val("");
  });
});
$(document).ready(function () {
  $(document).on('click', '.delete', function( event ){
    event.preventDefault();

    var parent = $(this).parent();
    var item = parent.text().trim();

    var request = $.ajax({
      method: "DELETE",
      data: {
        'name': item
      },
      url: "/groceries"
    });

    request.done(function(){
      parent.remove();
    });
  });
});