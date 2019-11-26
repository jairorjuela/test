require "dry/transaction"

class Create::Disc
  include Dry::Transaction

  step :search_artist
  map :build_params
  step :create_disc

  private

  def search_artist(input)
    artist_name = input[:artist].name
    artist = RSpotify::Artist.search(artist_name)

    if artist.empty?
      Failure "El artista no existe"
    else
      Success input.merge(artist_album: artist)
    end
  end

  def build_params(artist)
    artist_album = artist[:artist_album]
    artist = artist[:artist]
    albums = Array.new

    artist_album[0].albums.each do |album|
      one_album = {
        name: album.name,
        image: album.images[0]["url"],
        spotify_url: album.external_urls["spotify"],
        total_tracks: album.total_tracks,
        spotify_id: album.id,
        artist: artist
      }

      albums << one_album
    end

    albums
  end

  def create_disc(albums)
    all_albums = Array.new

    albums.each do |album|
      one_album = Album.create(album)
      Create::Melodies.new.(album: one_album)
      all_albums << one_album
    end

    if all_albums.present?
      Success all_albums
    else
      Failure all_albums.errors
    end
  end
end
