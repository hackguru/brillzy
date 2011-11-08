class AddDescriptionToCatalogues < ActiveRecord::Migration
  def change
    add_column :catalogues, :description, :text
  end
end
