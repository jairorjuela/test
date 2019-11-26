class Song < ApplicationRecord
  belongs_to :album

  validates :name, :spotify_url, :preview_url, :duration_ms, :spotify_id, presence: true

  validates_numericality_of :duration_ms

  validates :name, :spotify_url, :spotify_id, uniqueness: true

  def self.play_random(genre_name)
    artist_by_genre = Artist.where("genres LIKE ?", "%#{genre_name}%")

    if artist_by_genre.present?
      all_albums = Array.new

      artist_by_genre.each do |artist|
        albums_by_artist = artist.albums
        all_albums << albums_by_artist
      end

      random_array = all_albums.sample.sample.songs.sample
    else
      {name: "no exite el genero"}
    end
  end
end
