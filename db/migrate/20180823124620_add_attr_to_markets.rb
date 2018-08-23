class AddAttrToMarkets < ActiveRecord::Migration[5.0]
  def change
    add_column :markets, :name, :string
    add_column :markets, :count, :int
    add_column :markets, :rewards, :string
  end
end
