//= require jquery
//= require select2
//= require rails-ujs
//= require_tree .
//= require moment
//= require fullcalendar


$(document).ready(function() {
  $('#calendar').fullCalendar({
    events: '/consultations.json'
  })
});


$( ".doctor-form" ).select2({
    theme: "bootstrap"
});
