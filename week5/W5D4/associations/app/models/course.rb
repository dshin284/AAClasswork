# == Schema Information
#
# Table name: courses
#
#  id            :bigint           not null, primary key
#  name          :string
#  prereq_id     :integer
#  instructor_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Course < ApplicationRecord
    # instructors can have many courses
    # a course has one instructor
        # a course must belong to an instructor
    # <<associate>> METHOD_NAME(
    #     OTHER THINGS GOE IN HERE
    # )
    
    has_many :course_enrollments,
        primary_key: :id,
        foreign_key: :course_id,
        class_name: :Enrollment

    belongs_to :instructor,
        foreign_key: :instructor_id,
        primary_key: :id,
        class_name: :User
    
end
