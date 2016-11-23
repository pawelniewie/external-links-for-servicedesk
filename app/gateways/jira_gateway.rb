class JiraGateway

  class << self
    def new(current_jwt_auth, *args)
      Class.new(AbstractJiraGateway) { |klass|
        klass.base_uri(current_jwt_auth.api_base_url)
      }.new(current_jwt_auth, *args)
    end
  end

  class AbstractJiraGateway
    include HTTParty
    include AtlassianJwtAuthentication::HTTParty

    # debug_output

    parser RecursiveJsonParser

    def initialize(current_jwt_auth)
      @current_jwt_auth = current_jwt_auth
    end

    def user(user_key)
      self.class.get_with_jwt('/rest/api/2/user', {
        query: {
          key: user_key
        },
        current_jwt_auth: @current_jwt_auth
      })
    end

    def project(project_id)
      self.class.get_with_jwt("/rest/api/2/project/#{project_id}", {
        current_jwt_auth: @current_jwt_auth
      })
    end

    def project_property(project_id, property_key, payload)
      self.class.put_with_jwt("/rest/api/2/project/#{project_id}/properties/#{property_key}", {
        current_jwt_auth: @current_jwt_auth,
        headers: {
          'Content-Type' => 'application/json'
        },
        body: payload.to_json
      })
    end

    def issue(issue_id_or_key, query = {})
      self.class.get_with_jwt("/rest/api/2/issue/#{issue_id_or_key}", {
        current_jwt_auth: @current_jwt_auth,
        query: query
      })
    end
  end

end