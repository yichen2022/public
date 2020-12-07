class Recommendation < ApplicationRecord
	belongs_to :grader_application
	has_rich_text :Recommendation
	validates :InstructorName, :presence => true, format: { with: /\A[A-Za-z]*\s[A-Za-z]*\z/ }
	validates :InstructorEmail, format: { with: /\A[a-z]{1,}\.[1-9]{1}\d*\@[o][s][u]\.[e][d][u]\z/, message: "must be in the form name.#\@osu.edu"}
	validates :InstructorCourse, :inclusion => 1000..8999
	validates :StudentName, :presence => true
	validates :Recommendation, :presence => true
end
