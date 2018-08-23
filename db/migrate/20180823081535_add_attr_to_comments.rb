class AddAttrToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :player_id, :integer
    add_column :comments, :post_id, :integer
  end
end
