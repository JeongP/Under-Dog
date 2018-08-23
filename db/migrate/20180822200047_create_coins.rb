class CreateCoins < ActiveRecord::Migration[5.0]
  def change
    create_table :coins do |t|
      t.integer :reward
      t.integer :post_id
      t.integer :user_id

      t.timestamps
    end
  end
end
