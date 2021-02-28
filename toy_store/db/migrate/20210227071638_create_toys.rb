class CreateToys < ActiveRecord::Migration[5.2]
  def change
    create_table :toys do |t|

      t.string :name, null: false
      t.string :brand, null: false
      t.integer :price, null: false

      t.timestamps
    end
  end
end
