class PlacesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]

  def index
    @places = Place.order(:id).paginate(page: params[:page], per_page: 5)
  end

  def new
    @place = Place.new
  end

  def create
    current_user.places.create(place_params)
    redirect_to root_path
  end

  def show
    @place = Place.find(params[:id])
    @photo = Photo.new
  end

  def edit
    @place = Place.find(params[:id])
    if @place.user != current_user
      return render plain: "Not allowed", status: :forbidden
    end
  end

  def update
    @place = Place.find(params[:id])
    if @place.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end

    @place.update_attributes(place_params)
    redirect_to place_path(@place)
  end

  def destroy
    @place = Place.find(params[:id])
    if @place.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end
    @place.destroy
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
