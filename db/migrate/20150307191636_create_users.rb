class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :spotify_uri
      t.text :spotify_hash

      t.timestamps null: false
    end
  end
end
