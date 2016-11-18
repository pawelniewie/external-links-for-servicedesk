module ApplicationHelper
  include AtlassianJwtAuthentication

  def aui_version
    '6.0.2'
  end

  def create_session_token
    issued_at = Time.now.utc.to_i

    JWT.encode({
                   iss: current_jwt_auth.client_key,
                   iat: issued_at,
                   aud: [current_jwt_auth.addon_key],
                   context: {
                       user: {
                           userKey: current_jwt_user.user_key,
                           username: current_jwt_user.name,
                           displayName: current_jwt_user.display_name
                       }
                   }
               }, current_jwt_auth.shared_secret)
  end
end
