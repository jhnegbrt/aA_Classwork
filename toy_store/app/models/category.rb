class Category < ApplicationRecord

  validates :category, presence: true, uniqueness: true

  has_many :toys,
  foreign_key: :category_id,
  class_name: "Toy"
end
