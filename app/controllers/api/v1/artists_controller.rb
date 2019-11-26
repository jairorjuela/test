class Api::V1::ArtistsController < ApplicationController
  def index
    artists = Artist.order(popularity: :desc)
    render json: { data: artists }, except: [:spotify_id, :updated_at, :created_at]
  end

  def albums
    albums = Artist.find(params[:id]).albums
    render json: { data: albums }, except: [:spotify_id, :updated_at, :created_at, :artist_id]
  end
end
