$(document).on("page:change", function() {

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
});
