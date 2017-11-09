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
      if Restaurant.find_by(name: rest.name, city: rest.city)
        current_user.restaurants << Restaurant.find_by(name: rest.name, city: rest.city)
      else
        current_user.restaurants << rest
        rest.save
      end
    end
    Restaurant.cache.clear
    flash[:notice] = "You've succesfully added restaurants."
    redirect_to restaurants_path
  end

  private
  def restaurant_params
    params.require("restaurants").permit!
  end

end
