class AddIndexToToys < ActiveRecord::Migration[5.2]
  def change
    add_index :toys, :category_id
  end
end
