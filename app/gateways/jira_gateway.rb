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

    def internal_comment(issue_id_or_key, comment)
      self.class.post_with_jwt("/rest/servicedeskapi/request/#{issue_id_or_key}/comment", {
        current_jwt_auth: @current_jwt_auth,
        headers: {
          'Content-Type' => 'application/json'
        },
        body: {
          body: comment,
          public: false,
        }.to_json
      })
    end

    def entity(issue_id_or_key, entity_key, entity_body)
      self.class.put_with_jwt("/rest/api/2/issue/#{issue_id_or_key}/properties/#{entity_key}", {
        current_jwt_auth: @current_jwt_auth,
        headers: {
          'Content-Type' => 'application/json'
        },
        body: entity_body.to_json
      })
    end
  end
end