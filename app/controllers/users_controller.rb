class UsersController < ApplicationController
  def show
    @user = User.find params[:id]
    spotify_user = RSpotify::User.new(@user.spotify_hash)
    @spotify_library = spotify_user.saved_tracks
  end
end