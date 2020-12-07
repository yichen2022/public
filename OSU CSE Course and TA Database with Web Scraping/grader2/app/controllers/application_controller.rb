class ApplicationController < ActionController::Base
	before_action :authenticate_user!

	require 'httparty'
	require 'nokogiri'

	def reseed
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
		redirect_to request.referrer
	end
end
