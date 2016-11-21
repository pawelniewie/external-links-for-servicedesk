class LifecycleController < ApplicationController
  include AtlassianJwtAuthentication

  before_action :on_add_on_installed, only: [:installed]
  before_action :on_add_on_uninstalled, only: [:uninstalled]

  def installed
    user_key = params[:user_key]
    user = jira_gateway.user(user_key)

    if user.present?
      JwtUser.transaction do
        current_jwt_auth.jwt_users.find_or_create_by(user_key: user_key) do |jwt_user|
          jwt_user.name = user.name
          jwt_user.display_name = user.displayName
          jwt_user.email = user.emailAddress
        end
      end
    end

    head(:no_content)
  end

  def uninstalled
    head(:no_content)
  end

end
