// Function to retrieve more description info on Trips index page.
$(function() {
  $(".js-more").on("click", function() {
    var tripId = $(this).data("trip");
    var userId = $(this).data("user");
    $.get("/users/" + userId + "/trips/" + tripId + ".json", function(trip) {
        var descriptionText = "<p>" + trip.description + "</p>";
        $("#trip-" + tripId).html(descriptionText);
    });
  });
});

