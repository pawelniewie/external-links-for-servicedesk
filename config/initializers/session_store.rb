# Be sure to restart your server when you modify this file.

ActiveRecord::SessionStore::Session.serializer = :json

class HeaderSessionStore < ActionDispatch::Session::ActiveRecordStore
  private

  def set_cookie(request, response, cookie)
    response.headers[key] = cookie[:value]
  end
end

Rails.application.config.session_store HeaderSessionStore, key: "X-Cookie", cookie_only: false
