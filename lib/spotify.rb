RSpotify.authenticate("74a5a213821741e1ae60ba4f2f0fac61", "2200ab1ce25c42d6b285a171b1aec60a")
SPOTIFY_URL = "spotify:user:andy.kent:playlist:2AerYjAygaivqTW4XLGqau"
SPOTIFY_USERNAME = "andy.kent"
PLAYLIST_ID = SPOTIFY_URL.split('playlist:')[1]

class Spotify

  def initialize
    spotify_playlist = get_playlist
    playlist = create_playlist(spotify_playlist)

    spotify_playlist.tracks.each do |track|
      add_track(track, playlist)
    end
  end

  private

  def get_playlist
    RSpotify::Playlist.find(SPOTIFY_USERNAME, PLAYLIST_ID)
  end

  def create_playlist(playlist)
    Playlist.find_or_create_by({ spotify_id: playlist.id }) do |new_playlist|
      new_playlist.name = playlist.name
      new_playlist.spotify_uri = playlist.uri
      new_playlist.owner = playlist.owner.id
    end
  end

  def add_track(track, playlist)
    Track.find_or_create_by({ spotify_id: track.id }) do |new_track|
      new_track.name = track.name
      new_track.spotify_uri = track.uri
      new_track.duration = track.duration_ms
      new_track.album = track.album.name
      new_track.thumbnail = track.album.images[1]["url"] if track.album.images.length > 0
      new_track.artists = track.artists.map { |artist| artist.name }
      new_track.playlist_id = playlist.id
    end
  end

end