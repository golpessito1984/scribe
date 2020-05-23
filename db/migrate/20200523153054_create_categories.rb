class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :title, null: false
      t.string :description
      t.integer :order, default: 1
      t.integer :parent_id
      t.index :parent_id
      t.timestamps
    end
  end
end
