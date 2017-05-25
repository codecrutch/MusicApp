class BandsController < ApplicationController
  before_action :ensure_logged_in

  def index
    @bands = Band.all
  end

  def new
    @band = Band.new
  end

  def show
    @band = Band.find(params[:id])
  end

  def create
    band = Band.new(band_params)

    if band.save
      redirect_to bands_url
    else
      render :new
    end
  end

  def update
    band = Band.find(params[:id])
    band.update(user_params)
  end

  def destroy
    band = Band.find(params[:id])
    band.destroy
  end

  private

  def band_params
    params.require(:band).permit(:name)
  end
end
