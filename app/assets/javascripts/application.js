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
      eventColor: '#42376F',
      eventTextColor: '#FFF',
      defaultView: 'agendaWeek',

      select: function(start, end) {
        const modal_new = document.querySelector('#new_event');

        $('.start_hidden').val(moment(start).format('YYYY-MM-DD HH:mm'));
        $('.end_hidden').val(moment(end).format('YYYY-MM-DD HH:mm'));
        date_range_picker();

        modal_new.classList.add('show');
        modal_new.style.display = 'block';

        calendar.fullCalendar('unselect');

        // closeModal();
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

        $('.start_hidden').val(moment(offer.start).format('YYYY-MM-DD HH:mm'));
        $('.end_hidden').val(moment(offer.end).format('YYYY-MM-DD HH:mm'));
        date_range_picker();

        modal.classList.add('show');
        modal.style.display = 'block';
      }
    });
  })
};

$(document).ready(initialize_calendar);

// const closeModal = () => {
//   const closeButton = document.querySelector('.close');
//   console.log(document.querySelector('.close'));
//   closeButton.onclick = function() {
//     console.log(closeButton);
//     const modal_close = document.querySelector('#new_event');
//     modal_close.classList.remove('show');
//     modal_close.style.display = 'none';
//   };
// };



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

function date_range_picker() {
  $('.date-range-picker').each(function(){
    $(this).daterangepicker({
        timePicker: true,
        timePickerIncrement: 30,
        alwaysShowCalendars: true,
        startDate: moment($('.start_hidden').val(), 'YYYY-MM-DD HH:mm').toDate(),
        endDate: moment($('.end_hidden').val(), 'YYYY-MM-DD HH:mm').toDate()
    });
  })

  console.log('calendar set')
};

//select2

$(document).ready(function(){
  // Turn on js-selectable class so that it becomes SELCT 2 tag
  $('#query').select2({
    width: 450,

    // If you are using Bootstrap, please add　`theme: "bootstrap"` too.
  });

 $('#query').on("change", () => {
   $( "#search" ).click();
 });
});
