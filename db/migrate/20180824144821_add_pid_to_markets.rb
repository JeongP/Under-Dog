class AddPidToMarkets < ActiveRecord::Migration[5.0]
  def change
    add_column :markets, :post_id, :integer
  end
end
