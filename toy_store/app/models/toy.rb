class Toy < ApplicationRecord
  validates :name, :brand, :price, presence: true
  validates :name, uniqueness: {scope: :brand}

  belongs_to :category,
  foreign_key: :category_id,
  class_name: "Category"
end
