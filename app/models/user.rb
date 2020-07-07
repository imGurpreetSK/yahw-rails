class User < ApplicationRecord
  validates :username, presence: true, length: 2...30, uniqueness: true
  validates :email, presence: true, length: 5...110, uniqueness: true, email: true, format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
end
