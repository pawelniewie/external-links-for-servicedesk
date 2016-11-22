class SetHasServiceButtonsOnProjectJob < ApplicationJob
  def perform(jwt_token_id, project_id)
    jwt_auth = JwtToken.find(jwt_token_id)

    has_service_buttons = ServiceButton.where(
      jwt_token_id: jwt_token_id,
      project_id: project_id).count > 0

    property_response = jira(jwt_auth).project_property(project_id, PluginKeyService::PROJECT_PROPERTY_KEY, {
      has_service_buttons: has_service_buttons
    })

    assert property_response.success?, "Property should be updated"
  end
end
