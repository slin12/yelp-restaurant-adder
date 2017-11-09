class Restaurant < ApplicationRecord
  has_many :user_restaurants
  has_many :users, through: :user_restaurants

  @@cached = []
  def self.cache
    @@cached
  end
end
