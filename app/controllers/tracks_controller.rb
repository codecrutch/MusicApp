class TracksController < ApplicationController
  before_action :ensure_logged_in

  def index
    @tracks = Track.all
  end

  def new
    @track = Track.new
    @albums = Album.all
  end

  def show
    @track = Track.find(params[:id])
  end

  def create
    @track = Track.new(track_params)
    @album = Album.find(params[:track][:album_id])

    if @track.save
      redirect_to band_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def update
    @track = Track.find(params[:id])
    @track.update(track_params)
  end

  def destroy
    Track.find(params[:id]).destroy
  end

  private

  def track_params
    params.require(:track).permit(:name, :lyrics, :album_id)
  end
end
