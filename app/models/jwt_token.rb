class JwtToken < ActiveRecord::Base
  has_many :jwt_users, dependent: :destroy
  has_many :service_links, dependent: :destroy
end
