class CreateBuckets < ActiveRecord::Migration
  def change
    create_table :buckets do |t|
      t.string :name
      t.text :desc
      t.integer :user_id
      t.string :image

      t.timestamps null: false
    end
  end
end
