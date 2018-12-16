class PlacesController < ApplicationController
  before_action :find_place, only: [:show, :edit, :update, :destroy]

  def index
    # @places = Place.all
    @places = policy_scope(Place)
  end

  def show

  end

  def new
    @place = Place.new
    authorize @place
  end

  def create
    @place = Place.new(place_params)
    @place.user = current_user
    authorize @place
    if @place.save
      redirect_to places_path
    else
      render :new
    end
  end

  def edit

  end

  def update
    @place.update(place_params)
    if @place.save
      redirect_to place_path(@place)
    else
      render :edit
    end
  end

  def destroy
    @place.delete
    redirect_to places_path
  end

  private

  def find_place
    @place = Place.find(params[:id])
    authorize @place
  end

  def place_params
    params.require(:place).permit(:name, :address)
  end
end
