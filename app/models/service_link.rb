class ServiceLink < ApplicationRecord
  belongs_to :jwt_token

  validates :label, presence: true
  validates :href, presence: true
  validates :color, presence: true
  validates :project_id, presence: true
end
