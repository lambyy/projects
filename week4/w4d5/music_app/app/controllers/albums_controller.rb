class AlbumsController < ApplicationController

  def show
    @album = Album.find_by(id: params[:id])
    render :show
  end

  def new
    @bands = Band.all
    @band = Band.find_by(id: params[:band_id])
    render :new
  end

  def create
    @album = Album.new(album_params)

    if @album.save
      redirect_to album_url(@album)
    else
      flash[:errors] = @album.errors.full_messages
      render :new
    end
  end

  private
  def album_params
    params.require(:album).permit(:title, :band_id, :studio, :year )
  end
end
