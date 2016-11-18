class ServiceLinksController < ApplicationController
  include AtlassianJwtAuthentication

  # will respond with head(:unauthorized) if verification fails
  before_action do |controller|
    controller.send(:verify_jwt, PluginKeyService::PLUGIN_KEY)
  end

  def index
    @project ||= jira_gateway.project(params[:project_id])

    respond_to do |format|
      format.html {}
      format.json do
        render json: []
      end
    end
  end

  def create

  end

  private

  def jira_gateway
    JiraGateway.new(current_jwt_auth)
  end

end