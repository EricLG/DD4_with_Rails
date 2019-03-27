$(document).on("page:change", function() {
  // Etape 4 - choix du dieu et de l'alignement et de l'avatar
  $("#character_god_id").on("change", function() {
    if ($("#is-divine")) {
      var alignment = $("#character_god_id option:selected").text().split(" - ")[1];
      $("#character_alignment").val(alignment);
    }
  });

  // http://www.macmax.org/2015/08/20/file-input-bootstrap-et-css/
  function bs_input_file() {
    $(".input-file").before(
      function() {
        if ( ! $(this).prev().hasClass('input-ghost') ) {
          var element = $("<input type='file' class='input-ghost hidden'>");
          element.attr("name",$(this).attr("name"));
          element.change(function(){
            element.next(element).find('input').val((element.val()).split('\\').pop());
          });
          $(this).find('input').css("cursor","pointer");
          $(this).find('input').mousedown(function() {
            $(this).parents('.input-file').prev().click();
            return false;
          });
          return element;
        }
      }
    );
  }
  $(function() {
    bs_input_file();
  });
});
