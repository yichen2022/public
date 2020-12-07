json.extract! grader_application, :id, :Name, :Email, :GPA, :InterestedCourses, :AvailableTimes, :CoursesTaken, :course_section_id, :created_at, :updated_at
json.url grader_application_url(grader_application, format: :json)
