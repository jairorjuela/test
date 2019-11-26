class Album < ApplicationRecord
  belongs_to :artist
  has_many :songs,  dependent: :destroy

  validates :name, :image, :spotify_url, :total_tracks, :spotify_id, presence: true

  validates_numericality_of :total_tracks

  validates :name, :spotify_id, uniqueness: true
end
