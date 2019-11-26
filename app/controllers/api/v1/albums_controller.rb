class Api::V1::AlbumsController < ApplicationController
  def songs
    songs = Album.find(params[:id]).songs
    render json: { data: songs }, except: [:id, :spotify_id, :updated_at, :created_at, :album_id]
  end
end
