class User < ApplicationRecord
  has_many :cars, dependent: :destroy
  validates :name, presence: true, length: { in: 3..10 }
  validates :user_name, presence: true, uniqueness: true, length: { in: 3..10 }
  validates :password, length: { in: 3..10 }

  has_secure_password

  validates_presence_of :password_digest
end
