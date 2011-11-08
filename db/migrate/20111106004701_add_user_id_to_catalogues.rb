class AddUserIdToCatalogues < ActiveRecord::Migration
  def change
    add_column :catalogues, :user_id, :integer
  end
end
