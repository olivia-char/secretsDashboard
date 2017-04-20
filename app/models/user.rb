class User < ActiveRecord::Base
  has_many :secrets
  has_many :likes
  has_many :secrets_liked, through: :likes, source: :secret 
  has_secure_password
  before_save :downcase_email
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :name, presence: true
  validates :email, presence: true, uniqueness: {case_sensitve: false}, format: {with: EMAIL_REGEX} 
  private
  def downcase_email
    self.email = email.downcase
  end
end
