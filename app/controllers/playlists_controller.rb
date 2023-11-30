class PlaylistsController < ApplicationController
  def index
    @playlists = current_user.playlists
  end

  def show
    @playlist = Playlist.find(params[:id])
    @spotify_playlist = RSpotify::Playlist.find(session[:spotify_user], @playlist.spotify_id)
  end

  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = Playlist.new(playlist_params)
    @playlist.user = current_user
    if @playlist.save
      spotify_playlist = RSpotify::User.new(session[:spotify_user]).create_playlist!(@playlist.name)
      @playlist.update(spotify_id: spotify_playlist.id)
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
