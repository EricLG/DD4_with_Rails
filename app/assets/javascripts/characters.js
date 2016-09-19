$(document).on("page:change", function() {
  var method = 2;
  var stats = $('.stat');

  $('.method-choice').click(function () {
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

  $('.btn-plus').click(function (e) {
    e.preventDefault();
    countStat($(this), 1);
  });
  $('.btn-minus').click(function (e) {
    e.preventDefault();
    countStat($(this), -1);
  });
  $(stats).change(function() {
    countStat($(this), 0);
  });

  function countStat(btnModif, modif) {
    var stat = btnModif.parents("tr").find($('.stat'));
    var new_value = parseInt(stat.val()) + modif;
    if (new_value < 3) {
      new_value = 3
    } else if (new_value > 18) {
      new_value = 18
    }
    stat.val(new_value);
    countCost();
    adjustFinalValueWithRacialBonus();
  }

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

  $("#character_experience").change(function(){
    $("#character_level").val(convertXpToLevel($(this).val()));
  });

  function between(value, min, max) {
    return (value >= min && value < max)
  }

  function convertXpToLevel(xpBrute) {
    var xp = xpBrute/1000;
    var level = 1;
    if      (between(xp, 1, 2.25))      {level = 2}
    else if (between(xp, 2.25, 3.75))   {level = 3}
    else if (between(xp, 3.75, 5.5))    {level = 4}
    else if (between(xp, 5.5, 7.5))     {level = 5}
    else if (between(xp, 7.5, 10))      {level = 6}
    else if (between(xp, 10, 13))       {level = 7}
    else if (between(xp, 13, 16.5))     {level = 8}
    else if (between(xp, 16.5, 20.5))   {level = 9}
    else if (between(xp, 20.5, 26))     {level = 10}
    else if (between(xp, 26, 32))       {level = 11}
    else if (between(xp, 32, 39))       {level = 12}
    else if (between(xp, 39, 47))       {level = 13}
    else if (between(xp, 47, 57))       {level = 14}
    else if (between(xp, 57, 69))       {level = 15}
    else if (between(xp, 69, 83))       {level = 16}
    else if (between(xp, 83, 99))       {level = 17}
    else if (between(xp, 99, 119))      {level = 18}
    else if (between(xp, 119, 143))     {level = 19}
    else if (between(xp, 143, 175))     {level = 20}
    else if (between(xp, 175, 210))     {level = 21}
    else if (between(xp, 210, 255))     {level = 22}
    else if (between(xp, 255, 310))     {level = 23}
    else if (between(xp, 310, 375))     {level = 24}
    else if (between(xp, 375, 450))     {level = 25}
    else if (between(xp, 450, 550))     {level = 26}
    else if (between(xp, 550, 675))     {level = 27}
    else if (between(xp, 675, 825))     {level = 28}
    else if (between(xp, 825, 1000))    {level = 29}
    else if (xp >= 1000)                {level = 30}
    return level;
  }


  $("#character_god_id").on("change", function() {
    if ($("#is-divine")) {
      var alignment = $("#character_god_id option:selected").text().split(" - ")[1];
      $("#character_alignment").val(alignment);
    }
  });

  /* Calcul du bonus racial */
  $("#character_racial_stat_id").on("change", function() {
    applyRacialBonus();
    adjustFinalValueWithRacialBonus();
  });

  function applyRacialBonus() {
    $(".racial-bonus").text(0);
    var racial_bonus = $("#character_racial_stat_id").find('option:selected').text();
    racial_bonus = racial_bonus.split(", ");
    racial_bonus.forEach(function (item) {
      if (item == "For 2") {
        $("#racial_stat_strength").text(2);
      } else if (item == "Con 2") {
        $("#racial_stat_constitution").text(2);
      } else if (item == "Dex 2") {
        $("#racial_stat_dexterity").text(2);
      } else if (item == "Int 2") {
        $("#racial_stat_intelligence").text(2);
      } else if (item == "Sag 2") {
        $("#racial_stat_wisdom").text(2);
      } else if (item == "Cha 2") {
        $("#racial_stat_charisma").text(2);
      }
    });
  }
  applyRacialBonus();
  adjustFinalValueWithRacialBonus();
  /* Fin calcul du bonus racial */

  /* Calcul de la valeur finale et des modificateurs associés */
  function adjustFinalValueWithRacialBonus() {
    $("#character-stats tr").each(function() {
      var baseValue   = $(this).find($(".stat")).val()
      var racialBonus = $(this).find($(".racial-bonus")).text();
      var finalValue  = parseInt(baseValue) + parseInt(racialBonus)
      var halfLevel   = Math.floor(parseInt($("#level").val())/2);
      var mod         = Math.floor((finalValue -10)/2);
      $(this).find($(".final-value")).text(finalValue);
      $(this).find($(".mod-carac")).text(mod);
      $(this).find($(".mod-carac-half_lvl")).text(mod + halfLevel);
    });
  }

});
