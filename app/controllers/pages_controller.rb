class PagesController < ApplicationController
  def home

  end

  def auth
    RSpotify.authenticate("74a5a213821741e1ae60ba4f2f0fac61", "2200ab1ce25c42d6b285a171b1aec60a")
    spotify_user = RSpotify::User.new(request.env['omniauth.auth'])

    @user = User.find_or_create_by({ name: spotify_user.id }) do |new_user|
      new_user.spotify_uri = spotify_user.uri
      new_user.spotify_hash = spotify_user.to_hash
    end

    redirect_to playlists_path
  end
end
