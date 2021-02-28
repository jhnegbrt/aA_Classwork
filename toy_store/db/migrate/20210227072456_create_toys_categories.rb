class CreateToysCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :toys_categories do |t|

      t.integer :toys_id, null: false
      t.integer :category_id, null: false

      t.timestamps
    end
  end
end
