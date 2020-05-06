class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  validates :email_address, presence: true, uniqueness: true, format: /\A.+@.+\z/
  validates :password, on: :create, confirmation: true, length: { minimum: 5 }
end
