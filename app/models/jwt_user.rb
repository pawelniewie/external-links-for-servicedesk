class JwtUser < ActiveRecord::Base
  belongs_to :jwt_token

  after_create_commit :subscribe

  private

  def subscribe
    RailsCommons::SubscribeJob.perform_later(self.email) if self.email.present?
  end
end