namespace :artists do
  desc "Create Artists from yaml file and load data from Spotify API"
  task create_and_load_data: :environment do
    require 'active_record/fixtures'
    path = "#{Rails.root}/lib/tasks/artists.yml"
    YAML.load_file(path).with_indifferent_access[:artists].each do |artist|
      artist = Artist.create(name: artist)
      spofity_artist = RSpotify::Artist.search(artist.name).first
      artist = prepare_artist(artist, spofity_artist)
      albums = get_albums(artist, spofity_artist)
      artist.albums_attributes = albums
      artist.save
      puts "artist #{artist.name} saved with ID: #{artist.id}"
    end
  end

  def prepare_artist(artist, spofity_artist)
    artist.image = spofity_artist.images.first["url"]
    artist.genres = spofity_artist.genres
    artist.popularity = spofity_artist.popularity
    artist.spotify_url = spofity_artist.external_urls["spotify"]
    artist.spotify_id = spofity_artist.id
    artist
  end

  def get_albums(artist, spotify_data)
    albums = []
    spotify_data.albums.each do |album|
      spot_album = RSpotify::Album.find(album.id)
      albums << {
        name: spot_album.name,
        image: !spot_album.images.blank? ? spot_album.images.first["url"] : "",
        spotify_url: spot_album.external_urls["spotify"] || "",
        total_tracks: spot_album.total_tracks,
        spotify_id: spot_album.id
      }
    end
    albums
  end
  
end
