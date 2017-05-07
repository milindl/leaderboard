class AdminUser < ApplicationRecord
  validates :username, presence: true
  has_secure_password
end
