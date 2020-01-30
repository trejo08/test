class SongSerializer  < ActiveModel::Serializer
  # include FastJsonapi::ObjectSerializer
  type 'data'
  attributes :name, :spotify_url, :preview_url, :duration_ms, :explicit
end
