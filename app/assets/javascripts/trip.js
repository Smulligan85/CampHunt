$(function() {
// Function to retrieve more description info on Trips index page.
  $(".js-more").on("click", function() {
    var tripId = $(this).data("trip");
    var userId = $(this).data("user");
    $.get("/users/" + userId + "/trips/" + tripId + ".json", function(trip) {
        var descriptionText = "<p>" + trip.description + "</p>";
        $("#trip-" + tripId).html(descriptionText);
    });
  });

// Function to submit supplies via AJAX
  $(".edit_trip").on("submit", function(event) {
    url = this.action;
    data = $(this).serialize();
    $.ajax({
      type: "PATCH",
      url: url,
      data: data,
      success: function(response) {
        $(".table tr:last").after('<tr><td>' + response + '</td></tr>');
        $('input#trip_supplies_attributes_0_name').val("");
        $(".edit_trip")[0].reset();
      }
    });
    event.preventDefault();
  });

});

