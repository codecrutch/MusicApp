class AlbumsController < ApplicationController
  before_action :ensure_logged_in

  def index
    @albums = Album.all
  end

  def new
    @album = Album.new
    @bands = Band.all
  end

  def show
    @album = Album.find(params[:id])
  end

  def create
    @album = Album.new(album_params)
    @band = Band.find(params[:album][:band_id])

    if @album.save
      redirect_to band_url(@band)
    else
      flash[:errors] = @album.errors.full_messages
      redirect_to new_band_album_url(@band)
    end
  end

  def update
    @album = Album.find(params[:id])
    @album.update(album_params)
  end

  def destroy
    Album.find(params[:id]).destroy
  end

  private

  def album_params
    params.require(:album).permit(:name, :band_id)
  end
end
