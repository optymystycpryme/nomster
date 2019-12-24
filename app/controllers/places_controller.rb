class PlacesController < ApplicationController
  def index
    @places = Place.order(:id).paginate(page: params[:page], per_page: 5)
  end

  def new
    @place = Place.new
  end

  def create
    Place.create(place_params)
    redirect_to root_path
  end

  def search
    @places = Place.all
    @search = params["search"]
    if @search.present?
      @name = @search["name"]
      @places = Place.where("name ILIKE ?", "%#{@name}%").order(:id).paginate(page: params[:page], per_page: 5)
    end
  end

  private

  def place_params
    params.require(:place).permit(:name, :address, :description)
  end
end
