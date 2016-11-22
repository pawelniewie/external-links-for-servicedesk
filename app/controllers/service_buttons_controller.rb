class ServiceButtonsController < ApplicationController
  include AtlassianJwtAuthentication

  # will respond with head(:unauthorized) if verification fails
  before_action do |controller|
    controller.send(:verify_jwt, PluginKeyService::PLUGIN_KEY)
  end

  before_action :detect_panel

  def index
    @project ||= begin
      project_response = jira_gateway.project(params[:project_id])
      assert project_response.success?
      project_response.parsed_response
    end

    respond_to do |format|
      format.html do |html|
        html.panel do
          @issue ||= begin
            issue_response = jira_gateway.issue(params[:issue_id])
            assert issue_response.success?
            issue_response.parsed_response
          end
          @service_buttons ||= ServiceLinkDecorator.decorate_collection(
            current_jwt_auth.service_buttons.where(project_id: params[:project_id]).ordered,
            context: { issue: @issue })
        end
      end
      format.json do
        render json: current_jwt_auth.service_buttons.where(project_id: params[:project_id]).ordered
      end
    end
  end

  def create
    service_button = current_jwt_auth.service_buttons.create!(
      params.require(:service_button).permit(:label, :name, :href, :title, :icon).merge(params.permit(:project_id)))

    render json: service_button
  end

  def update
    current_jwt_auth.service_buttons
      .find_by(params.permit(:project_id, :id))
      .update(params.require(:service_button).permit(:label, :name, :href, :title, :icon))

    render json: current_jwt_auth.service_buttons.find_by(params.permit(:project_id, :id))
  end

  def destroy
    current_jwt_auth.service_buttons.find_by(params.permit(:project_id, :id)).destroy
  end

  def move
    service_button = current_jwt_auth.service_buttons.find(params[:id])

    ReorderModelsService.(
      transaction_guard: ServiceButton,
        moved_object: service_button,
        all_objects: current_jwt_auth.service_buttons.where(project_id: service_button.project_id).ordered.to_a,
        params: params)
  end

  private

  def detect_panel
    request.variant = :panel if params.has_key?(:xdm_c) && params[:xdm_c].end_with?('service-buttons-panel')
  end

end