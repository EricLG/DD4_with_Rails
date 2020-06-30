$(document).on("turbolinks:load", function() {

  function initNewEncounterPage() {
    if ($("#budget_form").length !== 0 && $("#new_monster_search").length !== 0) {
      $("#budget_form").submit();
      $("#new_monster_search").submit();
    }
  };

  $( ".select-monster" ).select2({
    theme: "bootstrap",
    placeholder: "Choisissez un monstre...",
    allowClear: true,
  });

  // Budget form
  $(".budget").change(function() {
    $("#budget_form").submit();
    updateDifficultyEncounter();
  });

  $("#party_level").change(function() {
    $("#monster_search_level").val($("#party_level").val());
    $('#encounter_experience').val($("#party_level").val());
    $("#new_monster_search").submit();
  });

  $('#budget_form').on('ajax:success', function(event, xhr, status, error) {
    $("#encounter_budget").text(xhr.budget);
    $('#encounter_level').val(xhr.budget);
    updateEncountersExample(xhr.encounters);
  });

  function updateEncountersExample(encounters) {
    $("#encounter_example").empty();
    $.each(encounters, function(key, value) {
      var description = value.description.replace(/\r\n/g, "<br>");
      $("#encounter_example").append("<li class=\"small\">" + (description) + "</li>");
    });
  };

  // Filter monster form
  $(".select_form").change(function() {
    $("#new_monster_search").submit();
  });

  // Update the select2 options list
  $('#new_monster_search').on('ajax:success', function(event, xhr, status, error) {
    $( ".select-monster").empty().append($("<option value=\"\"></option>"));
    $.each(xhr, function(key, value) {
      $( ".select-monster" ).append($("<option></option>").attr("value", value.id).text("Niv. " + value.level + " | " +value.name));
    });

    $( ".select-monster" ).trigger('change');
  });

  // Add monster
  $("#add_monster").click(function() {
    var monster_id = $("#monster").val();
    if (monster_id !== undefined && monster_id !== "") {
      $.ajax({
        url: "/dm_tools/monsters/" + monster_id,
        success: function(data, textStatus, jqHhr) {
          addMonster(data)
        },
        dataType: "json"
      });
    }
  });

  // Callback de la réponse ajax
  function addMonster(data) {
    var alreadyAdded = false;
    if ($("#monsters_list .monster_id").length == 0) {
      addMonsterToTable(data);
    } else {
      $("#monsters_list .monster_id").each(function(index) {
        if ($(this).val() === data.id.toString()) {
          alreadyAdded = $(this).val()
          var qty = $(this).parent().find($("td.qty"));
          var qtyValue = parseInt(qty.text()) + 1;
          qty.text(qtyValue);
          var qtyInput = $(this).parents("tr").find(".monster_qty_id");
          qtyInput.val(qtyValue);
          updateRowTotalXp($(this).parent());
        }
      });
      if (alreadyAdded === false) {
          addMonsterToTable(data);
      }
    }
    difficultyEncounter(data.px, 0);
  }

  // Evenements sur la table
  $("#monsters_list").on("click", ".plus-btn", function(){
    var qty = $(this).parent().prev();
    var qtyValue = parseInt(qty.text()) + 1;
    qty.text(qtyValue);
    var qtyInput = $(this).parents("tr").find(".monster_qty_id");
    qtyInput.val(qtyValue);
    difficultyEncounter(qty.parents("tr").find("td + .experience").text(), 0);
    updateRowTotalXp($(this).parents("tr"));
  });
  $("#monsters_list").on("click", ".moins-btn", function(){
    var qty = $(this).parent().next();
    if (parseInt(qty.text()) > 0) {
      var qtyValue = parseInt(qty.text()) - 1;
      qty.text(qtyValue);
      var qtyInput = $(this).parents("tr").find(".monster_qty_id");
      qtyInput.val(qtyValue);
      difficultyEncounter(0, qty.parents("tr").find("td + .experience").text());
    }
    updateRowTotalXp($(this).parents("tr"));
  });
  $("#monsters_list").on("click", ".deleteRow", function(){
    var row = $(this).parent();
    difficultyEncounter(0, xpPerRow(row));
    row.remove();
  });

  // Ajout du template de ligne html
  function addMonsterToTable(data) {
    var parsedDataXp = data.px ? data.px : 0
    $("#monsters_list").find('tbody')
      .append($('<tr>')
        .attr('id', 'mob-' + data.id)
        .append($('<input>')
          .attr('type', 'hidden')
          .attr('class', 'monster_id')
          .attr('name', 'encounter[chosen_monsters_attributes][' + data.id + '][monster_id]')
          .attr('value', data.id)
        )
        .append($('<input>')
          .attr('type', 'hidden')
          .attr('class', 'monster_qty_id')
          .attr('name', 'encounter[chosen_monsters_attributes][' + data.id + '][quantity]')
          .attr('value', 1)
        )
        .append($('<td class="noborder-right">')
          .append($('<button>')
            .attr('type', 'button')
            .attr('class', 'moins-btn btn btn-default btn-xs')
            .text('-')
          )
        )
        .append($('<td class="qty">').text("1"))
        .append($('<td class="noborder-left">')
          .append($('<button>')
            .attr('type', 'button')
            .attr('class', 'plus-btn btn btn-default btn-xs')
            .text('+')
          )
        )
        .append($('<td>').text(data.name))
        .append($('<td>').text(formatRole(data.main_role, data.second_role, data.leader)))
        .append($('<td>').text(data.level))
        .append($('<td class="experience">').text(parsedDataXp))
        .append($('<td class="totalXp">').text(parsedDataXp))
        .append($('<td class="deleteRow">')
          .append($('<button>')
            .attr('type', 'button')
            .attr('class', 'btn btn-default btn-xs')
            .text('X')
          )
        )
      );
  };

  function xpPerRow(row) {
    var nbRow = parseInt(row.find("td.qty").text());
    var exp   = parseInt(row.find("td.experience").text());
    return nbRow * exp;
  };

  function updateRowTotalXp(row) {
    row.find("td.totalXp").text(xpPerRow(row));
  }

  function difficultyEncounter(addXp, removeXp) {
    var spanBudget = $("#currentBudget");
    var addIntXp = parseInt(addXp)
    var removeIntXp = parseInt(removeXp)
    if (isNaN(addIntXp) || isNaN(removeIntXp)) {
      addIntXp = 0
      removeIntXp = 0
    }
    var newBudget = parseInt(spanBudget.text()) + addIntXp - removeIntXp
    spanBudget.text(isNaN(newBudget) ? 0 : newBudget);
    updateDifficultyEncounter();
  }

  function formatRole(main_role, second_role, leader) {
    var text = main_role;
    if (second_role !== "Normal") {
      text += " " + second_role
    }
    if (leader) {
      text += " (M)"
    }
    return text
  }

  // Calcul de la difficulté de la rencontre
  function updateDifficultyEncounter() {
    var party_size = parseInt($("#party_size").val());
    var party_level = parseInt($("#party_level").val());
    var totalMonsterXp = parseInt($("#currentBudget").text());
    $.ajax({
      url: "/dm_tools/encounters/update_difficulty_encounter?",
      data: {party_size: party_size, party_level: party_level, totalMonsterXp: totalMonsterXp},
      success: function(data, textStatus, jqHhr) {
        $("#difficulty").text(data.difficulty)
      },
      dataType: "json"
    });
  }

  // Initialisation
  $(function() {
    initNewEncounterPage();
  });
});
