class UsersController < ApplicationController
  def spotify
    session[:spotify_user] = RSpotify::User.new(request.env['omniauth.auth'])
    redirect_to root_path, notice: 'Spotify login successful'
  end
end
