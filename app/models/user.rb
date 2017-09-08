class User < ApplicationRecord

  include Docs::User
  has_secure_password
  has_paper_trail

  # before_save :downcase_email
  # before_create :generate_confirmation_instructions

  # def downcase_email
  #   self.email = self.email.delete(' ').downcase
  # end

  # def generate_confirmation_instructions
  #   self.confirmation_token = SecureRandom.hex(10)
  #   self.confirmation_sent_at = Time.now.utc
  # end

  validates :email, presence: true, email: true

end
