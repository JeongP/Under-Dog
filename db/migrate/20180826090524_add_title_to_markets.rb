class AddTitleToMarkets < ActiveRecord::Migration[5.0]
  def change
    add_column :markets, :title, :string
  end
end
