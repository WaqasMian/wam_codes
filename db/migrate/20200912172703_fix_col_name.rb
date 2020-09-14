class FixColName < ActiveRecord::Migration[6.0]
  def change
    rename_column :dishes, :type, :cateogry 
  end
end
