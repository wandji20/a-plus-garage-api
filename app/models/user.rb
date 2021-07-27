class User < ApplicationRecord
  has_many :cars, dependent: :destroy
  validates :name, presence: true, length: { in: 3..10 }
  validates :user_name, presence: true, uniqueness: true

  has_secure_password

  validates_presence_of :email, :password_digest
end
