class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.string :name
      t.string :height
      t.string :weight
      t.string :team
      t.string :image1
      t.string :image2
      t.string :image3
      t.string :image4
      t.string :video
      t.integer :user_id
      t.timestamps
    end
  end
end
