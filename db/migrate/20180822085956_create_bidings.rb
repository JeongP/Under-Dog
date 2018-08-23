class CreateBidings < ActiveRecord::Migration[5.0]
  def change
    create_table :bidings do |t|
      t.integer :price
      t.boolean :success_bid
      t.integer :post_id
      t.integer :user_id
      t.integer :coin_count
      t.timestamps
    end
  end
end
