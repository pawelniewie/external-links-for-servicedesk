$(function() {
  new AJS.RestfulTable({
    autoFocus: true,
    el: jQuery("#service_links_table"),
    allowReorder: true,
    resources: {
      all: "rest/project/HSP/versions?expand=operations",
      self: "rest/version"
    },
    columns: [
      {
        id: "status",
        header: ""
      },
      {
        id: "name",
        header: AJS.I18n.getText("common.words.name")
      },
      {
        id: "description",
        header: AJS.I18n.getText("common.words.description")
      },
      {
        id: "releaseDate",
        header: AJS.I18n.getText("version.releasedate")
      }
    ]
  });
});
