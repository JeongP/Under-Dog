class CreateMarkets < ActiveRecord::Migration[5.0]
  def change
    create_table :markets do |t|
      t.string :price
      t.integer :user_id

      t.timestamps
    end
  end
end
