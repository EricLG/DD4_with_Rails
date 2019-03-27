$(document).on("page:change", function() {
  $("#character_chosen_feats_attributes_0_feat_id").on("change", function(e) {
    var feats_with_add_choice = ['Apprentissage', 'Arme de prédilection', 'Compétence de prédilection',
    'Expertise des focaliseurs', 'Expertise aux armes', 'Linguiste',
    'Maîtrise polyvalente', "Maniement d'arme"]
    $.ajax({
      url: "/feats//" + $(this).val() + "/feat_avantage",
      success: function(data, textStatus, jqHhr) {
        $("#resume").removeClass("hidden");
        $("#feat_cat").text(data.category)
        $("#feat_name").text(data.name)
        $("#feat_pr").text(data.prerequisites)
        $("#feat_avantage").text(data.avantage)

        $("#apprentissage").addClass("hidden");
        $("#weapon-group").addClass("hidden");
        $("#languages").addClass("hidden");
        $("#proficiency").addClass("hidden");
        $("#implement").addClass("hidden");

        if (feats_with_add_choice.includes(data.name)) {
          checkForAdditionalDataToFeat(data)
        }
      },
      dataType: "json"
    });
  });

  $( ".select-feat" ).select2({
    theme: "bootstrap",
    placeholder: "Choisissez un talent...",
    allowClear: true,
  });


  function checkForAdditionalDataToFeat(feat) {
    if (feat.name === "Apprentissage") {
      $("#apprentissage").removeClass("hidden");
      $( ".select-apprentissage" ).select2({
        theme: "bootstrap",
        placeholder: "Choisissez une compétence...",
        allowClear: true,
      });
    }
    if (feat.name === "Arme de prédilection" || feat.name === "Expertise aux armes" || feat.name === "Maîtrise polyvalente") {
      $("#weapon-group").removeClass("hidden");
      $( ".select-weapon-group" ).select2({
        theme: "bootstrap",
        placeholder: "Choisissez un groupe d'arme...",
        allowClear: true
      });
    }
    if (feat.name === "Expertise des focaliseurs" || feat.name === "Maîtrise polyvalente") {
      $("#implement").removeClass("hidden");
      $( ".select-implement" ).select2({
        theme: "bootstrap",
        placeholder: "Choisissez un type de focaliseur...",
        allowClear: true
      });
    }
    if (feat.name === "Compétence de prédilection") {
      $("#predilection-skill").removeClass("hidden");
      $( ".select-predilection-skill" ).select2({
        theme: "bootstrap",
        placeholder: "Choisissez une compétence...",
        allowClear: true,
      });
    }
    if (feat.name === 'Linguiste') {
      $("#languages").removeClass("hidden");
      $( ".select-language" ).select2({
        theme: "bootstrap",
        placeholder: "Choisissez trois langues...",
        allowClear: true,
        maximumSelectionLength: 3
      });
    }
    if (feat.name === "Maniement d'arme") {
      $("#proficiency").removeClass("hidden");
      $( ".select-proficiency" ).select2({
        theme: "bootstrap",
        placeholder: "Choisissez une arme...",
        allowClear: true
      });
    }

  }
});
