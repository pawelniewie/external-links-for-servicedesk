$(function() {
  var base_url = $('meta[name=base_url]').attr('content');
  var project_id = $('meta[name=project_id]').attr('content');

  new AJS.RestfulTable({
    autoFocus: true,
    el: jQuery("#service_buttons_table"),
    allowReorder: true,
    resources: {
      all: '/projects/' + project_id + '/service_buttons.json',
      self: '/projects/' + project_id + '/service_buttons'
    },
    columns: [
      {
        id: "label",
        header: 'Label'
      },
      {
        id: "href",
        header: 'Address'
      },
      {
        id: "icon",
        header: 'Icon'
      }
    ]
  });
});
