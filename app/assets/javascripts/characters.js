$(document).on("page:change", function() {

  // Etape 1 - détermination du niveau selon l'expérience
  $("#character_experience").change(function(){
    $("#character_level").val(convertXpToLevel($(this).val()));
  });

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

  function between(value, min, max) {
    return (value >= min && value < max)
  }

  // Etape 2 et 3 sont gérés dans les vues avec des link_to en mode remote

  // Etape 4 - choix du dieu et de l'alignement.
  $("#character_god_id").on("change", function() {
    if ($("#is-divine")) {
      var alignment = $("#character_god_id option:selected").text().split(" - ")[1];
      $("#character_alignment").val(alignment);
    }
  });

  // Etape 5 - caractéristiques

  // Choix de la méthode
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

  // Gestion de la saisie manuelle et par les boutons plus et moins des caracs
  $('.btn-plus').click(function (e) {
    e.preventDefault();
    countStat($(this), 1);
  });
  $('.btn-minus').click(function (e) {
    e.preventDefault();
    countStat($(this), -1);
  });
  $('.stat').change(function() {
    countStat($(this), 0);
  });

  // Vérifie que la stat est bien bornée et appel les calculs supplémentaires
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
    adjustFinalValueWithRacialAndlevelBonus();
  }

   // Compte le cout en point des caractéristiques (pour la méthode 2)
  function countCost() {
    var totalPoints = 2;
    $.each($('.stat'), function() {
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

  // Calcul du bonus racial pour les caractéristiques
  $("#racial_stat").on("change", function() {
    applyRacialBonus();
    adjustFinalValueWithRacialAndlevelBonus();
  });

  // Récupère les caractéristiques choisies en tant que bonus racial et les appliquent au tableau des carac
  function applyRacialBonus() {
    $(".js-racial-bonus").text(0);
    $(".js-racial-bonus-field").val(0);
    var racial_bonus = $("#racial_stat").find('option:selected').text();
    racial_bonus = racial_bonus.split(", ");
    racial_bonus.forEach(function (item) {
      if (item == "For 2") {
        $("#racial_stat_strength").text(2);
        $("#racial_stat_strength").parent().children("input").val(2)
      } else if (item == "Con 2") {
        $("#racial_stat_constitution").text(2);
        $("#racial_stat_constitution").parent().children("input").val(2)
      } else if (item == "Dex 2") {
        $("#racial_stat_dexterity").text(2);
        $("#racial_stat_dexterity").parent().children("input").val(2)
      } else if (item == "Int 2") {
        $("#racial_stat_intelligence").text(2);
        $("#racial_stat_intelligence").parent().children("input").val(2)
      } else if (item == "Sag 2") {
        $("#racial_stat_wisdom").text(2);
        $("#racial_stat_wisdom").parent().children("input").val(2)
      } else if (item == "Cha 2") {
        $("#racial_stat_charisma").text(2);
        $("#racial_stat_charisma").parent().children("input").val(2)
      }
    });
  }

  /* Calcul de la valeur finale et des modificateurs associés */
  function adjustFinalValueWithRacialAndlevelBonus() {
    adjustTotalBonusCarac()
    $("#character-stats tr").each(function() {
      var baseValue   = $(this).find($(".stat")).val()
      var racialBonus = $(this).find($(".js-racial-bonus")).text();
      var levelBonus  = $(this).find($(".total-bonus-level-stat")).text();
      var finalValue  = parseInt(baseValue) + parseInt(racialBonus) + parseInt(levelBonus);
      var halfLevel   = Math.floor(parseInt($("#level").val())/2);
      var mod         = Math.floor((finalValue -10)/2);
      $(this).find($(".final-value")).text(finalValue);
      $(this).find($(".mod-carac")).text(mod);
      $(this).find($(".mod-carac-half_lvl")).text(mod + halfLevel);
    });
  }

  // Calcul des bonus de carac par niveau
  $('.js-btn-bonus-carac').click(function (e) {
    e.preventDefault();
    adjustBonusCarac($(this));
  });

  // Sélectionne ou désélectionne le bouton cliqué et met à jour le total final des caractéristiques
  function adjustBonusCarac(clickBtn) {
    var bonusCaracInput = $("#input-"+ clickBtn.attr('id'))
    var bonusCaracSpan = clickBtn.find($("span"));
    if ((countBonusCaracByLevel(bonusCaracInput) < 2) && bonusCaracInput.val().toString() !== '1') {
      selectCarac(bonusCaracInput, clickBtn, bonusCaracSpan);
    } else {
      unSelectCarac(bonusCaracInput, clickBtn, bonusCaracSpan);
    }
    adjustFinalValueWithRacialAndlevelBonus();
  }

  // Compte le nombre de caractéristique bonus choisi pour un niveau
  function countBonusCaracByLevel(input) {
    var level = input.attr("id").match(/level-\d{1,2}/)[0];
    return $("."+level).filter(".btn-info").size();
  }

  function selectCarac(bonusCaracInput, clickBtn, bonusCaracSpan) {
    bonusCaracInput.val(1);
    clickBtn.removeClass("btn-default");
    clickBtn.addClass("btn-info");
    bonusCaracSpan.removeClass("glyphicon-plus");
    bonusCaracSpan.addClass("glyphicon-ok");
  }
  function unSelectCarac(bonusCaracInput, clickBtn, bonusCaracSpan) {
    bonusCaracInput.val(0);
    clickBtn.addClass("btn-default");
    clickBtn.removeClass("btn-info");
    bonusCaracSpan.addClass("glyphicon-plus");
    bonusCaracSpan.removeClass("glyphicon-ok");
  }

  // Calcule le bonus de caractéristiques liés aux niveaux 4+
  function adjustTotalBonusCarac() {
    $(".level-bonus-stats").each(function() {
      var totalBonusRow = 0;
      var row = $(this);
      row.children("input").each(function() {
        totalBonusRow += parseInt($(this).val());
      })
      row.children("button").text(totalBonusRow)
    });
  }

  /* Etape 6 : gestion des compétences (skills) */

  // Gestion des bonus raciaux dynamiques (cristallien / kalashtar)
  $(".js-btn-skill-bonus-racial").click(function (e) {
    e.preventDefault();
    var btn = $(this);
    var span = $(this).find($("span"));
    var input = $(this).find($("input"));
    var total_skill = $("#total_bonus_" + btn.parents("tr").attr("id"))
    var total_skill_value = parseInt(total_skill.text())

    if (span.hasClass("glyphicon-plus")) {
      total_skill.text(total_skill_value + 2)
      $(".js-btn-skill-bonus-racial").attr("disabled", true)
      btn.attr("disabled", false)
      input.val(2)
    } else {
      total_skill.text(total_skill_value - 2)
      $(".js-btn-skill-bonus-racial").attr("disabled", false)
      input.val(0)
    }

    btn.toggleClass('btn-info btn-default');
    span.toggleClass('glyphicon-plus glyphicon-ok');
  });

  $('.js-btn-training-skill-bonus').click(function(e){
    e.preventDefault();

    // Compte total de formation avant action
    var total_training = $('.js-chosen-skill').length;
    var total_training_allowed = parseInt($('#total-training-allowed').text());
    if (total_training >= total_training_allowed) {
      // Allow only unselect
      if (!$(this).find($("span")).hasClass("glyphicon-plus")) {
        updateSkill($(this));
      }
    } else {
      updateSkill($(this));
    }
  });

  function updateSkill(clicked_training_skill) {
    var span =  clicked_training_skill.find($("span"));
    var input = clicked_training_skill.find($("input"));
    var skill = clicked_training_skill.parents("tr").attr('id');
    var total_skill = $("#total_bonus_" + skill)
    var total_skill_value = parseInt(total_skill.text())

    // Update total skill et activation de l'input
    if (span.hasClass("glyphicon-plus")) {
      input.val(5)
      total_skill.text(total_skill_value + 5)
    } else {
      input.val(0)
      total_skill.text(total_skill_value - 5)
    }

    // Gestion du cas Eladrin : desactivation des autres boutons pour respecter l'aptitude Education éladrine
    if (clicked_training_skill.hasClass("js-eladrin-skill-bonus")) {
      if (span.hasClass("glyphicon-plus")) {
        $(".js-eladrin-skill-bonus").attr("disabled", true)
        clicked_training_skill.attr("disabled", false)
      } else {
        $(".js-eladrin-skill-bonus").attr("disabled", false)
      }
    }

    // Update btn display
    clicked_training_skill.toggleClass('btn-info js-chosen-skill');
    span.toggleClass('glyphicon-plus glyphicon-ok');
  };

});
