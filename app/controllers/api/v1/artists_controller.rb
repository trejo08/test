class Api::V1::ArtistsController < Api::V1::BaseController
  before_action :set_artist, except: :index

  def index
    artists =  Artist.order(popularity: :desc)
    render json: artists
  end

  def albums
    albums = @artist.albums
    render json: albums
  end

  private
    def set_artist
      @artist = Artist.find(params[:id])
    end

end