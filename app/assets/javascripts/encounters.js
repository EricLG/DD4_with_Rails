// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).on("page:change", function() {

  // Initialisation
  $("#budget_form").submit();
  $("#new_monster_search").submit();

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

  // filter monster form
  $(".select_form").change(function() {
    $("#new_monster_search").submit();
  });

  //update the select2 options list
  $('#new_monster_search').on('ajax:success', function(event, xhr, status, error) {
    $( ".select-monster").empty().append($("<option value=\"\"></option>"));
    $.each(xhr, function(key, value) {
      $( ".select-monster" ).append($("<option></option>").attr("value", value.id).text("Niv. " + value.level + " | " +value.name));
    });

    $( ".select-monster" ).trigger('change');
  });

});
