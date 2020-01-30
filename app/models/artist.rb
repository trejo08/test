class Artist < ApplicationRecord
  has_many :albums, dependent: :destroy
  accepts_nested_attributes_for :albums, reject_if: ->(attributes){ attributes['name'].blank? }, allow_destroy: true
end
