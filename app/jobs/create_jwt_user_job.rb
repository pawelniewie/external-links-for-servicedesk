class CreateJwtUserJob < ApplicationJob
  def perform(jwt_token_id, user_key)
    jwt_auth = JwtToken.find(jwt_token_id)

    user_response = jira(jwt_auth).user(user_key)

    if user_response.success?
      user = user_response.parsed_response

      JwtUser.transaction do
        jwt_auth.jwt_users.find_or_create_by!(user_key: user_key) do |jwt_user|
          jwt_user.name = user.name
          jwt_user.display_name = user.displayName
          jwt_user.email = user.emailAddress
        end
      end
    end
  end
end