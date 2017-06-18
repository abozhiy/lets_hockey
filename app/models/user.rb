class User < ActiveRecord::Base

  has_many :users_teams
  has_many :teams, through: :users_teams

  before_validation :set_login

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  validates :password, length: { minimum: 6 }

  acts_as_authentic do |act|
    act.require_password_confirmation = false
    act.validate_email_field = true
    # act.crypto_provider = Authlogic::CryptoProviders::Sha512
    # act.perishable_token_valid_for = 3.month
  end

  private

  def set_login
    self.login = self.email
  end
end
