var show = function(args){
  args.forEach(function (value) {
    value.show();
  });
};

var hide = function(args) {
  args.forEach(function (value) {
    value.hide();
  });
};

document.addEventListener("turbolinks:load", function() {
  $("#wagon_type").change(function() {

    var wagon_type;
    var top_seats = $("#wagon_top_seats");
    var bottom_seats = $("#wagon_bottom_seats");
    var side_top_seats = $("#wagon_side_top_seats");
    var side_bottom_seats = $("#wagon_side_bottom_seats");
    var sitting_seats = $("#wagon_sitting_seats");

    switch ($(this).val()){
    case "EconomyWagon":
      show([top_seats, bottom_seats, side_top_seats, side_bottom_seats]);
      hide([sitting_seats]);
      break;
    case "CoupeWagon":
      show([top_seats, bottom_seats]);
      hide([side_bottom_seats, side_top_seats, sitting_seats]);
      break;
    case "SwWagon":
      show([bottom_seats]);
      hide([top_seats, side_bottom_seats, side_top_seats, sitting_seats]);
      break;
    case "SittingWagon":
      show([sitting_seats]);
      hide([top_seats, bottom_seats, side_top_seats, side_bottom_seats]);
      break;
    default:
      break;
    }

  });
});