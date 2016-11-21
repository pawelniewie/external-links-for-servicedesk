class LifecycleController < ApplicationController
  include AtlassianJwtAuthentication

  before_action :on_add_on_installed, only: [:installed]
  before_action :on_add_on_uninstalled, only: [:uninstalled]

  def installed
    CreateJwtUserJob.set(wait: 5.seconds).perform_later(current_jwt_auth.id, params[:user_key])

    head(:no_content)
  end

  def uninstalled
    head(:no_content)
  end

end
