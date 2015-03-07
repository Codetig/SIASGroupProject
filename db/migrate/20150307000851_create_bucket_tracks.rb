class CreateBucketTracks < ActiveRecord::Migration
  def change
    create_table :bucket_tracks do |t|
      t.integer :bucket_id
      t.integer :track_id

      t.timestamps null: false
    end
  end
end
