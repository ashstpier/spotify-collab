RSpotify.authenticate("74a5a213821741e1ae60ba4f2f0fac61", "2200ab1ce25c42d6b285a171b1aec60a")
SPOTIFY_URL = "spotify:user:andy.kent:playlist:2AerYjAygaivqTW4XLGqau"
SPOTIFY_USERNAME = "andy.kent"
PLAYLIST_ID = SPOTIFY_URL.split('playlist:')[1]

class SpotifySandbox

  def initialize
    playlist = get_playlist
    create_playlist(playlist)

    puts Playlist.first.owner
  end

  private

  def get_playlist
    RSpotify::Playlist.find(SPOTIFY_USERNAME, PLAYLIST_ID)
  end

  def create_playlist(playlist)
    Playlist.find_or_create_by({ spotify_id: PLAYLIST_ID }) do |new_playlist|
      new_playlist.name = playlist.name
      new_playlist.owner = playlist.owner.id
    end
  end

end