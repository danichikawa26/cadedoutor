//= require jquery
//= require select2
//= require rails-ujs
//= require moment
//= require fullcalendar
//= require_tree .


$(document).ready(function() {
  $('#calendar').fullCalendar({
    events: '/consultations.json'
  })
});


$( ".doctor-form" ).select2({
    theme: "bootstrap"
});
