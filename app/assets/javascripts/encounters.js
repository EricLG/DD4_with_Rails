// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).on("page:change", function() {

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
  });

  $("#party_level").change(function() {
    $("#monster_search_level").val($("#party_level").val());
    $("#new_monster_search").submit();
  });

  $('#budget_form').on('ajax:success', function(event, xhr, status, error) {
    $("#encounter_budget").text(xhr.budget);
  });

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
    $.ajax({
      url: "/dm_tools/monsters/" + monster_id,
      success: function(data, textStatus, jqHhr) {
        var alreadyAdded = false;
        if ($("#monsters_list .monster_id").length == 0) {
          addMonsterToTable(data);
        } else {
          $("#monsters_list .monster_id").each(function(index) {
            if ($(this).val() === data.id.toString()) {
              alreadyAdded = $(this).val()
              var qty = $(this).parent().find($(".qty_mob"));
              qty.text(parseInt(qty.text()) + 1);
            }
          });
          if (alreadyAdded === false) {
              addMonsterToTable(data);
          }
        }
      },
      dataType: "json"
    });
  });

  function addMonsterToTable(data) {
        $("#monsters_list").find('tbody')
          .append($('<tr>')
            .append($('<input>')
              .attr('type', 'hidden')
              .attr('class', 'monster_id')
              .attr('value', data.id)
            )
            .append($('<td>')
              .append($('<span>')
                .append($('<button>')
                      .attr('type', 'button')
                      .attr('class', 'btn btn-default btn-xs')
                      .text('- ')
                  )
              )
              .append($('<span class="qty_mob">')
                .text("1")
              )
              .append($('<span>')
                .append($('<button>')
                      .attr('type', 'button')
                      .attr('class', 'btn btn-default btn-xs')
                      .text(' +')
                  )
              )
            )
            .append($('<td>')
              .text(data.name)
            )
            .append($('<td>')
              .text(data.main_role)
            )
            .append($('<td>')
              .text(data.second_role)
            )
            .append($('<td>')
              .text(data.leader ? "Oui" : '')
            )
            .append($('<td>')
              .text(data.level)
            )
            .append($('<td>')
              .text(data.px)
            )
            .append($('<td>')
              .text(data.id)
            )
          );
  };
  // Initialisation
  initNewEncounterPage();
});
