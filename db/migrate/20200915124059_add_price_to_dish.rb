class AddPriceToDish < ActiveRecord::Migration[6.0]
  def change
    add_column :dishes, :visits, :integer, default: 0
  end
end
