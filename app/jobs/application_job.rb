class ApplicationJob < ActiveJob::Base
  protected

  def jira(jwt_auth)
    @jira_gateway ||= JiraGateway.new(jwt_auth)
  end
end
