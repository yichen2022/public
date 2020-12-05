json.extract! recommendation, :id, :InstructorName, :InstructorDepartment, :InstructorCourse, :InstructorEmail, :StudentName, :Recommendation, :grader_application_id, :created_at, :updated_at
json.url recommendation_url(recommendation, format: :json)
