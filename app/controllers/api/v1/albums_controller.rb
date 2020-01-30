class Api::V1::AlbumsController < ApplicationController
  before_action :set_artist

  def index
    # albums =  Album.order(total_tracks: :asc)
    albums = @artist.albums
    render json: albums
  end

  private
    def set_artist
      @artist = Artist.find(params[:artist_id])
    end
end
