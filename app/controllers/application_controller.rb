class ApplicationController < ActionController::Base

  protected

  def jira_gateway
    JiraGateway.new(current_jwt_auth)
  end

end
