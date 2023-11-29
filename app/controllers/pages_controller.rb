class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if params[:query]
      @albums = RSpotify::Album.search(params[:query])
    end
  end
end
