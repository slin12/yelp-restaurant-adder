class RestaurantsController < ApplicationController
  def index
    if logged_in?
      @restaurants = current_user.restaurants
    else
      redirect_to login_path
    end
  end

  def create
    restaurant_params.each do |rest_name, value|
      rest = Restaurant.cache.find {|rest| rest.name == rest_name}
      current_user.restaurants << rest
      rest.save
    end
    Restaurant.cache.clear
    redirect_to restaurants_path
  end

  private
  def restaurant_params
    params.require("restaurants").permit!
  end

end
