namespace :artists do
  desc "Create Artists from yaml file and load data from Spotify API"
  task create_and_load_data: :environment do
    require 'active_record/fixtures'
    path = "#{Rails.root}/lib/tasks/artists.yml"
    YAML.load_file(path).with_indifferent_access[:artists].each do |artist|
      artist = Artist.create(name: artist)
      puts "artist created with id: #{artist.id}"
      spofity_artist = RSpotify::Artist.search(artist.name).first
      artist.image = spofity_artist.images.first["url"]
      artist.genres = spofity_artist.genres
      artist.popularity = spofity_artist.popularity
      artist.spotify_url = spofity_artist.external_urls["spotify"]
      artist.spotify_id = spofity_artist.id
      artist.save
    end
  end
end
