//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require jquery-fileupload/basic
//= require cloudinary/jquery.cloudinary
//= require attachinary
//= require underscore
//= require gmaps/google
//= require Chart.bundle
//= require chartkick
//= require select2
//= require select2_simple_form
//= require bootstrap-datepicker
//= require bootstrap-datepicker/core
//= require bootstrap-datepicker/locales/bootstrap-datepicker.pt.js
//= require_tree .

$(document).ready(function() {
  $(".rotate").textrotator({
    animation: "dissolve", // You can pick the way it animates when rotating through words. Options are dissolve (default), fade, flip, flipUp, flipCube, flipCubeUp and spin.
    separator: "|", // If you don't want commas to be the separator, you can define a new separator (|, &, * etc.) by yourself using this field.
    speed: 2500 // How many milliseconds until the next word show.
  });
});

function initAutocomplete() {
  // Create the autocomplete object, restricting the search to geographical
  // location types.
  var autocomplete = new google.maps.places.Autocomplete(document.getElementById('patient_address'), { types: ['geocode'] });

  // When the user selects an address from the dropdown, populate the address
  // fields in the form.
  // autocomplete.addListener('place_changed', fillInAddress);
}
