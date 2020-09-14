class AddMenuRefToDish < ActiveRecord::Migration[6.0]
  def change
    add_reference :dishes, :menu, null: true, foreign_key: true
  end
end
