module ApplicationHelper
  include AtlassianJwtAuthentication

  def aui_version
    '6.0.2'
  end

  def create_session_token
    session.id
  end

  def body_class
    controller_name + ' ' + [controller_name, action_name].join('-')
  end
end
