class SearchesController < ApplicationController
  def search
    if logged_in?
      render :new
    else
      redirect_to login_path
    end
  end

  def results
    restaurants = Yelp.search(params[:type], params[:location])["businesses"]
    @array = restaurants.map do |restaurant_hash|
      rest = Restaurant.new(name: restaurant_hash["name"], phone: restaurant_hash["phone"],rating: restaurant_hash["rating"], city: restaurant_hash["location"]["city"])
      Restaurant.cache << rest
      rest
    end
    render :results
  end


end
