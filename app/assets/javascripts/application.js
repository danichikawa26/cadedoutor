//= require jquery
//= require select2
//= require rails-ujs
//= require moment
//= require fullcalendar
//= require_tree .

var initialize_calendar;
initialize_calendar = function() {
  $('#calendar').each(function(){
    var calendar = $(this);
    calendar.fullCalendar({
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,agendaWeek,agendaDay'
      },
      selectable: true,
      selectHelper: true,
      editable: true,
      eventLimit: true,
      events: '/consultations.json',

      select: function(start, end) {
        $.getScript('/doctor/offers/new', function() {});

        calendar.fullCalendar('unselect');
      },

      eventDrop: function(offer, delta, revertFunc) {
        offer_data = {
          offer: {
            id: offer.id,
            start: offer.start_date.format(),
            end: offer.end_date.format()
          }
        };
        $.ajax({
            url: offer.update_url,
            data: event_data,
            type: 'PATCH'
        });
      },

      eventClick: function(offer, jsEvent, view) {
        $.getScript(offer.edit_url, function() {});
      }
    });
  })
};

$(document).ready(initialize_calendar);

$( ".doctor-form" ).select2({
    theme: "bootstrap"
});

