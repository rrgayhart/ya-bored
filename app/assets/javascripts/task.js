$(function () {
  $('#fart-around').on('click', function (e) {
    return $.ajax({
      type: 'GET',
      url: 'tasks/fart_around/',
    }).success( function(task) {
      var show = $('#showme');
      $('#selectme').hide();
      show.show();
      var html = "<h1>" + task.name + "</h1>"
      + "<a href=\"" + task.site + "\">Visit Site</a>"
      + "<p>" + task.description + "</p>"
      + "<a href=/tasks/" + task.id + ">Show</a>"
      show.html(html)
    });
  });

    $('#select-button').on('click', function (e) {
      $('#showme').hide();
      $('#selectme').show();
    });
});
