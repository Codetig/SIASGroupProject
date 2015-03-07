class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :title
      t.string :artist
      t.integer :bucket_id
      t.string :track_uri
      t.string :spotify_track_id 
      t.integer :play_count

      t.timestamps null: false
    end
  end
end
