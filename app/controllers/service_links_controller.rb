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
        render json: current_jwt_auth.service_links.where(project_id: params[:project_id])
      end
    end
  end

  def create
    service_link = current_jwt_auth.service_links.create!(
      params.require(:service_link).permit(:label, :name, :href, :title, :color).merge(params.permit(:project_id)))

    render json: service_link
  end

  def update
    current_jwt_auth.service_links
      .find_by(params.permit(:project_id, :id))
      .update(params.require(:service_link).permit(:label, :name, :href, :title, :color))

    render json: current_jwt_auth.service_links.find_by(params.permit(:project_id, :id))
  end

  def destroy
    current_jwt_auth.service_links.where(params.permit(:project_id, :id)).destroy_all
  end

  private

  def jira_gateway
    JiraGateway.new(current_jwt_auth)
  end

end