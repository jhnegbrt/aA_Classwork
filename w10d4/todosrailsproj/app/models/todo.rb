class Todo < ApplicationRecord
    # def initialize(title, body, done)
    #     @title = title
    #     @body = body
    #     @done = done
    # end
    validates :done, inclusion: { in: [true, false] }
    validates :title, presence: true, uniqueness: true
end
