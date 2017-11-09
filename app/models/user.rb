class User < ApplicationRecord
  has_many :user_restaurants
  has_many :restaurants, through: :user_restaurants
  has_secure_password
  validates :username, uniqueness: true, presence: true
  validates :email, presence: true
  validates :password, confirmation: true, presence: true

  def new
    @user = User.new
  end

end
