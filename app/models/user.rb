class User < ApplicationRecord
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i.freeze

  validates :username, presence: true, length: 2...30, uniqueness: true
  validates :email, presence: true, length: 5...110, uniqueness: true, email: true, format: EMAIL_REGEX
end
