//= require jquery
//= require select2
//= require rails-ujs
//= require moment
//= require fullcalendar
//= require daterangepicker
//= require_tree .


// fullcalendar
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
        const range_date = document.querySelector('.range_date_input');
        const start_date = document.querySelector('.start_date_input');
        const end_date = document.querySelector('.end_date_input');
        const modal_new = document.querySelector('#new_event');

        start_date.value = start.format();
        end_date.value = end.format();
        range_date.value = `${start.format()} - ${end.format()}`

        modal_new.classList.add('show');
        modal_new.style.display = 'block';

        calendar.fullCalendar('unselect');

        // const close_button = document.querySelector('.close');
        // close_button.addEventListener('click', (event) => {
        //   console.log(close_button);
        //   const modal_close = document.querySelector('#new_event');
        //   modal_close.classList.remove('show');
        //   modal_close.style.display = 'none';
        // });
      },

      eventDrop: function(offer, delta, revertFunc) {
        offer_data = {
          offer: {
            id: offer.id,
            start_date: offer.start.format(),
            end_date: offer.end.format()
          }
        };
        $.ajax({
            url: offer.update_url,
            data: offer_data,
            dataType: 'json',
            type: 'PATCH'
        });
      },

      eventClick: function(offer, jsEvent, view) {
        const modal = document.querySelector(`#edit_event_${offer.id}`);
        modal.classList.add('show');
        modal.style.display = 'block';
      }
    });
  })
};

$(document).ready(initialize_calendar);

//datarangepicker
$(document).ready(function() {
  $('.date_range').daterangepicker({
    ranges: {
       'Today': [moment(), moment()],
       'Yesterday': [moment().subtract('days', 1), moment().subtract('days', 1)],
       'Last 7 Days': [moment().subtract('days', 6), moment()],
       'Last 30 Days': [moment().subtract('days', 29), moment()],
       'This Month': [moment().startOf('month'), moment().endOf('month')],
       'Last Month': [moment().subtract('month', 1).startOf('month'), moment().subtract('month', 1).endOf('month')]
    },
    locale: { cancelLabel: 'Clear' },
    format: 'YYYY-MM-DD',
    opens: 'left'
  });

  $('.date_range').on('cancel.daterangepicker', function(ev, picker) {
    $(this).val('');
  });
});

//select2
$( ".doctor-form" ).select2({
    theme: "bootstrap"
});

