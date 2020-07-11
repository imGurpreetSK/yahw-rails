class User < ApplicationRecord
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i.freeze

  before_save { self.email = email.downcase }

  has_many :articles

  validates :username, presence: true, length: 2..30, uniqueness: true
  validates :email, presence: true, length: 5..110, uniqueness: true, format: { with: EMAIL_REGEX }
  has_secure_password
end
