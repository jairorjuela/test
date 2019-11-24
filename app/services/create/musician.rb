require "dry/transaction"

class Create::Musician
  include Dry::Transaction

  step :search_artist
  map  :build_params
  step :create_artist

  private

  def search_artist(input)
    artist_name = input[:artist_name].to_s
    artist = RSpotify::Artist.search(artist_name)

    if artist.empty?
      Failure "El artista no existe"
    else
      Success artist
    end
  end

  def build_params(artist)
    {
      name: artist[0].name,
      image: artist[0].images[0]["url"],
      genres: artist[0].genres,
      popularity: artist[0].popularity,
      spotify_url: artist[0].href,
      spotify_id: artist[0].id
    }
  end

  def create_artist(artist)
    artist = Artist.create(artist)
    Create::Discs.new.(artist: artist)

    if artist.save
      Success artist
    else
      Failure artist.errors
    end
  end
end
