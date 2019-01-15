$(document).on("page:change", function() {
    $(".comment-nav").click(function(e) {
        e.preventDefault();
        $(".comment-nav").removeClass('active');
        $(".comment-content").addClass('hidden');
        $(this).addClass('active');
        $("#content-" + $(this).attr("id")).removeClass('hidden');
    });

    $("#js-radio-comment").click(function(e) {
        if ($("#comment_roleplay_rp").prop("checked")) {
            $("#comment_character_id").removeClass('hidden');
            $("#comment_character_id").prop('disabled', false);
        } else {
            $("#comment_character_id").addClass('hidden');
            $("#comment_character_id").prop('disabled', true);
        }
    })
});
