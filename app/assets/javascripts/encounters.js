// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).on("page:change", function() {

  $(".budget").change(function() {
    $("#budget_form").submit();
  });

  $('#budget_form').on('ajax:success', function(event, xhr, status, error) {
    $("#encounter_budget").text(xhr.budget);
  });

});
