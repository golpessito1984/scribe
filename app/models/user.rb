class User < ApplicationRecord
  has_secure_password

  validates :email, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/}
  validates :email, uniqueness: true
  validates :name, presence: true
  validates :password, length: { in: 8..20 }
end
