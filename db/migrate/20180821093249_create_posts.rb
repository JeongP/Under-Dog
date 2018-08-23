class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.boolean :ongoing
      t.string :image
      t.string :video 
      t.integer :coin_left
      t.integer :coin_rate
      t.integer :user_id
      t.datetime :bid_closing_at
      t.boolean :end_post
      t.timestamps
    end
  end
end
