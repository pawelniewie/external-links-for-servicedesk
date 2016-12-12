class ApplicationController < ActionController::Base
  before_bugsnag_notify :add_user_info_to_bugsnag

  include AtlassianJwtAuthentication::Helper

  protected

  def jira_gateway
    JiraGateway.new(current_jwt_auth)
  end

  def add_user_info_to_bugsnag(notification)
    return unless current_jwt_user

    notification.user = {
      email: current_jwt_user.email,
      display_name: current_jwt_user.display_name,
      id: current_jwt_user.id
    }
  end
end
