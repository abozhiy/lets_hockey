class User < ActiveRecord::Base

  has_many :users_teams
  has_many :teams, through: :users_teams

  acts_as_authentic do |c|
    c.login_field = :login
    c.require_password_confirmation = false
    c.crypto_provider = Authlogic::CryptoProviders::Sha512
    c.perishable_token_valid_for = 1.month
    c.validate_email_field = true
  end
end
