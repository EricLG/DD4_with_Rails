$(document).on("turbolinks:load", function() {
    $(".btn").click(function(event) {
      // Removes focus of the button.
      $(this).blur();
    });

    $(function () {
      $('[data-toggle="popover"]').popover()
    })
  });
