class AlbumSerializer < ActiveModel::Serializer
  # include FastJsonapi::ObjectSerializer
  type 'data'
  attributes :id, :name, :image, :spotify_url, :total_tracks
end
