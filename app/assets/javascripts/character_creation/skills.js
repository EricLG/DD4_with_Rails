$(document).on("turbolinks:load", function() {

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
