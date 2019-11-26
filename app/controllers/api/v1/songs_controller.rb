class Api::V1::SongsController < ApplicationController
  def random_song
    song = Song.play_random(params[:genre_name])
    render json: { data: song }, except: [:id, :spotify_id, :updated_at, :created_at, :album_id]
  end
end
