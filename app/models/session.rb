class Session < ActiveRecord::SessionStore::Session
  default_scope -> { where('expires_at > ? OR expires_at IS NULL', Time.now) }
end
