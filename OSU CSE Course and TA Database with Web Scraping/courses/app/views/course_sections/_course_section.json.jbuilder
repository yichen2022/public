json.extract! course_section, :id, :Name, :ClassNumber, :Component, :Location, :Times, :Instructor, :Session, :Topic, :created_at, :updated_at
json.url course_section_url(course_section, format: :json)
