class User < ApplicationRecord
  validates :user_name, presence: true, length: { minimum: 2, maximum: 20 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum:6 }
end
