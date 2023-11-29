class PlaylistsController < ApplicationController
  def show
    @playlist = Playlist.find(params[:id])
  end

  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = Playlist.new(playlist_params)
    @playlist.user = current_user
    if @playlist.save
      @playlist = RSpotify::User.new(session[:spotify_user]).create_playlist!(@playlist.name)
      flash[:notice] = 'Playlist created'
      redirect_to playlist_path(@playlist.id)
    else
      render :new
    end
  end

  private

  def playlist_params
    params.require(:playlist).permit(:name)
  end
end
