$(document).on("page:change", function() {
    $(".comment-nav").click(function(e) {
        e.preventDefault();
        $(".comment-nav").removeClass('active');
        $(".comment-content").addClass('hidden');
        $(this).addClass('active');
        $("#content-" + $(this).attr("id")).removeClass('hidden');
    });
});
