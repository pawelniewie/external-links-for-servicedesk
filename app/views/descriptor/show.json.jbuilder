json.authentication do
  json.type "jwt"
end

json.baseUrl base_url

json.contexts ["personal"]

json.description "Add custom links to external services on Service Desk tickets"

unless Rails.env.development?
  json.enableLicensing true
end

json.key plugin_key

json.name plugin_name

json.scopes ["read", "write"]

json.lifecycle do
  json.installed "/installed"
  json.uninstalled "/uninstalled"
end

json.vendor do
  json.name "Pawel Niewiadomski"
  json.url "https://pawelniewiadomski.com"
end

json.modules do
  json.generalPages do
    json.array! [{
      key: "service-buttons-project-configuration",
      location: "atl.jira.proj.config/projectgroup4",
      name: "Service Buttons",
      url: "/projects/{project.id}/service_buttons"
    }] do |generalPage|
      json.key generalPage[:key]
      json.location generalPage[:location]
      json.name do
        json.value generalPage[:name]
      end
      json.url generalPage[:url]
    end
  end

  json.webPanels do
    json.array! [{
      key: "service-buttons-panel",
      url: "/projects/{project.id}/service_buttons?issue_id={issue.id}",
      location: "atl.jira.view.issue.right.context",
      weight: 10,
      name: "Service buttons",
      conditions: {
        addon_is_licensed: {},
        user_is_logged_in: {},
        entity_property_equal_to: {
          entity: "project",
          propertyKey: project_property_key,
          objectName: "has_service_buttons",
          value: "true"
        }
      }
    }] do |webPanel|
      json.key webPanel[:key]
      json.url webPanel[:url]
      json.location webPanel[:location]
      json.weight webPanel[:weight]
      json.name do
        json.value webPanel[:name]
      end
      json.conditions do
        json.array! webPanel[:conditions].each_pair do |condition, params|
          next if condition == :addon_is_licensed

          json.condition condition
          if params.present?
            json.set! :params, params
          end
        end
      end
    end
  end
end