class Evaluation < ApplicationRecord
	belongs_to :grader_application
	validates :InstructorName, :presence => true, format: { with: /\A[A-Za-z]*\s[A-Za-z]*\z/ }
	validates :StudentName, :presence => true
	validates :CourseNumber, :inclusion => 1000..8999
	validates :Dedication, :inclusion => 1..10
	validates :Performance, :inclusion => 1..10
      	validates :Cooperation, :inclusion => 1..10
      	validates :Initiative, :inclusion => 1..10
      	validates :Communication, :inclusion => 1..10
      	validates :Character, :inclusion => 1..10
      	validates :Responsiveness, :inclusion => 1..10
      	validates :Personality, :inclusion => 1..10
      	validates :Appearance, :inclusion => 1..10
      	validates :WorkHabit, :inclusion => 1..10
end
