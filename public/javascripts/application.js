// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
now = jQuery.now();

//$(document).ready(function() {
  // Handler for .ready() called.
  //$('#timefield').val(now);
//});


$(function(){
    $('#timefield').timepickr({
        convention: 12,
        val: true });
});