$(document).ready(function() {
  $('.new_search').submit(function() {
    var first_station;
    var last_station;

    first_station = $(this).find('#search_first_station_id');
    last_station = $(this).find('#search_last_station_id');

    if (first_station.val() === last_station.val()) {
      alert('Выберите конечную станцию');
      return false;
    }
  });
});