require "dry/transaction"

class Create::Melody
  include Dry::Transaction

  step :search_artist
  map :build_params
  step :create_disc

  private

  def search_artist(input)
    album_name = input[:album].name
    find_album = RSpotify::Album.search(album_name)

    if find_album.empty?
      Failure "El artista no existe"
    else
      Success input.merge(find_album: find_album)
    end
  end

  def build_params(album)
    songs_album = album[:find_album]
    album = album[:album]
    songs = Array.new

    songs_album[0].tracks.each do |song|
      one_song = {
        name: song.name,
        spotify_url: song.external_urls["spotify"],
        preview_url: song.preview_url,
        duration_ms: song.duration_ms,
        explicit: song.explicit,
        spotify_id: song.id,
        album: album
      }

      songs << one_song
    end

    songs
  end

  def create_disc(songs)
    all_songs = Array.new

    songs.each do |song|
      one_song = Song.create(song)
      all_songs << one_song
    end

    if all_songs.present?
      Success all_songs
    else
      Failure all_songs.errors
    end
  end
end
