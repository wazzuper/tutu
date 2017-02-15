$(document).ready(function() {
  $('a.edit_railway_station').click(function(e) {
    e.preventDefault();

    var railway_station_id;
    var form;
    var title;

    railway_station_id = $(this).data('railwayStationId');
    form = $('#edit_railway_station_' + railway_station_id);
    title = $('#railway_station_title_' + railway_station_id);

    if (!$(this).hasClass('cancel')) {
      $(this).html('Отменить');
      $(this).addClass('cancel');
    } else {
      $(this).html('Изменить');
      $(this).removeClass('cancel');
    }

    form.toggle();
    title.toggle();
  });
});