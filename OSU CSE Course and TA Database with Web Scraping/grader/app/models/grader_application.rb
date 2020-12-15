class GraderApplication < ApplicationRecord
	has_many :recommendations
	has_one :evaluation
	has_rich_text :AvailableTimes
	validates :Name, :presence => true, format: { with: /\A[A-Za-z]*\s[A-Za-z]*\z/ }
	validates :InterestedCourses, format: { with: /\d{4}/, message: "must have four digits"}
	validates :Email, format: { with: /\A[a-z]{1,}\.[1-9]{1}\d*\@[o][s][u]\.[e][d][u]\z/, message: "Email must be in the form name.#\@osu.edu"}
	validates :GPA, format: { with: /\A\b[0-3]{1}\.\d[0-3]\z|\A4\.000\b\z/, message: "must be from 0-4 with 3 decimal places"}
end
