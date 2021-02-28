class RenameColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :toys_categories, :toys_id, :toy_id
  end
end
