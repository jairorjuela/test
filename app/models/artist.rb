class Artist < ApplicationRecord
  has_many :albums, dependent: :destroy

  validates :name, :image, :genres, :popularity, :spotify_url, :spotify_id, presence: true

  validates_numericality_of :popularity

  validates :name, :spotify_url, :spotify_id, uniqueness: true
end
