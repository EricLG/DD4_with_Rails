$(function() {
  var method = 2;
  var stats = $('.stat');

  $('.method-choice').click(function () {
    console.log("Methode choisie : " + $(this).val());
    method = $(this).val();
    if (method == 3) {
      $("#submit-button").prop( "disabled", false );
      $("#stat-point-div").removeClass("has-error");
      $("#stat-point-div").hide("fast");
    } else {
      $("#stat-point-div").show("fast");
      countCost();
    }
  });

  stats.change(function() {
    if (method == 3) {
    } else {
      countCost();
    }
  });


  function countCost() {
    var totalPoints = 2;
    $.each(stats, function() {
      var stat = $(this).val()
      totalPoints += convertValueToCost(stat);
    })
    $("#character_stat-points").val(totalPoints)
    if (totalPoints > 22) {
      $("#submit-button").prop( "disabled", true );
      $("#stat-point-div").addClass("has-error");
    } else {
      $("#submit-button").prop( "disabled", false );
      $("#stat-point-div").removeClass("has-error");
    }
  }

  function convertValueToCost(value) {
    if (value == 8) { 
      return -2
    } else if (value == 9) {
      return -1
    } else if (value == 10) {
      return 0
    } else if (value == 11) {
      return 1
    } else if (value == 12) {
      return 2
    } else if (value == 13) {
      return 3
    } else if (value == 14) {
      return 5
    } else if (value == 15) {
      return 7
    } else if (value == 16) {
      return 9
    } else if (value == 17) {
      return 12
    } else if (value == 18) {
      return 16
    } else {
      return -2
    }
  }

});
