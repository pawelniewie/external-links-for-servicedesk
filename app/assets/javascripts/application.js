//= require_self
//= require service_buttons
//= require error_reporting

$(function() {
  var token = $('meta[name=token]').attr('content');
  if (token) {
    AJS.$.ajaxSetup({
      headers: { 'Authorization': 'JWT ' + token }
    });
  }
});
