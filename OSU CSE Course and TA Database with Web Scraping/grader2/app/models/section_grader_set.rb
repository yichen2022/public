class SectionGraderSet < ApplicationRecord
	belongs_to :course_section
	has_rich_text :Names
	validates :CourseNumber, :inclusion => 1000..8999
end
