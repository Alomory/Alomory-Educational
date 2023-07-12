$(".button").click((e) => {
    if ($(".button").is(".button-state")) {
        console.log("clicked");
        $(".button").removeClass("button-state").addClass("card-state");
    }
});
$(".signin-button").click((e) => {
    $(".button").addClass("button-state").removeClass("card-state");
    e.stopPropagation();
});
