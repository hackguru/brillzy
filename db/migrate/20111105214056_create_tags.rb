class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.references :product
      t.references :page
      t.integer :top_position
      t.integer :left_position

      t.timestamps
    end
    add_index :tags, :product_id
    add_index :tags, :page_id
  end
end
