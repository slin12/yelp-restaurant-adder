class User < ApplicationRecord
  has_many :user_restaurants
  has_many :restaurants, through: :user_restaurants
  
  has_secure_password

  def new
    @user = User.new
  end

end
