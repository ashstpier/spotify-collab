class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|

      t.string :spotify_id
      t.string :spotify_uri
      t.string :name
      t.string :owner

      t.timestamps null: false
    end
  end
end
