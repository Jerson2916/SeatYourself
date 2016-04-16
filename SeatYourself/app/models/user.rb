class User < ActiveRecord::Base

  has_secure_password
  validates :first_name, :last_name, :email, :phone, :password, presence: true

  has_many :reservations
  has_many :restaurants, through: :reservations

end
