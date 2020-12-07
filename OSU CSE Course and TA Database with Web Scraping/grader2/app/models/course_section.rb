class CourseSection < ApplicationRecord
	has_one :section_grader_set
	has_many :grader_application
end
