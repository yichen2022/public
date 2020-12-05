# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'httparty'
require 'nokogiri'

class Section
	attr_accessor :class_number
	attr_accessor :component
	attr_accessor :location
	attr_accessor :times
	attr_accessor :instructor
	attr_accessor :session
	attr_accessor :topic
	def initialize(num, comp, loc, time, ins, ses, top, grade)
		@class_number=num
		@component=comp
		@location=loc
		@times=time
		@instructor=ins
		@session=ses
		@topic=top
	end

	def class_number
		@class_number
	end
end


class Web_Scraping

	attr_accessor :courses

	def initialize()
		@courses=Array.new
	end

	def scraper()
		url="https://web.cse.ohio-state.edu/oportal/schedule_display"
		unparsed_page=HTTParty.get(url)
		parsed_page=Nokogiri::HTML(unparsed_page)

		total_courses=parsed_page.css('div.panel-heading')
		subsections=parsed_page.css('table.table-condensed')

		for i in 0..total_courses.count-1
			heading=total_courses.at(i).css('a').text
			total_rows_for_course=subsections.at(i).css('tr').count

			for j in 1..total_rows_for_course-1
				if subsections.at(i).css('tr').at(j).count>0
					num=subsections.at(i).css('tr').at(j).css('td').at(0).text
					comp=subsections.at(i).css('tr').at(j).css('td').at(1).text
					loc=subsections.at(i).css('tr').at(j).css('td').at(2).text
					time=subsections.at(i).css('tr').at(j).css('td').at(3).text
					ins=subsections.at(i).css('tr').at(j).css('td').at(4).text
					ses=subsections.at(i).css('tr').at(j).css('td').at(5).text
					top=subsections.at(i).css('tr').at(j).css('td').at(6).text
					record = CourseSection.where(Name: heading, ClassNumber: num).first_or_initialize
					record.Component = comp
					record.Location = loc
					record.Times = time
					record.Instructor = ins
					record.Session = ses
					record.Topic = top
					record.save
				end
			end
		end
	end
end

cse_web_scraping = Web_Scraping.new()

cse_web_scraping.scraper
