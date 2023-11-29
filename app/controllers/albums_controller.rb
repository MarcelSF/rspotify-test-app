class AlbumsController < ApplicationController
  skip_before_action :authenticate_user!
  def show
    @album = RSpotify::Album.find(params[:id])
  end
end
