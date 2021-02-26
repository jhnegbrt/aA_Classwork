class AddColumnToCats < ActiveRecord::Migration[5.2]
  def change
    add_column(:cats, :name, :string, null: false)
    add_timestamps(:cats)
    add_column(:cats, :description, :text, null: false)
    add_column(:cats, :sex, :string, limit: 2, null: false)
    add_column(:cats, :color, :string, null: false)
  end
end
