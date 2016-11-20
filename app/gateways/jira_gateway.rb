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
      response = self.class.get_with_jwt("/rest/api/2/project/#{project_id}", {
        current_jwt_auth: @current_jwt_auth
      })

      if response.success?
        RecursiveOpenStruct.new response.parsed_response
      end
    end

    def issue(issue_id_or_key)
      response = self.class.get_with_jwt("/rest/api/2/issue/#{issue_id_or_key}", {
        current_jwt_auth: @current_jwt_auth
      })

      if response.success?
        RecursiveOpenStruct.new response.parsed_response
      end
    end
  end
end