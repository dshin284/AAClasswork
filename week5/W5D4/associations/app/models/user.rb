# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
    # instructors can have many courses
    # a course has one instructor
        # a course must belong to an instructor
    # has_many :enrolled_courses,
    #     primary_key: :id,
    #     foreign_key:
    #     class_name: :Course
    has_many :student_enrollments,
        primary_key: :id,
        foreign_key: :student_id,
        class_name: :Enrollment
    has_many :instructors,
        primary_key: :id,
        foreign_key: :instructor_id,
        class_name: :Course

end
