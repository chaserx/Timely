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

jQuery(function($) {
  // when the #search field changes
  $("#timefield").change(function() {
    // make a POST call and replace the content
    $.post(<%= timeout_path %>, function(data) {
      $("#timeout").html(data);
    });
  });
})