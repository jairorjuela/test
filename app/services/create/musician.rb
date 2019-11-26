require "dry/transaction"

class Create::Musician
  include Dry::Transaction

  step :search_artist
  map  :build_params
  step :create_artist
  step :create_disks

  private

  def search_artist(input)
    artist_name = input[:artist_name].to_s
    pp " searching: #{artist_name}"
    artist = RSpotify::Artist.search(artist_name)

    if artist.empty?
      Failure "El artista no existe"
    else
      pp " found: #{artist_name}"
      Success artist
    end
  end

  def build_params(artist)
    a = {
      name: artist[0].name,
      image: artist[0].images[0]["url"],
      genres: artist[0].genres,
      popularity: artist[0].popularity,
      spotify_url: artist[0].href,
      spotify_id: artist[0].id
    }

      pp " built"
    a

  end

  def create_artist(artist)
    artist = Artist.create(artist)

    if artist.save
      pp "Artist created #{artist}"
      Success({ artist: artist })
    else
      pp "mori creando artistas"
      Failure artist.errors
    end
  end

  def create_disks(input)
    pp "creando discos perrones"
    Create::Discs.new.(artist: input[:artist])
  end
end
