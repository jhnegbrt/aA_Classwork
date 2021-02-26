require "date"

class Cat < ApplicationRecord
  validates(:description, :sex, :name, :color, :birth_date, presence: true)

  attr_accessor :birth_date

  # new_cat = Cat.find_by(:birth_date)

  # new_cat = Cat.new("2010/01/01")

  def age

    # date = Date.new
    current = Date.today.year
    birth_date = self.birth_date.to_s
    year = birth_date.split("-")
    
  
    age = (current - year[0].to_i).to_s

  end

  
end