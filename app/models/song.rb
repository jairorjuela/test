class Song < ApplicationRecord
  belongs_to :album

  validates :name, :spotify_url, :preview_url, :duration_ms, :spotify_id, presence: true

  validates_numericality_of :duration_ms

  validates :name, :spotify_url, :spotify_id, uniqueness: true
end
