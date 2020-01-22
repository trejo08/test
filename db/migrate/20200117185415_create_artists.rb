class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :name, default: ""
      t.string :image, default: ""
      t.text :genres, array: true, default: []
      t.integer :popularity
      t.string :spotify_url
      t.string :spotify_id

      t.timestamps
    end
  end
end
