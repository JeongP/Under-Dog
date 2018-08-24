class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.boolean :ongoing
      t.string :image
      t.string :image2
      t.string :image3
      t.string :image4
      t.string :image5
      t.string :video 
      t.integer :coin_left
      t.integer :coin_rate
      t.integer :user_id
      t.datetime :bid_closing_at
      t.boolean :end_post
      t.float :reward_percent
      t.integer :money_guard
      t.string :reward_day
      t.string :reward_source
      t.string :reward_way
      t.string :reward_use
      t.timestamps
    end
  end
end
