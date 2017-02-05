# Be sure to restart your server when you modify this file.

Logger.silencer = false

ActiveRecord::SessionStore::Session.serializer = :json
ActionDispatch::Session::ActiveRecordStore.session_class = Session

class HeaderSessionStore < ActionDispatch::Session::ActiveRecordStore
  private

  def set_cookie(_request, response, cookie)
    response.headers[key] = cookie[:value]

    Session.find_by_session_id(cookie[:value])
      .update_attribute(:expires_at, cookie[:expires]) if cookie[:expires].present?
  end
end

Rails.application.config.session_store HeaderSessionStore, key: "X-Cookie", cookie_only: false, expire_after: 1.hour
