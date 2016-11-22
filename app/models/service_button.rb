class ServiceButton < ApplicationRecord
  belongs_to :jwt_token

  validates :label, presence: true
  validates :href, presence: true
  validates :project_id, presence: true

  before_create :set_position

  after_commit :set_condition_property, on: [:create, :destroy]

  scope :ordered, -> { order(:position) }

  private

  def set_position
    self.position = (ServiceButton.where(project_id: self.project_id, jwt_token_id: self.jwt_token_id)
      .maximum(:position) || 0) + 1 unless self.position
  end

  def set_condition_property
    SetHasServiceButtonsOnProjectJob.perform_later(self.jwt_token_id, self.project_id)
  end
end

