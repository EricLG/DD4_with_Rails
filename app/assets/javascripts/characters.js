$(function() {
  $('.method-choice').click(function () {
    console.log("Methode choisie : " + $(this).val())
    var method = $(this).val()
    if (method == 1) {

    } else if (method == 2) {

    } else if (method == 3) {

    } else {
      alert("Une erreur s'est produite: méthode non reconnue");
    }
  });
});
