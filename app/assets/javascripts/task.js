$(function () {
  $('#fart-around').on('click', function (e) {
    return $.ajax({
      type: 'GET',
      url: 'fart_around/',
    }).success( function(task) {
      var show = $('#showme');
      var html = "<h1>" + task.name + "</h1>"
      + "<a href=\"" + task.site + "\">Visit Site</a>"
      + "<p>" + task.description + "</p>"
      show.html(html)
    });
  });
});
