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
        var respArr = response.split("\n");
        var supplyName = respArr[0];
        var supplyQuantity = respArr[1];
        var tripSupplyId = respArr[2];
        var authToken = $('input:hidden[name=authenticity_token]').val();
        $(".table").append(
          '<tr>' +
            '<td>' + supplyName + " " + supplyQuantity + " " +
              '<div style="display:inline-block;">' +
                '<form class="button_to" method="post" action="/trip_supplies/' + tripSupplyId + '/increase"><input type="hidden" name="_method" value="put"><input type="submit" value="+1"><input type="hidden" name="authenticity_token" value="' + authToken + '"></form>' +
              '</div>' + " " +
              '<div style="display:inline-block;">' +
                '<form class="button_to" method="post" action="/trip_supplies/' + tripSupplyId + '/increase"><input type="hidden" name="_method" value="put"><input type="submit" value="-1"><input type="hidden" name="authenticity_token" value="' + authToken + '"></form>' +
              '</div>' +
          '</td>' +
          '</tr>'
        );
        $('input#trip_supplies_attributes_0_name').val("");
        // $(".edit_trip")[0].reset();
      }
    });
    event.preventDefault();
  });

});

