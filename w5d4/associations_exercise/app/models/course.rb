class Course < ApplicationRecord

  has_many :enrollments,
  class_name: :Enrollment,
  primary_key: :id,
  foreign_key: :course_id

  has_many :enrolled_students,
  through: :enrollments,
  source: :user

  # has_many :prerequisite,
  # class_name: :Course,
  # primary_key: :prereq_id, #uses primary_key of the instance to find matching foreign_key in target table/class
  # foreign_key: :id

  belongs_to :prerequisite,
  class_name: :Course,
  primary_key: :id,
  foreign_key: :prereq_id, #uses foreign_key of the instance to find matching primary_key in target table/class
  optional: true #does not include presence: true

  belongs_to :instructor,
  class_name: :User,
  foreign_key: :instructor_id,
  primary_key: :id


end
