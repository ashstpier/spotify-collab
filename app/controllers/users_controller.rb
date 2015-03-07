class UsersController < ApplicationController
  def show
    @spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    # Now you can access user's private data, create playlists and much more
    playlist = @spotify_user.create_playlist!('my-awesome-playlist')

  end
end