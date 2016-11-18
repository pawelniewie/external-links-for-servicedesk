//= require_self
//= require service_links
$(function() {
  var token = $('meta[name=token]').attr('content');
  if (token) {
    AJS.$.ajaxSetup({
      headers: { 'Authorization': 'JWT ' + token }
    });
  }
});