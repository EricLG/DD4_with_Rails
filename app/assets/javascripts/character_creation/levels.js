$(document).on("turbolinks:load", function() {

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

});
