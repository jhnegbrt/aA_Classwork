class DropToysCategories < ActiveRecord::Migration[5.2]
  def change
    drop_table :toys_categories
  end
end
