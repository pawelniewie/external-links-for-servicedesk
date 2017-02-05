//= require_self
//= require service_buttons

$(function () {
  var token = $('meta[name=token]').attr('content');

  AJS.$.ajaxPrefilter(function(options) {
    if (token) {
      options.url += ~options.url.indexOf('?') ? '&' : '?';
      options.url += 'X-Cookie' + '=' + token;
    }
  });

  AJS.$.ajaxSetup({
    ajaxComplete: function (event, xhr) {
      token = xhr.getResponseHeader('X-Cookie');
    }
  });

  AP.resize(); // needed to reflow content
});
