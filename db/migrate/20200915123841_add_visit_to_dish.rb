class AddVisitToDish < ActiveRecord::Migration[6.0]
  def change
    add_column :dishes, :price, :integer, default: 1000
  end
end
