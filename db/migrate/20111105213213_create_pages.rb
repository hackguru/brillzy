class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.references :catalogue
      t.string :image_url
      t.integer :page_number

      t.timestamps
    end
    add_index :pages, :catalogue_id
  end
end
