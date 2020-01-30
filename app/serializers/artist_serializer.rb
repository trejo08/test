class ArtistSerializer < ActiveModel::Serializer
  # include FastJsonapi::ObjectSerializer
  type 'data'
  attributes :id, :name, :image, :genres, :popularity, :spotify_url

end