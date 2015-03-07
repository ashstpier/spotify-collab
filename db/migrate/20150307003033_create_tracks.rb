class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|

      t.string :name
      t.string :artists, array: true
      t.string :album
      t.string :thumbnail
      t.string :spotify_id
      t.string :spotify_uri
      t.time :duration

      t.timestamps null: false
    end
  end
end
