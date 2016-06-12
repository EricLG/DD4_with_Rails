// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).on("page:change", function() {

  $(".budget").change(function() {
    $("#budget_form").submit();
  });

  $('#budget_form').on('ajax:success', function(event, xhr, status, error) {
    $("#encounter_budget").text(xhr.budget);
  });

  $( ".select-monster" ).select2({
    theme: "bootstrap",
    placeholder: "Choisissez un monstre...",
    allowClear: true,
  });


  $('#new_monster_search').on('ajax:success', function(event, xhr, status, error) {
    $( ".select-monster").empty();
    $( ".select-monster").append($("<option value=\"\"></option>"));
    $.each(xhr, function(key, value) {
      $( ".select-monster" ).append($("<option></option>").attr("value", value.id).text(value.name));
    });

    $( ".select-monster" ).trigger('change');
  });
});
