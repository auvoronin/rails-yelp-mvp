class RestaurantsController < ApplicationController
   before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  def show; end

  def new
    @restaurant = Restaurant.new
  end

  def edit
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def update
   if @restaurant.update(restaurant_params)
     redirect_to @restaurant, notice: 'Restaurant was successfully updated.'
   else
     render :edit
   end
 end

 # DELETE /restaurants/1
 def destroy
   @restaurant.destroy
   redirect_to restaurants_url, notice: 'Restaurant was successfully deleted.'
 end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category, :reviews)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
