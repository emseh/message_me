class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, length: { minimum: 3, maximum: 15 },
                       uniquenees: { case_sensitive: false }
end
