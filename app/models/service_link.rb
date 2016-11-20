class ServiceLink < ApplicationRecord
  belongs_to :jwt_token

  validates :label, presence: true
  validates :href, presence: true
  validates :project_id, presence: true

  before_create :set_position

  scope :ordered, -> { order(:position) }

  private

  def set_position
    self.position = (ServiceLink.where(project_id: self.project_id, jwt_token_id: self.jwt_token_id)
      .maximum(:position) || 0) + 1 unless self.position
  end
end
